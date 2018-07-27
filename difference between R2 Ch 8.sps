
INPUT PROGRAM.
LOOP n=230 to 400 by 10.
END CASE.
END LOOP.
END FILE.
END INPUT PROGRAM.
EXECUTE .


Compute Prop_N1 = 0.5.
Compute R2_1 = .467.
Compute R2_2 = .242.
Compute k =3.
Compute alpha = .05.
Compute tails = 2.

Compute N1 = N * Prop_N1.
Compute N2 = N * (1-Prop_N1).
Compute SER2_1 = ((4*R2_1)*(1-R2_1)**2)*((n1-k-1)**2) / ((n1**2 - 1)* (n1+3)).
Compute SER2_2 = ((4*R2_2)*(1-R2_2)**2)*((n2-k-1)**2) / ((n2**2 - 1)* (n2+3)).
Compute SER2 = (SER2_1 + SER2_2)**.5.
compute diff = abs(r2_1-r2_2).
Compute alpha_tails = alpha/tails.
Compute fail = 1-alpha_tails.
Compute df = n1+n2-k-k-1.
compute delta = diff / SER2.
COMPUTE t_tabled = IDF.t(fail,df) .
COMPUTE Power = 1-NCDF.t(t_tabled,df,delta) .
Compute LL_diff = diff - (t_tabled*SER2).
Compute UL_diff = diff + (t_tabled*SER2).
execute.

MATRIX.
GET M /VARIABLES=n1 n2 ll_diff ul_diff power.
print M/title = "Comparing two independent R-Square Values"/clabels = "n1" "n2" "LL" "UL" "power"/format f9.3.
End Matrix.