grd2cpt input_data_COM\topography_grd_etopo1_COM.grd -Cetopo1 -L1000/3000 -Z  > tess_topo.cpt

gmt begin GravityAnomalyTopography
psbasemap  -R-99.6/-98/18.7/20 -JM5i -Ba -B+t"Gravity Anomaly Topography"
grdimage -R-99.6/-98/18.7/20 input_data_COM\topography_grd_etopo1_COM.grd -Ctess_topo.cpt -JM5i
pscoast -R-99.6/-98/18.7/20 -JM5i -I1 -Na -W -Dh -Ba
grdcontour input_data_COM\topography_grd_etopo1_COM.grd -R-99.6/-98/18.7/20 -JM5i -C500
psscale -Dx6i/1i+w4i/0.5i -Ba -By50+lm -Ctess_topo.cpt
gmt end show