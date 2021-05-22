import utm
from dronekit import *
import time
import math

#CONSTANTES
#POSSIBLE DRONEPORTS:
## '127.0.0.1:14550' #environment simulation PC-PC
## '192.168.7.2:14550' #environment simulation Beagle-PC
## '/dev/ttyACM0' #real application via USB Beagle-PixHawk
## '/dev/ttyO4' #real application via serial Beagle-PixHawk.
### Requires baud-rate 57600
DRONEPORT = '127.0.0.1:14550'
min_altitude = 7
distanciaMinima = 2
alturaPadrao = 10

inicioDaProva = LocationGlobalRelative(-27.603683, -48.518052, alturaPadrao)
fimDaProva = LocationGlobalRelative(-27.603815,-48.518572,alturaPadrao)

#METODOS
def distanciaLatLon(ponto1, ponto2):
    ponto1M = utm.from_latlon(ponto1.lat, ponto1.lon)
    ponto2M = utm.from_latlon(ponto2.lat, ponto2.lon)
    return math.sqrt(math.pow(ponto1M[0] - ponto2M[0],2) + math.pow(ponto1M[1] - ponto2M[1],2))

######################
inicioDaProvaM = utm.from_latlon(float(inicioDaProva.lat), float(inicioDaProva.lon))
fimDaProvaM = utm.from_latlon(float(fimDaProva.lat), float(fimDaProva.lon))

#distanciaDoPercurso = math.sqrt(math.pow(inicioDaProvaM[0] - fimDaProvaM[0],2) + math.pow(inicioDaProvaM[1] - fimDaProvaM[1],2))
waypointIX = (fimDaProvaM[0] + inicioDaProvaM[0]) /2
waypointIY = (fimDaProvaM[1] + inicioDaProvaM[1]) /2

waypointI = utm.to_latlon(waypointIX, waypointIY, 22, 'J')

print(waypointI)

copter = connect(DRONEPORT, wait_ready=True)

copter.mode = VehicleMode("GUIDED")

while not copter.armed:
    copter.armed = True
    print(" Waiting for arming...")
    time.sleep(5)

#lat = float(copter.location.global_relative_frame.lat)
#lon = float(copter.location.global_relative_frame.lon)
#alt = float(copter.location.global_relative_frame.alt)

posicaoAtual = copter.location.global_relative_frame
distanciaParaInicio = distanciaLatLon(inicioDaProva, posicaoAtual)

copter.simple_takeoff(min_altitude)
time.sleep(5)
copter.simple_goto(inicioDaProva)

while(distanciaParaInicio > distanciaMinima):
    #comparacao da ditancia atual com a ditancia para o inicio da prova
    posicaoAtual = copter.location.global_relative_frame
    distanciaParaInicio = distanciaLatLon(inicioDaProva, posicaoAtual)
    time.sleep(0.1)

distanciaFimProva= distanciaLatLon(fimDaProva, posicaoAtual)

while(distanciaFimProva > distanciaMinima):
    distanciaFimProva = distanciaLatLon(fimDaProva, posicaoAtual)

    posicaoDoObjeto = waypointI #alguma posicao x e y a partir do centro
    #posicaoDoObjeto = PixelsParaMetros(posicaoDoObjeto)
    #diferencaLat, diferencaLon = utm.to_latlon(posicaoDoObjeto.x, posicaoDoObjeto.y, alturaPadrao, 'U')

    posicaoAtual = copter.location.global_relative_frame
    wpLat = waypointI[0] #float(posicaoAtual.lat) + diferencaLat
    wpLon = waypointI[1] #float(posicaoAtual.lon) + diferencaLon

    wp = LocationGlobalRelative(wpLat, wpLon, alturaPadrao)

    copter.simple_goto(wp)

    time.sleep(0.1)
