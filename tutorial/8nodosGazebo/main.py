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


print("Taking off!")
vehicle.simple_takeoff(target_altitude)  # Take off to target altitude
time.sleep(10)

def uavSendMessage(mavlink_sysid):
# Process incoming messages
    #cont=0
    while True:
        while ns3interface.message_available():
            payload, sender = ns3interface.recvfrom()
            seqnum, lat, lon = struct.unpack("<Idd", payload)
            distance = helper.get_distance_metres(
            LocationGlobalRelative(lat, lon),
            vehicle.location.global_relative_frame
            )
            print('The misson vehicle {} received a message of base: seqnum={} distance={} meters'.format(mavlink_sysid, seqnum, distance))

            # if seqnum > 0:
            #     cont = cont+1
            #     ns3interface.sendto(struct.pack("<Idd", mavlink_sysid, sender, cont), sender) # for ns-3 1 is equals to node 2 becaise the base station is node 0
            #     print("UAV {} sends return to {}: {} message, status OK".format(mavlink_sysid, sender, cont))
            time.sleep(.1)



# uavs message behavior threads ---------
# uav0= Thread(target=uavSendMessage, args=[1])
# uav1= Thread(target=uavSendMessage, args=[2])
# uav2= Thread(target=uavSendMessage, args=[3])

# base station

# We will store the position and heading of each UAV (except base)  as well as
# the absolute timestamp we receive each piece of information
uav_positions = dict()
seqnum0 = 0
seqnum1=10000
seqnum2=20000



if mavlink_sysid == 1:
    # We are the "reference" vehicle; we just hover a fixed point and
    # continuosly broadcast our position and a sequence number using two nodes

    lat = vehicle.location.global_relative_frame.lat
    lon = vehicle.location.global_relative_frame.lon
    startMissionPoint = LocationGlobalRelative(lat, lon, target_altitude)
    MissionPoint = LocationGlobalRelative(-27.60260,-48.51834,target_altitude)
    vehicle.simple_goto(startMissionPoint, groundspeed=30)

    while True:

        ns3interface.sendto(struct.pack("<Idd", seqnum0, lat, lon), 1) # for ns-3 1 is equals to node 2 becaise the base station is node 0
        ns3interface.sendto(struct.pack("<Idd", seqnum0, lat, lon), 2) # for ns-3 2 is equals to node 3
    #    ns3interface.sendto(struct.pack("<Idd", seqnum, lat, lon), 3) # for ns-3 2 is equals to node 3
        seqnum0 = seqnum0 + 1
        print ('UAV {} sends seqnum={} messages'.format(mavlink_sysid, seqnum0))
        time.sleep(.5)


        currentPosition = vehicle.location.global_relative_frame
        distanceOfEnd = helper.get_distance_metres(MissionPoint, currentPosition)

        while (distanceOfEnd > ShortestDistance):
        # diferenca entre o ponto de inicio da prova e a distancia minima entre veiculos
            vehicle.simple_goto(MissionPoint, groundspeed=30)
            currentPosition = vehicle.location.global_relative_frame
            distanceOfEnd = helper.get_distance_metres(MissionPoint, currentPosition)
            time.sleep(.1)

        distanceOfBegin = helper.get_distance_metres(startMissionPoint, currentPosition)

        while (distanceOfBegin > ShortestDistance):
            vehicle.simple_goto(startMissionPoint, groundspeed=30)
            currentPosition = vehicle.location.global_relative_frame
            distanceOfBegin = helper.get_distance_metres(startMissionPoint, currentPosition)
            time.sleep(.1)



        print("Landing!")
        vehicle.mode = VehicleMode("RTL")


