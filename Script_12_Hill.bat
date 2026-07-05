gmt grdgradient input_data_COM\topography_grd_etopo1_COM.grd ^
-Ginput_data_COM\hillshade.grd ^
-A315 ^
-Ne0.8

:: NOTE: this script previously relied on tess_topo.cpt existing from a prior
:: run of Es5_TopographyMap.bat. It now generates its own CPT so it can run
:: independently.
grd2cpt input_data_COM\topography_grd_etopo1_COM.grd -Cetopo1 -L-5000/3200 -Z > tess_topo.cpt

gmt begin Hillshade

psbasemap -R-99.6/-98/18.7/20 -JM5i -Ba -B+t"Hillshade"

grdimage -R-99.6/-98/18.7/20 -JM5i input_data_COM\topography_grd_etopo1_COM.grd ^
-Ctess_topo.cpt ^
-Iinput_data_COM\hillshade.grd

pscoast -R-99.6/-98/18.7/20 -JM5i -I1 -Na -W -Dh

gmt end show