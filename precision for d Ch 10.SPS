*** This analysis calls for a file in the d:\Power directory called NoncT2.sps
*** The NoncT2 file appears on the CD thanks to the generosity of Michael Smithson. You must place this file 
*** in a directory on your computer called d:\\Power. Alternatively, you can place it in another 
***directory and change the Include line

INPUT PROGRAM.
LOOP n=100 TO 2000 by 100.
END CASE.
END LOOP.
END FILE.
END INPUT PROGRAM.
EXECUTE .

Compute d = 0.40.
Compute Conf = .95.
Compute Prop_N1 = 0.50.
Compute N1 = N * Prop_N1.
Compute N2 = N * (1-Prop_N1).
Compute df = n1 + n2 -2.
COMPUTE TVAL = D*SQRT(N1*N2/(N1+N2)) .
EXECUTE.

INCLUDE FILE='d:\Power\NoncT2.sps'.

COMPUTE LL_D = LC2/SQRT(N1*N2/(N1+N2)) .
COMPUTE UL_D = UC2/SQRT(N1*N2/(N1+N2)) .
Compute Precision_D = UL_D-LL_D.
Compute alpha = 1-conf. 
Compute fail = 1-(alpha/2).
COMPUTE t_table = IDF.t(fail,df) .
COMPUTE Power = 1-NCDF.t(t_table,df,tval) .
execute.

EXECUTE.
MATRIX.
GET M /VARIABLES=n1 n2 LL_D UL_D Precision_D Power.
print M/title = "Precision Analysis for Cohen's d"/clabels = "N1" "N2" "LL" "UL" "Precise" "Power"/format f10.4.
End Matrix.