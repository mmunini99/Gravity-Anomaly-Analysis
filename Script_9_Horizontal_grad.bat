gmt grdgradient input_data_COM\BG_complete_COM.grd ^
-Ginput_data_COM\BG_dx.grd ^
-A0

gmt grdgradient input_data_COM\BG_complete_COM.grd ^
-Ginput_data_COM\BG_dy.grd ^
-A90

gmt grdmath input_data_COM\BG_dx.grd SQR input_data_COM\BG_dy.grd SQR ADD SQRT = input_data_COM\BG_gradient.grd

grd2cpt input_data_COM\BG_gradient.grd -Crainbow -Z > tess.cpt

gmt begin BG_Gradient

psbasemap -R-99.6/-98/18.7/20 -JM5i -Ba -B+t"Horizontal Gradient"

grdimage -R-99.6/-98/18.7/20 -JM5i input_data_COM\BG_gradient.grd -Ctess.cpt

pscoast -R-99.6/-98/18.7/20 -JM5i -I1 -Na -W0.8p -Dh

grdcontour -R-99.6/-98/18.7/20 -JM5i input_data_COM\BG_gradient.grd -C5

psscale -Dx5.3i/0i+w4i/0.5i -Ba -Ctess.cpt

gmt end show