grd2cpt input_data_COM\gravity_disturbance_sa_dV_ELL_RET2014_COM.grd  -Crainbow -L-500/500 -Z  > tess.cpt

gmt begin gravdist_TopoField_Earth2014
psbasemap  -R-99.6/-98/18.7/20 -JM5i -Ba -B+t"Gravity Disturbance topography field"
grdimage -R-99.6/-98/18.7/20 input_data_COM\gravity_disturbance_sa_dV_ELL_RET2014_COM.grd -Ctess.cpt -JM5i
pscoast -R-99.6/-98/18.7/20 -JM5i -I1 -Na -W0.8p -Dh -Ba
grdcontour input_data_COM\gravity_disturbance_sa_dV_ELL_RET2014_COM.grd -R-99.6/-98/18.7/20 -JM5i -C50
psscale -Dx5.3i/0i+w4i/0.5i -Ba  -By50+lmGal  -Ctess.cpt
gmt end show




gmt grdmath input_data_COM\gravity_anomaly_cl_COM.grd input_data_COM\gravity_disturbance_sa_dV_ELL_RET2014_COM.grd SUB = input_data_COM\BG_complete_COM.grd

grd2cpt input_data_COM\BG_complete_COM.grd  -Crainbow -L-500/500 -Z  > tess.cpt

gmt begin BG_Complete
psbasemap  -R-99.6/-98/18.7/20 -JM5i -Ba -B+t"BG dv Ell 2014 field"
grdimage -R-99.6/-98/18.7/20 input_data_COM\BG_complete_COM.grd -Ctess.cpt -JM5i
pscoast -R-99.6/-98/18.7/20 -JM5i -I1 -Na -W0.8p -Dh -Ba
grdcontour input_data_COM\BG_complete_COM.grd -R-99.6/-98/18.7/20 -JM5i -C50
psscale -Dx5.3i/0i+w4i/0.5i -Ba  -By50+lmGal  -Ctess.cpt
gmt end show