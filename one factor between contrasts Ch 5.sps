
MATRIX DATA VARIABLES =Program ROWTYPE_   Attitude
    /FACTORS = Program.
BEGIN DATA
1 N  60
2 N  60
3 N  60
4 N  60 
1 MEAN  80
2 MEAN  82
3 MEAN  82
4 MEAN  86
. Corr   1
. STDDEV 10
END DATA.

***Difference

MANOVA Attitude BY Program (1,4)
/MATRIX=IN(*)
/power exact t (.05) F (.05) 
/CINTERVAL Joint (.95)
/Omeans = Tables (Program)
/Print = Parameters (efsize)
/CONTRAST (Program) = Difference.

***Helmert

MANOVA Attitude BY Program (1,4)
/MATRIX=IN(*)
/power exact t (.05) F (.05) 
/CINTERVAL Joint (.95)
/Omeans = Tables (Program)
/Print = Parameters (efsize)
/CONTRAST (Program) = HELMERT.

***Simple No alpha adjustment

MANOVA Attitude BY Program (1,4)
/MATRIX=IN(*)
/power exact t (.05) F (.05) 
/CINTERVAL Joint (.95)
/Omeans = Tables (Program)
/Print = Parameters (efsize)
/CONTRAST (Program) = simple (1).


***Simple with alpha adjustment

MANOVA Attitude BY Program (1,4)
/MATRIX=IN(*)
/power exact t (.0167) F (.05) 
/CINTERVAL Joint (.95)
/Omeans = Tables (Program)
/Print = Parameters (efsize)
/CONTRAST (Program) = simple (1).

***Repeated

MANOVA Attitude BY Program (1,4)
/MATRIX=IN(*)
/power exact t (.05) F (.05) 
/CINTERVAL Joint (.95)
/Omeans = Tables (Program)
/Print = Parameters (efsize)
/CONTRAST (Program) = Repeated.

***Polynomial (Trend)

MANOVA Attitude BY Program (1,4)
/MATRIX=IN(*)
/power exact t (.05) F (.05) 
/CINTERVAL Joint (.95)
/Omeans = Tables (Program)
/Print = Parameters (efsize)
/CONTRAST (Program) = Polynomial.

