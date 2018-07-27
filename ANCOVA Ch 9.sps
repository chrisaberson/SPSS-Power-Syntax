Two Factor ANCOVA

MATRIX DATA VARIABLES = Policy Justify ROWTYPE_  Support General
    /FACTORS = Policy Justify.
BEGIN DATA
1 1 N  251 251 
1 2 N  251 251
2 1 N  251 251
2 2 N  251 251
1 1 MEAN 0.85 2.5 
1 2 MEAN 0.85 2.5
2 1 MEAN 0.0 2.5 
2 2 MEAN 0.6 2.5
. . CORR  1
. . CORR  .40 1
. . SD 1.7 1.0
END DATA.

MANOVA Support BY Policy, Justify (1,2) with General 
/MATRIX=IN(*)
/POWER exact  F (.05) 
/CINTERVAL Joint (.95)
/Omeans = Tables (Policy Justify)
/Print = Parameters (efsize)
/DESIGN.