INPUT PROGRAM.
LOOP n=200 TO 2500 by 100.
END CASE.
END LOOP.
END FILE.
END INPUT PROGRAM.
EXECUTE .

compute prop1 = .62.
compute prop2 = .55.
compute Prop_N1 = 0.2.
compute alpha = .05.
compute tails = 2.

compute N1 = N * Prop_N1.
compute N2 = N * (1-Prop_N1).
compute n_harm = ((2*n1*n2)/(n1+n2)). 
compute ars_1 = 2*(ARSIN(prop1**.5)).
compute ars_2 = 2*(ARSIN(prop2**.5)).
compute h = ars_1-ars_2. 
compute z = h*((n_harm/2)**.5).
Compute alpha_tails = alpha/tails.
Compute prob = 1-alpha_tails.
Compute z_tabled =IDF.NORMAL(prob,0,1).
Compute z_power = z_tabled - z. 
COMPUTE Power = 1-CDF.NORMAL(z_power,0,1).
execute.

matrix.
GET M /VARIABLES=n1 n2 Power .
print M/title = "Power for Differences Between Proportions"/clabels = "N1" "N2" "Power"/format f10.4.
End Matrix.