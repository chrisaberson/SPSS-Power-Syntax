MATRIX DATA VARIABLES = ROWTYPE_  Intention Internal External Modern.
BEGIN DATA
Mean 1 2 3 4
STDEV 7 1 1 1
N 30 30 30 30
Corr 1
Corr .40 1 
Corr .40 -.15  1
Corr -.40 -.60 .25 1
END DATA. 	


REGRESSION
  /MATRIX=IN(*)
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA COLLIN TOL zpp change
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN
  /DEPENDENT Intention
 /Method=Enter Modern /METHOD=ENTER Internal External .

***Shortcuts for comparing independent coeff. 

MATRIX DATA VARIABLES = ROWTYPE_  Internal External Modern.
BEGIN DATA
Mean 2 3 4
STDEV 1 1 1
N 50 50 50
Corr 1
Corr -.15 1 
Corr -.60 .25  1
END DATA. 	


REGRESSION
  /MATRIX=IN(*)
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA COLLIN TOL zpp change
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN
  /DEPENDENT External 
 /Method=Enter Internal Modern  .

*** Shortcuts for comparing R2 values
*** Student sample

MATRIX DATA VARIABLES = ROWTYPE_  Intention Internal External Modern.
BEGIN DATA
Mean 1 2 3 4
STDEV 7 1 1 1
N 50 50 50 50
Corr 1
Corr .40 1 
Corr .40 -.15  1
Corr -.40 -.60 .25 1
END DATA. 	


REGRESSION
  /MATRIX=IN(*)
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA COLLIN TOL zpp change
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN
  /DEPENDENT Intention
 /Method=Enter Modern Internal External .

*** Shortcuts for comparing R2 values
*** Adult sample

MATRIX DATA VARIABLES = ROWTYPE_  Intention Internal External Modern.
BEGIN DATA
Mean 1 2 3 4
STDEV 7 1 1 1
N 50 50 50 50
Corr 1
Corr .40 1 
Corr .10 -.15  1
Corr -.40 -.60 .25 1
END DATA. 	


REGRESSION
  /MATRIX=IN(*)
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA COLLIN TOL zpp change
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN
  /DEPENDENT Intention
 /Method=Enter Modern Internal External .
