# DroneKit-Python program based on the "Simple Go To (Copter)" example.
# Time is synchronized to simulation clock through the "simtime" library.

import helper
import math
import ns3interface
import simtime
import struct
import sys
import time
from threading import Thread
import pdb ## biblioteca de rastreamento

# pip install --user dronekit
from dronekit import connect, VehicleMode, LocationGlobalRelative
from pymavlink import mavutil

# Synchronize time.time() and time.sleep(n) with simulation clock
simtime_port = int(sys.argv[1])
simtime.connect(simtime_port)

# Parse other commandline arguments
uav_name, mavlink_sysid, mavlink_port = sys.argv[2].split(':')
mavlink_sysid = int(mavlink_sysid)
mavlink_port = int(mavlink_port)

# Connect to the ns3 network simulator
ns3interface.connect('127.0.0.1', mavlink_sysid - 1)

# Connect to the Vehicle
vehicle = connect(
    'tcp:127.0.0.1:{}'.format(mavlink_port),
    source_system=mavlink_sysid + 100)

# ArduCopter initialisation can take a really long time
vehicle.wait_ready('gps_0', 'armed', 'mode', 'attitude', timeout=100)

# Don't try to arm until autopilot is ready
while not vehicle.is_armable:
    print(" Waiting for vehicle to initialise...")
    time.sleep(5)

print("Arming motors")
# Copter should arm in GUIDED mode
vehicle.mode = VehicleMode("GUIDED")
vehicle.armed = True


# Confirm vehicle armed before attempting to take off
while not vehicle.armed:
    print(" Waiting for arming...")
    time.sleep(1)

##pdb.set_trace()

target_altitude = 5
ShortestDistance = 2
UavArrived1 = False
UavArrived2 = False

print("Taking off!")
vehicle.simple_takeoff(target_altitude)  # Take off to target altitude
time.sleep(10)

def uavSendMessage(mavlink_sysid):
# Process incoming messages
    while True:
        while ns3interface.message_available():
            payload, sender = ns3interface.recvfrom()
            seqnum, lat, lon = struct.unpack("<Idd", payload)
            distance = helper.get_distance_metres(
            LocationGlobalRelative(lat, lon),
            vehicle.location.global_relative_frame
            )
            print('The misson vehicle {} received a message of base: seqnum={} distance={} meters'.format(mavlink_sysid, seqnum, distance))
            time.sleep(.1)

# uavs message behavior threads ---------
uav1= Thread(target=uavSendMessage, args=[2])
uav2= Thread(target=uavSendMessage, args=[3])

# base station

# We will store the position and heading of each UAV (except base)  as well as
# the absolute timestamp we receive each piece of information
uav_positions = dict()
seqnum = 1

if mavlink_sysid == 1:
    # We are the "reference" vehicle; we just hover a fixed point and
    # continuosly broadcast our position and a sequence number using two nodes
    if (UavArrived1==False and UavArrived2==False):
        while True:
            lat = vehicle.location.global_relative_frame.lat
            lon = vehicle.location.global_relative_frame.lon
            vehicle.simple_goto(LocationGlobalRelative(lat, lon, target_altitude))
            ns3interface.sendto(struct.pack("<Idd", seqnum, lat, lon), ns3interface.BROADCAST) # for ns-3 1 is equals to node 2 becaise the base station is node 0
            # ns3interface.sendto(struct.pack("<Idd", seqnum, lat, lon), 2) # for ns-3 2 is equals to node 3
            # ns3interface.sendto(struct.pack("<Idd", seqnum, lat, lon), 3) # for ns-3 2 is equals to node 3
            seqnum = seqnum + 1
            print ('Ground Control Station sended seqnum={} messages'.format(seqnum))
            time.sleep(.5)
    else:
            vehicle.mode = VehicleMode("LAND")
            print('SCENARIO1 ENDED')
            vehicle.close()
            sys.exit()

elif mavlink_sysid == 2:

    lat = vehicle.location.global_relative_frame.lat
    lon = vehicle.location.global_relative_frame.lon
    startMissionPoint = LocationGlobalRelative(lat, lon, target_altitude)
    MissionPoint = LocationGlobalRelative(-27.604122, -48.518019,target_altitude)
    vehicle.simple_goto(startMissionPoint)

    while True:
        uav1.start()
        currentPosition = vehicle.location.global_relative_frame
        distanceOfEnd = helper.get_distance_metres(MissionPoint, currentPosition)

        while (distanceOfEnd > ShortestDistance):
        # diferenca entre o ponto de inicio da prova e a distancia minima entre veiculos
            vehicle.simple_goto(MissionPoint)
            currentPosition = vehicle.location.global_relative_frame
            distanceOfEnd = helper.get_distance_metres(MissionPoint, currentPosition)
            time.sleep(.1)

        distanceOfBegin = helper.get_distance_metres(startMissionPoint, currentPosition)

        while (distanceOfBegin > ShortestDistance):
            vehicle.simple_goto(startMissionPoint)
            currentPosition = vehicle.location.global_relative_frame
            distanceOfBegin = helper.get_distance_metres(startMissionPoint, currentPosition)
            time.sleep(.1)

        uav1.join()
        UavArrived1 = True
        vehicle.mode = VehicleMode("LAND")


elif mavlink_sysid == 3:
    #position in map in relation to base (-1, -1,5)
    lat = vehicle.location.global_relative_frame.lat
    lon = vehicle.location.global_relative_frame.lon
    startMissionPoint = LocationGlobalRelative(lat, lon, target_altitude)
    MissionPoint = LocationGlobalRelative(-27.604034, -48.518743, target_altitude)
    vehicle.simple_goto(startMissionPoint)

    while True:

        uav2.start()
        currentPosition = vehicle.location.global_relative_frame
        distanceOfEnd = helper.get_distance_metres(MissionPoint, currentPosition)


        while (distanceOfEnd > ShortestDistance):
            # diferenca entre o ponto de inicio da prova e a distancia minima entre veiculos
            vehicle.simple_goto(MissionPoint)
            currentPosition = vehicle.location.global_relative_frame
            distanceOfEnd = helper.get_distance_metres(MissionPoint, currentPosition)
            time.sleep(.1)

        distanceOfBegin = helper.get_distance_metres(startMissionPoint, currentPosition)

        while (distanceOfBegin > ShortestDistance):
            vehicle.simple_goto(startMissionPoint)
            currentPosition = vehicle.location.global_relative_frame
            distanceOfBegin = helper.get_distance_metres(startMissionPoint, currentPosition)
            time.sleep(.1)


        uav2.join()
        UavArrived2 = True
        vehicle.mode = VehicleMode("LAND")

# This line cannot be reached in this example
vehicle.close()
