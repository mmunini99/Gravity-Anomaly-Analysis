gmt grdfilter input_data_COM\BG_complete_COM.grd ^
-Ginput_data_COM\BG_lowpass.grd ^
-Fg30 -D0

grd2cpt input_data_COM\BG_lowpass.grd -Crainbow -Z > tess.cpt

gmt begin BG_Regional

psbasemap -R-99.6/-98/18.7/20 -JM5i -Ba -B+t"Regional Gravity"

grdimage -R-99.6/-98/18.7/20 -JM5i input_data_COM\BG_lowpass.grd -Ctess.cpt

pscoast -R-99.6/-98/18.7/20 -JM5i -I1 -Na -W0.8p -Dh

grdcontour -R-99.6/-98/18.7/20 -JM5i input_data_COM\BG_lowpass.grd -C20

psscale -Dx5.3i/0i+w4i/0.5i -Ba -Ctess.cpt

gmt end show