# DroneKit-Python program based on the "Simple Go To (Copter)" example.
# Time is synchronized to simulation clock through the "simtime" library.

import helper
import math
import ns3interface
import simtime
import struct
import sys
import time

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

print("Taking off!")
target_altitude = 5 + mavlink_sysid * 2
ShortestDistance = 2
ts = time.time()



vehicle.simple_takeoff(target_altitude)  # Take off to target altitude
time.sleep(1)

while True:
#    print(" Current altitude: {}".format(vehicle.location.global_relative_frame.alt))
    # Break and return from function just below target altitude.
    if vehicle.location.global_relative_frame.alt >= target_altitude * 0.95:
        print("Reached target altitude")
        break
    time.sleep(1)


#ending the running
end1=0
end2=0
end3=0

# uavs behavior ---------

# base station

# We will store the position and heading of each UAV (except base)  as well as
# the absolute timestamp we receive each piece of information
uav_positions = dict()

# This is our control loop (10 Hz)
while True:
    time.sleep(1 / 10.0)

    # Update this node's position in the uav_positions dictionary
    uav_positions[ns3interface.local_id()] = (
        vehicle.location.global_relative_frame.lat,
        vehicle.location.global_relative_frame.lon,
        vehicle.location.global_relative_frame.alt,
        vehicle.heading,
        time.time()
    )

    # Broadcast it to the other agents
    ns3interface.sendto(struct.pack("<dddHd",
        uav_positions[ns3interface.local_id()][0], # lat
        uav_positions[ns3interface.local_id()][1], # lon
        uav_positions[ns3interface.local_id()][2], # alt
        uav_positions[ns3interface.local_id()][3], # heading
        uav_positions[ns3interface.local_id()][4]  # timestamp
    ), ns3interface.BROADCAST)

    # Process incoming messages
    while ns3interface.message_available():
        payload, sender = ns3interface.recvfrom()
        uav_positions[sender] = struct.unpack("<dddHd", payload)

    # Delete entries that have not been updated for more than one second
    for uav_id in list(uav_positions.keys()):
        if uav_positions[uav_id][4] + 1.0 < time.time():
            del uav_positions[uav_id]

    for uav_id, (lat, lon, alt, heading, timestamp) in uav_positions.items():
        if uav_id == 0:
            seqnum = 1
            #position in map in relation to base (+1, +1,5)
            lat = vehicle.location.global_relative_frame.lat
            lon = vehicle.location.global_relative_frame.lon
            startMissionPoint = LocationGlobalRelative(lat, lon, target_altitude)
            MissionPoint = LocationGlobalRelative(-27.60349,-48.51796,target_altitude) #60.69m
            vehicle.simple_goto(startMissionPoint)


            while True:


                # Set airspeed using attribute
                vehicle.groundspeed = 20 #m/s

                currentPosition = vehicle.location.global_relative_frame
                distanceOfBegin = helper.get_distance_metres(startMissionPoint, currentPosition)

                while (distanceOfBegin > ShortestDistance):
                    currentPosition = vehicle.location.global_relative_frame
                    distanceOfBegin = helper.get_distance_metres(startMissionPoint, currentPosition)
                    time.sleep(.1)

                distanceOfEnd = helper.get_distance_metres(MissionPoint, currentPosition)

                while (distanceOfEnd > ShortestDistance):
                    distanceOfEnd = helper.get_distance_metres(MissionPoint, currentPosition)
                    currentPosition = vehicle.location.global_relative_frame
                    vehicle.simple_goto(MissionPoint)
                    time.sleep(.1)

                vehicle.mode = VehicleMode("RTL")
                # Process incoming messages
                # while ns3interface.message_available():
                #     payload, sender = ns3interface.recvfrom()
                #     seqnum, lat, lon = struct.unpack("<Idd", payload)
                #     distance = helper.get_distance_metres(
                #         LocationGlobalRelative(lat, lon),
                #         vehicle.location.global_relative_frame
                #     )
                #     print('[{}] The misson vehicle 1 received a message of base: seqnum={} distance={} meters'.format(time.time(),seqnum, distance))

                if uav_id != ns3interface.local_id():
                    # Print list of current uav_positions entries
                    print('[{}] UAV {} currently knows about {}'.format(
                        time.time(),
                        ns3interface.local_id(),
                        ', '.join(map(str, sorted(uav_positions)))
                    ))

                    time.sleep(.1)

        elif uav_id == 1:
            #position in map in relation to base (+1, +1,5)
            lat = vehicle.location.global_relative_frame.lat
            lon = vehicle.location.global_relative_frame.lon
            startMissionPoint = LocationGlobalRelative(lat, lon, target_altitude)
            MissionPoint = LocationGlobalRelative(-27.60325,-48.51906,target_altitude) #101m
            vehicle.simple_goto(startMissionPoint)

            while True:
                # Set airspeed using attribute
                vehicle.groundspeed = 30 #m/s
                currentPosition = vehicle.location.global_relative_frame
                distanceOfBegin = helper.get_distance_metres(startMissionPoint, currentPosition)

                while (distanceOfBegin > ShortestDistance):
                    currentPosition = vehicle.location.global_relative_frame
                    distanceOfBegin = helper.get_distance_metres(startMissionPoint, currentPosition)
                    time.sleep(.1)

                distanceOfEnd = helper.get_distance_metres(MissionPoint, currentPosition)

                while (distanceOfEnd > ShortestDistance):
                    distanceOfEnd = helper.get_distance_metres(MissionPoint, currentPosition)
                    currentPosition = vehicle.location.global_relative_frame
                    vehicle.simple_goto(MissionPoint)
                    time.sleep(.1)

                vehicle.mode = VehicleMode("RTL")
                # Process incoming messages
                # while ns3interface.message_available():
                #     payload, sender = ns3interface.recvfrom()
                #     seqnum, lat, lon = struct.unpack("<Idd", payload)
                #     distance = helper.get_distance_metres(
                #         LocationGlobalRelative(lat, lon),
                #         vehicle.location.global_relative_frame
                #     )
                #     print('[{}] The misson vehicle 2 received a message of base: seqnum={} distance={} meters'.format(time.time(),seqnum, distance))
                #
                if uav_id != ns3interface.local_id():
                    # Print list of current uav_positions entries
                    print('[{}] UAV {} currently knows about {}'.format(
                        time.time(),
                        ns3interface.local_id(),
                        ', '.join(map(str, sorted(uav_positions)))
                    ))

                    time.sleep(.1)



        elif uav_id == 2:

            #position in map in relation to base (-1, -1,5)

            lat = vehicle.location.global_relative_frame.lat
            lon = vehicle.location.global_relative_frame.lon
            startMissionPoint = LocationGlobalRelative(lat, lon, target_altitude)
            MissionPoint = LocationGlobalRelative(-27.60391, -48.51789, target_altitude) #46,78
            vehicle.simple_goto(startMissionPoint)



            while True:

                # Set airspeed using attribute
                vehicle.groundspeed = 10 #m/s

                currentPosition = vehicle.location.global_relative_frame
                distanceOfBegin = helper.get_distance_metres(startMissionPoint, currentPosition)

                while (distanceOfBegin > ShortestDistance):
                    currentPosition = vehicle.location.global_relative_frame
                    distanceOfBegin = helper.get_distance_metres(startMissionPoint, currentPosition)
                    time.sleep(.1)

                distanceOfEnd = helper.get_distance_metres(MissionPoint, currentPosition)

                while (distanceOfEnd > ShortestDistance):
                    distanceOfEnd = helper.get_distance_metres(MissionPoint, currentPosition)
                    currentPosition = vehicle.location.global_relative_frame
                    vehicle.simple_goto(MissionPoint)
                    time.sleep(.1)

                vehicle.mode = VehicleMode("RTL")
                # Process incoming messages
                # while ns3interface.message_available():
                #     payload, sender = ns3interface.recvfrom()
                #     seqnum, lat, lon = struct.unpack("<Idd", payload)
                #     distance = helper.get_distance_metres(
                #         LocationGlobalRelative(lat, lon),
                #         vehicle.location.global_relative_frame
                #     )
                #     print('[{}] The mission vehicle 3 received a message of base: seqnum={} distance={} meters'.format(time.time(),seqnum, distance))
                #
                if uav_id != ns3interface.local_id():
                    # Print list of current uav_positions entries
                    print('[{}] UAV {} currently knows about {}'.format(
                        time.time(),
                        ns3interface.local_id(),
                        ', '.join(map(str, sorted(uav_positions)))
                    ))

                    time.sleep(.1)


    for uav_id in list(uav_positions.keys()):
        vehicle.mode = VehicleMode("LAND")
        while not vehicle.armed:
             vehicle.close()
             time.sleep(1)
             break