elif mavlink_sysid == 2:

    lat = vehicle.location.global_relative_frame.lat
    lon = vehicle.location.global_relative_frame.lon
    startMissionPoint = LocationGlobalRelative(lat, lon, target_altitude)
    MissionPoint = LocationGlobalRelative(-27.60349,-48.51796,target_altitude)
    vehicle.simple_goto(startMissionPoint, groundspeed=10)


    while True:

        ns3interface.sendto(struct.pack("<Idd", seqnum1, lat, lon), 0) # for ns-3 1 is equals to node 2 becaise the base station is node 0
        ns3interface.sendto(struct.pack("<Idd", seqnum1, lat, lon), 2) # for ns-3 2 is equals to node 3
    #    ns3interface.sendto(struct.pack("<Idd", seqnum, lat, lon), 3) # for ns-3 2 is equals to node 3
        seqnum1 = seqnum1 + 1
        print ('UAV {} sends seqnum={} messages'.format(mavlink_sysid, seqnum1))
        time.sleep(.5)


        currentPosition = vehicle.location.global_relative_frame
        distanceOfEnd = helper.get_distance_metres(MissionPoint, currentPosition)

        while (distanceOfEnd > ShortestDistance):
        # diferenca entre o ponto de inicio da prova e a distancia minima entre veiculos
            vehicle.simple_goto(MissionPoint, groundspeed=10)
            currentPosition = vehicle.location.global_relative_frame
            distanceOfEnd = helper.get_distance_metres(MissionPoint, currentPosition)
            time.sleep(.1)

        distanceOfBegin = helper.get_distance_metres(startMissionPoint, currentPosition)

        while (distanceOfBegin > ShortestDistance):
            vehicle.simple_goto(startMissionPoint, groundspeed=10)
            currentPosition = vehicle.location.global_relative_frame
            distanceOfBegin = helper.get_distance_metres(startMissionPoint, currentPosition)
            time.sleep(.1)



        print("Landing!")
        vehicle.mode = VehicleMode("RTL")



elif mavlink_sysid == 3:
    #position in map in relation to base (-1, -1,5)
    lat = vehicle.location.global_relative_frame.lat
    lon = vehicle.location.global_relative_frame.lon
    startMissionPoint = LocationGlobalRelative(lat, lon, target_altitude)
    MissionPoint = LocationGlobalRelative(-27.60391, -48.51789, target_altitude)
    vehicle.simple_goto(startMissionPoint, groundspeed=20)

    while True:

        ns3interface.sendto(struct.pack("<Idd", seqnum2, lat, lon), 0) # for ns-3 1 is equals to node 2 becaise the base station is node 0
        ns3interface.sendto(struct.pack("<Idd", seqnum2, lat, lon), 1) # for ns-3 2 is equals to node 3
    #    ns3interface.sendto(struct.pack("<Idd", seqnum, lat, lon), 3) # for ns-3 2 is equals to node 3
        seqnum2 = seqnum2 + 1
        print ('UAV {} sends seqnum={} messages'.format(mavlink_sysid, seqnum2))
        time.sleep(.5)


        currentPosition = vehicle.location.global_relative_frame
        distanceOfEnd = helper.get_distance_metres(MissionPoint, currentPosition)


        while (distanceOfEnd > ShortestDistance):
            # diferenca entre o ponto de inicio da prova e a distancia minima entre veiculos
            vehicle.simple_goto(MissionPoint, groundspeed=20)
            currentPosition = vehicle.location.global_relative_frame
            distanceOfEnd = helper.get_distance_metres(MissionPoint, currentPosition)
            time.sleep(.1)

        distanceOfBegin = helper.get_distance_metres(startMissionPoint, currentPosition)

        while (distanceOfBegin > ShortestDistance):
            vehicle.simple_goto(startMissionPoint, groundspeed=20)
            currentPosition = vehicle.location.global_relative_frame
            distanceOfBegin = helper.get_distance_metres(startMissionPoint, currentPosition)
            time.sleep(.1)


        print("Landing!")
        vehicle.mode = VehicleMode("RTL")



vehicle.close()

sys.exit("End of experiment!")
