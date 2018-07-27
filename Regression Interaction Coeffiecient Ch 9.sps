***Coeffiecient approach to interaction power

MATRIX DATA VARIABLES = ROWTYPE_  aggress condition sensitive sxc.
BEGIN DATA
Mean 4 1 1 1
N 122 122 122 122
SD 2.72 0.50 3.25 1.00
Corr 1
Corr  .17 1
Corr  .00 .00 1
Corr   .26 .05 .05 1
END DATA. 	

*** Regression syntax is for checking results, not required for power analysis

REGRESSION
  /MATRIX=IN(*)
  /MISSING LISTWISE
  /STATISTICS R change coeff
  /DEPENDENT aggress
  /METHOD=ENTER  sensitive condition  /METHOD=ENTER  sxc.

*** This syntax runs the power analysis

MANOVA aggress with condition sensitive sxc
/MATRIX=IN(*)
/power F (.05)
/print signif (mult averf) 
/noprint param(estim)
/DESIGN. 
