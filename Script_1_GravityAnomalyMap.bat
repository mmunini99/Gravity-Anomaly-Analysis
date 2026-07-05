grd2cpt input_data_COM\gravity_anomaly_cl_COM.grd -Crainbow -L-180/180 -Z > tess.cpt

gmt begin GravityAnomaly

psbasemap -R-99.6/-98/18.7/20 -JM5i -Ba -B+t"Gravity Anomaly"

grdimage input_data_COM\gravity_anomaly_cl_COM.grd -R-99.6/-98/18.7/20 -JM5i -Ctess.cpt

pscoast -R-99.6/-98/18.7/20 -JM5i -I1 -Na -W0.8p -Dh -Ba

grdcontour input_data_COM\gravity_anomaly_cl_COM.grd -R-99.6/-98/18.7/20 -JM5i -C30

psscale -Dx6i/0i+w4i/0.5i -Ba -By50+lmGal -Ctess.cpt

gmt end show
