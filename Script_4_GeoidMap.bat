grd2cpt input_data_COM\geoid_COM.grd  -Crainbow -L-150/150 -Z  > tess_geo.cpt

gmt begin GravityAnomalyGeoid
psbasemap  -R-99.6/-98/18.7/20 -JM5i -Ba -B+t"Gravity Anomaly Geoid"
grdimage -R-99.6/-98/18.7/20 input_data_COM\geoid_COM.grd -Ctess_geo.cpt -JM5i
pscoast -R-99.6/-98/18.7/20 -JM5i -I1 -Na -W -Dh -Ba
grdcontour input_data_COM\geoid_COM.grd -R-99.6/-98/18.7/20 -JM5i -C30
psscale -Dx6i/1i+w4i/0.5i -Ba  -By50+lm  -Ctess_geo.cpt
gmt end show

