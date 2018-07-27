INPUT PROGRAM.
LOOP n=80 to 400 by 20.
END CASE.
END LOOP.
END FILE.
END INPUT PROGRAM.
EXECUTE .

Compute r = 0.3.
Compute Conf = .95.
Compute prob_1 = ((1-Conf)/2)+Conf.
Compute z_tabled =IDF.NORMAL(prob_1,0,1).
Compute z_r = 0.5 * (Ln((1 + r) / (1 - r))).
compute sdz = Sqrt(1 / (n - 3)).
Compute LL_Zr =  z_r - (sdz*z_tabled).
Compute UL_Zr =  z_r + (sdz*z_tabled).
Compute LL_r = (exp(2*LL_Zr)-1) / (exp(2*LL_Zr)+1).
Compute UL_r = (exp(2*UL_Zr)-1) / (exp(2*UL_Zr)+1).
Compute Precision = UL_r - LL_r.
Compute t = (r*((n-2)**.5))/((1-(r**2))**.5).
compute d = 2*r/((1-(r**2))**.5).
Compute delta = (d*sqrt(n))/2.
Compute alpha = 1-conf.
Compute alpha_tails = alpha/2.
Compute fail = 1-alpha_tails.
compute df = n-2.
COMPUTE t_table = IDF.t(fail,df) .
COMPUTE Power = 1-NCDF.t(t_table,df,delta) .
execute.
MATRIX.
GET M /VARIABLES=n LL_r UL_r Precision Power .
print M/title = "Precision Analysis for Correlation"/clabels = "N" "LL" "UL" "Precise" "Power"/format f10.4.
End Matrix.