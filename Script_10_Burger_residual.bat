gmt grdfilter input_data_COM\BG_complete_COM.grd ^
-Ginput_data_COM\BG_regional.grd ^
-Fg50 -D0

gmt grdmath ^
input_data_COM\BG_complete_COM.grd ^
input_data_COM\BG_regional.grd SUB ^
= input_data_COM\BG_residual.grd

grd2cpt input_data_COM\BG_residual.grd -Crainbow -Z > tess.cpt

gmt begin BG_Residual

psbasemap -R-99.6/-98/18.7/20 -JM5i -Ba -B+t"Residual Bouguer"

grdimage -R-99.6/-98/18.7/20 -JM5i input_data_COM\BG_residual.grd -Ctess.cpt

pscoast -R-99.6/-98/18.7/20 -JM5i -I1 -Na -W0.8p -Dh

grdcontour -R-99.6/-98/18.7/20 -JM5i input_data_COM\BG_residual.grd -C10

psscale -Dx5.3i/0i+w4i/0.5i -Ba -By10+lmGal -Ctess.cpt

gmt end show