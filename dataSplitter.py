dataset = open("sudeste.csv","r")
observations = open("data/observations.csv","w+")
weather_stations = open("data/weather_stations.csv","w+")
cities = open("data/cities.csv","w+")
province = open("data/province.csv","w+")
obsValues = open("data/obsValues.csv","w+")
prov = []
provnames = []
cit = []
citnames = []
wss = []
obs = []
total = 9779169
row = 0

for line in dataset:
        print(row)
        values = line.split(",")
        typecounter = 1
        for vtype in values[14:]:
                if(len(vtype.rstrip()) != 0 and vtype.strip() != "0" and vtype.strip() != "0.0" ):
                        toWrite = str(row)+","+str(typecounter)+","+str(vtype.rstrip())+"\n"
                        obsValues.write(toWrite)
                typecounter += 1
        if values[7] not in provnames:
                provnames.append(values[7])
                prov.append(provnames.index(values[7]))
                toWrite = str(prov[-1])+","+str(provnames[-1])+"\n"
                province.write(toWrite)
        if values[6] not in citnames:
                citnames.append(values[6])
                cit.append(citnames.index(values[6]))
                toWrite = str(cit[-1])+","+str((provnames.index(values[7])))+","+str(citnames[-1])+"\n"
                cities.write(toWrite)
        if values[0] not in wss:
                wss.append(values[0])
                toWrite = str(values[0])+","+str(citnames.index(values[6]))+","+str(values[1])+","+str(values[2])+","+str(values[3])+","+str(values[4])+","+str(values[5])+"\n"
                weather_stations.write(toWrite)
        toWrite = str(row)+","+str(values[0])+','+str(values[8])+"\n"
        observations.write(toWrite)
        row += 1

observations.close()
weather_stations.close()
cities.close()
province.close()
dataset.close()
obsValues.close()
#0 wsid 1 wsnm 2 elvt 3 lat 4 lon 5 inme 6 city 7 prov 8 mdct 9 date 
#10 yr 11 mo 12 da 13 hr 14 prcp 15 stp 16 smax 17 smin 18 gbrd 19 temp
#20 dewp 21 tmax 22 dmax 23 tmin 24 dmin 25 hmdy 26 hmax 27 hmin 28 wdsp 29 wdct 30 gust        