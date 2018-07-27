MATRIX DATA VARIABLES = Instruct  ROWTYPE_  Exam
    /FACTORS = Instruct.
BEGIN DATA
1 N  80
2 N  80 
1 MEAN 22
2 MEAN 20
 . CORR  1
 . SD 5
END DATA.


MANOVA Exam BY Instruct (1,2) 
/MATRIX=IN(*)
/power exact t (.05)
/Print = Parameters (EFSIZE).