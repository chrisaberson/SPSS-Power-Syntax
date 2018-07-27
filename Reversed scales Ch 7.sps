****Example with reversed scales

MATRIX DATA VARIABLES = Condition ROWTYPE_  implicit stereotype
/Factor = Condition.
BEGIN DATA
1 Mean 0.0 1.0 
1 N 20 20 
2 Mean -0.25 -2.0  
2 N 20 20
. Corr 1
. Corr .4 1 
. SD 0.40 5.0 
END DATA.

MANOVA implicit stereotype by Condition (1,2)
 /MATRIX=IN(*)
 /power F (.05) t (.05)
 /print signif (mult averf) param(estim efsize).


MATRIX DATA VARIABLES = Condition ROWTYPE_  implicit stereotype
/Factor = Condition.
BEGIN DATA
1 Mean 0.0 -1.0 
1 N 20 20 
2 Mean -0.25 2.0  
2 N 20 20
. Corr 1
. Corr -.4 1 
. SD 0.40 5.0 
END DATA.

MANOVA implicit stereotype by Condition (1,2)
 /MATRIX=IN(*)
 /power F (.05) t (.05)
 /print signif (mult averf) param(estim efsize).

