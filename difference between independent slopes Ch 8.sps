
INPUT PROGRAM.
LOOP n=100 TO 300 by 10.
END CASE.
END LOOP.
END FILE.
END INPUT PROGRAM.
EXECUTE .


**** Prop_N1 = Proportion of cases in first group -- set to .50 for equal # in each group

Compute Prop_N1 = 0.5.
Compute b1 = 3.733.
Compute r2y1 = .467.
Compute r2_1 = .063.
Compute b2 = 1.493.
Compute r2y2 = .243.
Compute r2_2 = .063.
Compute sdy1 = 7.
Compute sdy2 = 7.
Compute sd1 = 1.
Compute sd2 = 1.
Compute alpha = .05.
Compute tails = 2.
Compute k = 3.

Compute N1 = N * Prop_N1.
Compute N2 = N * (1-Prop_N1).
Compute seb1 = (sdy1/sd1)* (1/(1-r2_1)**.5)*(((1-r2y1)/(n1-k-1))**.5).
Compute seb2 = (sdy2/sd2)*(1/(1-r2_2)**.5)*(((1-r2y2)/(n2-k-1))**.5).
Compute df = n1+n2-k-k-2.
Compute alpha_tails = alpha/tails.
Compute fail = 1-alpha_tails.
Compute slope_diff = abs(b1-b2).
compute sediff = Sqrt((seb1**2) + (seb2**2)).
compute delta = slope_diff / sediff.
COMPUTE t_tabled = IDF.t(fail,df) .
COMPUTE Power = 1-NCDF.t(t_tabled,df,delta) .
Compute LL_diff = slope_diff - (t_tabled*sediff).
Compute UL_diff = slope_diff + (t_tabled*sediff).
execute.

MATRIX.
GET M /VARIABLES=n1 n2 ll_diff ul_diff power.
print M/title = "Comparing two independent predictors"/clabels = "n1" "n2" "LL" "UL"  "power"/format f9.3.
End Matrix.