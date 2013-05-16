#!/bin/bash
# $Id$
# Test the generation of illumination with the GMT original algorithm

ps=illum_classic.ps

grdmath -R-15/15/-15/15 -I0.3 X Y HYPOT DUP 2 MUL PI MUL 8 DIV COS EXCH NEG 10 DIV EXP MUL = somb.nc

grd2cpt somb.nc -Cjet > pal.cpt

grdgradient somb.nc -A225 -Gintensity.nc -Nt0.75

grdview somb.nc -JX6i -JZ2i -B5 -Bz0.5 -BSEwnZ -N-1/white -Qi100 -Iintensity.nc -X1.5i -Cpal.cpt \
	-R-15/15/-15/15/-1/1 -K -p120/30 > $ps

rm -f somb.nc intensity.nc pal.cpt