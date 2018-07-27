
** two within one between

MATRIX DATA VARIABLES = A ROWTYPE_  X1Y1 X2Y1 X3Y1 X4Y1 X1Y2 X2Y2 X3Y2 X4Y2
/Factors = A.
BEGIN DATA
1 Mean -0.25 0.00 0.10 0.15 -0.25 0.10 0.30 0.35
1 N 335 335 335 335 335 335 335 335
2 Mean 0.0 0.00 0.05 0.05 -0.35 0.00 .10 .25
2 N 335 335 335 335 335 335 335 335
. Corr 1
. Corr .5 1 
. Corr .5 .5 1
. Corr .5 .5 .5 1
. Corr .5 .5 .5 .5  1
. Corr .5 .5 .5 .5 .5 1
. Corr .5 .5 .5 .5 .5 .5 1
. Corr .5 .5 .5 .5 .5 .5 .5 1
. STDEV 0.40 0.50 2.5 2.0 0.40 0.50 2.5 2.0
END DATA. 	


MANOVA X1Y1 X2Y1 X3Y1 X4Y1 X1Y2 X2Y2 X3Y2 X4Y2 by A (1,2)
 /WSFACTOR = y(2) x(4)
 /MATRIX=IN(*)
 /power F (.05) t(.05) exact
 /WSDESIGN = x y x*y.
