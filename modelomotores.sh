#!/bin/sh

csvsort -d '^' -r -c nb_engines optd_aircraft.csv | head -2 | csvcut -c model | tail -1 