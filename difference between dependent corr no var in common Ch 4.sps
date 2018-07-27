INPUT PROGRAM.
LOOP n=20 TO 300 by 10.
END CASE.
END LOOP.
END FILE.
END INPUT PROGRAM.
EXECUTE .

Compute r12 = .4.
Compute rxy = .7.
Compute r1x = .3.
Compute r1y = .1. 
Compute r2x = .45.
Compute r2y = .35. 
Compute alpha = .05.
Compute tails = 2.

Compute z_r12 = 0.5 * (Ln((1 + r12) / (1 - r12))).
Compute z_rxy = 0.5 * (Ln((1 + rxy) / (1 - rxy))).
compute q = abs(z_r12-z_rxy).
compute r_ave = (r12+rxy)/2.
compute denom = (1-r_ave**2)**2 .
compute numer1 = (r1x -(r12*r2x))*(r2y-(r2x*rxy)).
compute numer2 = (r1y -(r1x*rxy))*(r2x-(r12*r1x)).
compute numer3 = (r1x -(r1y*rxy))*(r2y-(r12*r1y)).
compute numer4 = (r1y -(r12*r2y))*(r2x-(r2y*rxy)).
compute numer = (numer1 + numer2 +numer3+numer4)/2. 
compute sd = numer /denom. 
compute z = (q*((n-3)**.5)) / ((2-(2*sd))**.5).
if tails = 1 prob = 1-alpha.
if tails = 2 prob = 1-(alpha/2).
Compute tabled = IDF.NORMAL(prob,0,1).
Compute z_power = tabled - z.
COMPUTE power = 1-CDF.Normal(z_power,0,1) .
COMPUTE p = (1-CDF.Normal(z,0,1))*tails .
execute.

Matrix.
GET M /VARIABLES=n Power z p.
print M/title = "Power Analysis for Comparing Dependent Correlations (No shared variables)"
/clabels = "N" "Power" "z" "p"/format f10.4.
End Matrix.