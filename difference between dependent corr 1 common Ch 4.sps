INPUT PROGRAM.
LOOP n=100 TO 300 by 10.
END CASE.
END LOOP.
END FILE.
END INPUT PROGRAM.
EXECUTE .

**Make r1y the larger correlation and r2y the smaller

Compute r1y = .3.
Compute r2y = .04.
Compute r12 = .2. 
Compute alpha = .05.
Compute tails = 2.

compute df = n-3.
compute r_diff =abs(r1y-r2y).
compute r_ave = (r1y+r2y)/2.
compute r_det = 1-(r1y**2)-(r2y**2)-(r12**2)+(2*r1y*r2y*r12). 
compute numer = (n-1)*(1+r12).
compute denom1 = ((2*(n-1))/(n-3))*r_det.
compute denom2 = (r_ave**2)*((1-r12)**3).
compute denom = denom1+denom2.
compute delta = r_diff*((numer/denom)**.5).
compute alpha_tails = alpha/tails.
compute fail = 1-alpha_tails.
compute t_table = IDF.t(fail,df) .
compute Power = 1-NCDF.t(t_table,df,delta) .
compute t = delta.
compute p = (1-CDF.t(t,df))*tails .
execute.

Matrix.
GET M /VARIABLES=n Power t p.
print M/title = "Power Analysis for Comparing Dependent Correlations One Shared Variable"
/clabels = "N" "Power" "t" "p"/format f10.4.
End Matrix.