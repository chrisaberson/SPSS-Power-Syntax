*** Precision for mean differences


INPUT PROGRAM.
LOOP n=100 TO 1600 by 100.
END CASE.
END LOOP.
END FILE.
END INPUT PROGRAM.
EXECUTE .

Compute Prop_N1 = 0.50.
Compute M1 = 2.
Compute M2 = 0.
Compute S1 = 5.
Compute S2 = 5.
Compute Conf = .95.

Compute N1 = N * Prop_N1.
Compute N2 = N * (1-Prop_N1).
Compute df = n1 + n2 -2.
compute var1 = s1*s1.
compute var2 = s2*s2.
compute nxs1 = (n1-1)*(var1). 
compute nxs2 = (n2-1)*(var2). 
compute s2p = (nxs1+nxs2)/(df).
compute sp = sqrt(s2p). 
compute d = (M1-M2)/sp.
Compute MeanDiff = M1-M2.
compute sx1 = sp/sqrt(n1).
compute sx2 = sp/sqrt(n2).
compute sx1x2 = sqrt(sx1**2+sx2**2).
Compute fail = ((1-conf)/2)+conf.
COMPUTE t_table = IDF.t(fail,df) .
Compute MOE = sx1x2 * t_table.
COMPUTE LL_MeanDiff = MeanDiff- MOE .
COMPUTE UL_MeanDiff = MeanDiff+ MOE .
Compute Precision_MeanDiff = UL_MeanDiff-LL_MeanDiff.
Compute alpha = 1-conf. 
Compute fail2 = 1-(alpha/2).
Compute tval = meandiff / sx1x2.
COMPUTE t_table = IDF.t(fail2,df) .
COMPUTE Power = 1-NCDF.t(t_table,df,tval) .
If d = 0  power = power*2.
EXECUTE.

MATRIX.
GET M /VARIABLES=n1 n2 LL_MeanDiff UL_MeanDiff Precision_MeanDiff Power .
print M/title = "Precision Analysis for Mean Differences"/clabels = "N1" "N2" "LL" "UL" "Precise" "Power"/format f10.4.
End Matrix.