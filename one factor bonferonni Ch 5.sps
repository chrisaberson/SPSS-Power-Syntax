*** If you want a Bonferonni, you have to run 3 analyses - Some redundancy but that won't affect power
*** For bonferoni divide the alpha for t by the number of comparisons (groups*groups-1)/2
*** For Sidak, 1-(1-.05)^(1/c)

***E.g. for 6 comps Bonferroni is .00833, Sidak is .0085 

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


*** This one gets 2 vs. 1, 3 vs. 1, and 4 vs. 1

MANOVA Attitude BY Program (1,4)
/MATRIX=IN(*)
/power exact t (.00833) F (.05) 
/CINTERVAL Joint (.95)
/Omeans = Tables (Program)
/Print = Parameters (efsize)
/CONTRAST (Program) = Simple (1).


*** This one gets 1 vs. 2, 3 vs. 2, and 4 vs. 2


MANOVA Attitude BY Program (1,4)
/MATRIX=IN(*)
/power exact t (.00833) F (.05) 
/CINTERVAL Joint (.95)
/Omeans = Tables (Program)
/Print = Parameters (efsize)
/CONTRAST (Program) = Simple (2).

*** This one gets 1 vs. 3, 2 vs. 3, and 4 vs. 3



MANOVA Attitude BY Program (1,4)
/MATRIX=IN(*)
/power exact t (.00833) F (.05) 
/CINTERVAL Joint (.95)
/Omeans = Tables (Program)
/Print = Parameters (efsize)
/CONTRAST (Program) = Simple (3).