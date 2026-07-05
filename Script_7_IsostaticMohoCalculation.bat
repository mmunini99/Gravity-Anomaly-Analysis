Set input=input_data_COM\topography_grd_etopo1_COM.grd
Set flex=input_data_COM\flex.grd

grdflexure %input%  -D3200/2670/1035 -E10k -G%flex% -N+l -Z30000 -fg
::grdmath %input% -2670 MUL 530 DIV -30000 ADD = %flex%
grdinfo %flex%

grd2cpt %flex% -Crainbow  -Z  > tess.cpt

gmt begin Mepo_MohoIsostatic
psbasemap  -R-99.6/-98/18.7/20 -JM5i -Ba -B+t"Moho Isostatic"
grdimage -R-99.6/-98/18.7/20 %flex% -Ctess.cpt -JM5i
pscoast -R-99.6/-98/18.7/20 -JM5i -I1 -Na -W -Dh -Ba
grdcontour %flex% -R-99.6/-98/18.7/20 -JM5i -C5000
psscale -Dx6i/1i+w4i/0.5i -Ba  -By50+lm  -Ctess.cpt
gmt end show
