
MATRIX DATA VARIABLES = Policy Justify ROWTYPE_  Support
    /FACTORS = Policy Justify.
BEGIN DATA
1 1 N  251
1 2 N  251
2 1 N  251
2 2 N  251
1 1 MEAN 0.85 
1 2 MEAN 0.85
2 1 MEAN 0.0
2 2 MEAN 0.6
. . CORR  1
. . SD 1.7
END DATA.

MANOVA Support BY Policy, Justify (1,2) 
/MATRIX=IN(*)
/POWER exact  F (.05) 
/CINTERVAL Joint (.95)
/Omeans = Tables (Policy Justify)
/Print = Parameters (efsize)
/DESIGN
/DESIGN = Justify WITHIN Policy (1)
/DESIGN = Justify WITHIN Policy (2).