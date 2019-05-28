create view AvgTmaxPerYears as
select YEAR(observations.datetime),avg(obsValues.value)
from observations use index(bydate) join obsValues on observations.obsID = obsValues.obsID
where obsValues.valueID in (select valueID from ValueType where valueName = "tmax")
group by YEAR(observations.datetime);

create view AvgPrcpPerWS as
select weather_stations.wsid, weather_stations.wsnm, avg(obsValues.value)
from weather_stations join observations on weather_stations.wsid = observations.wsid
join obsValues on observations.obsID = obsValues.obsID
where obsValues.valueID in ( select valueID from ValueType where valueName = "prcp" )
group by weather_stations.wsid,weather_stations.wsnm
order by avg(obsValues.value) desc;

create view AvgMaxAPressure2016 as
select cities.name, avg(obsValues.value)
from obsValues join observations use index(bydate) on obsValues.obsID= observations.obsID
join weather_stations on observations.wsid=weather_stations.wsid
join cities on weather_stations.cid=cities.cid
where year(observations.datetime)=2016 and obsValues.valueID in ( select valueID from ValueType where valueName = "smax")
group by cities.name; 

create view AvgHumidProvinces as 
select province.name,avg(obsValues.value)
from obsValues join observations use index(bydate) on obsValues.obsID = observations.obsID
join weather_stations on observations.wsid = weather_stations.wsid
join cities on weather_stations.cid = cities.cid
join province on cities.pid = province.pid
where obsValues.valueID in (select valueID from ValueType where valueName = "hmdy")
group by province.name;

create view MostWind2010 as
select weather_stations.wsnm , avg(obsValues.value)
from obsValues join observations use index(bydate) on obsValues.obsID=observations.obsID
join weather_stations on weather_stations.wsid=observations.wsid
where year(observations.datetime)=2010 and obsValues.valueID in (select valueID from ValueType where valueName="wdsp")
group by weather_stations.wsnm 
order by avg(obsValues.value) desc
limit 1;

create view AvgDewPointSummer as
select province.name , avg(obsValues.value)
from obsValues join observations use index(bydate) on obsValues.obsID=observations.obsID
join weather_stations on observations.wsid=weather_stations.wsid
join cities on weather_stations.cid=cities.cid
join province on cities.pid=province.pid
where (month(observations.datetime)=6 or month(observations.datetime)=7 or month(observations.datetime)=8) and obsValues.valueID in(select valueID from ValueType where valueName="dewp")
group by province.name;


create view NVGustsPerMonth as 
select month(observations.datetime) , avg(obsValues.value)
from obsValues join observations use index(bydate) on observations.obsID=obsValues.obsID
join weather_stations on observations.wsid=weather_stations.wsid
where year(observations.datetime)=2013 and obsValues.valueID in (select valueID from ValueType where valueName="gust") and weather_stations.wsnm="Nova Venecia"
group by month(observations.datetime);

create view Top3ColdestRJwinter as  
select cities.name , avg(obsValues.value)
from obsValues join observations use index (bydate) on observations.obsID=obsValues.obsID
join weather_stations on observations.wsid=weather_stations.wsid
join cities on weather_stations.cid=cities.cid
join province on cities.pid=province.pid
where (month(observations.datetime)=12 or month(observations.datetime)=1 or month(observations.datetime)=2) and obsValues.valueID in(select valueID from ValueType where valueName="tmin") and province.name="RJ"
group by cities.name
order by avg(obsValues.value) asc
limit 3 ;

create view HighestSolarRadiation as
select observations.datetime,obsValues.value
from observations join obsValues use index(byValueType) on observations.obsID = obsValues.obsID
where obsValues.valueID in (select valueID from ValueType where valueName = "gbrd")
order by obsValues.value desc
limit 1;

create view HighestAirPressure as
select weather_stations.wsnm,datetime
from observations join obsValues use index(byValueType) on observations.obsID = obsValues.obsID
join weather_stations on observations.wsid = weather_stations.wsid
where obsValues.valueID in (select valueID from ValueType where valueName = "smax")
order by obsValues.value desc
limit 1;