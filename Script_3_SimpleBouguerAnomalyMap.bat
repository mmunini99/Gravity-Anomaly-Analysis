grd2cpt input_data_COM\gravity_anomaly_bg_COM.grd -Crainbow -L-220/320 -Z  > tess_bg.cpt

gmt begin GravityAnomalyBourguer
psbasemap  -R-99.6/-98/18.7/20 -JM5i -Ba -B+t"Gravity Bouguer"
grdimage -R-99.6/-98/18.7/20 input_data_COM\gravity_anomaly_bg_COM.grd -Ctess_bg.cpt -JM5i
pscoast -R-99.6/-98/18.7/20 -JM5i -I1 -Na -W -Dh -Ba
grdcontour input_data_COM\gravity_anomaly_bg_COM.grd -R-99.6/-98/18.7/20 -JM5i -C30
psscale -Dx6i/1i+w4i/0.5i -Ba  -By50+lmGal  -Ctess_bg.cpt
gmt end show
