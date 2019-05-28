load data infile "/var/lib/mysql-files/province.csv"
into table province CHARACTER SET UTF8 fields terminated by ",";

load data infile "/var/lib/mysql-files/cities.csv"
into table cities CHARACTER SET UTF8 fields terminated by ",";

load data infile "/var/lib/mysql-files/weather_stations.csv"
into table weather_stations CHARACTER SET UTF8 fields terminated by ",";

load data infile "/var/lib/mysql-files/observations.csv"
into table observations CHARACTER SET UTF8 fields terminated by ",";

load data infile "/var/lib/mysql-files/valueType.csv"
into table ValueType CHARACTER SET UTF8 fields terminated by ",";

load data infile "/var/lib/mysql-files/obsValues.csv"
into table obsValues CHARACTER SET UTF8 fields terminated by ",";
