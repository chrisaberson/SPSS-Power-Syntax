INPUT PROGRAM.
LOOP n=200 TO 1000 by 50.
END CASE.
END LOOP.
END FILE.
END INPUT PROGRAM.
EXECUTE .

Compute r1 = 0.30.
Compute r2 = 0.10.
Compute Prop_N1 = 0.50.
Compute alpha = .05.
Compute tails = 1.

Compute N1 = N * Prop_N1.
Compute N2 = N * (1-Prop_N1).
Compute z_r1 = 0.5 * (Ln((1 + r1) / (1 - r1))).
Compute z_r2 = 0.5 * (Ln((1 + r2) / (1 - r2))).
compute z_diff = abs(z_r1-z_r2).
compute sdz = Sqrt((1 / (n1 - 3))+(1 / (n2 - 3))).
compute z = z_diff/sdz.
if tails = 1 prob = 1-alpha.
if tails = 2 prob = 1-(alpha/2).
Compute tabled = IDF.NORMAL(prob,0,1).
Compute z_power = tabled - z.
COMPUTE power = 1-CDF.Normal(z_power,0,1) .
COMPUTE p = (1-CDF.Normal(z,0,1))*tails .
execute.

Matrix.
GET M /VARIABLES=n1 n2 Power z p.
print M/title = "Power Analysis for Comparing Independent Correlations"
/clabels = "N1" "N2" "Power" "z" "p"/format f10.4.
End Matrix.
