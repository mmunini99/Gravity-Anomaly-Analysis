gmt begin GravityAnomalyContour
psbasemap  -R-99.6/-98/18.7/20 -JM5i -Ba -B+t"Gravity Anomaly Contour"
pscoast -R-99.6/-98/18.7/20 -JM5i -I1 -Na -Ggray -Dh -Ba
grdcontour input_data_COM\gravity_anomaly_cl_COM.grd -R-99.6/-98/18.7/20 -JM5i -C30
gmt end show





