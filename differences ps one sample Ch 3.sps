
INPUT PROGRAM.
LOOP n=20 TO 100 by 10.
END CASE.
END LOOP.
END FILE.
END INPUT PROGRAM.
EXECUTE .

compute prop_alt = .60.
compute prop_null = .42.
Compute alpha = .050.
Compute tails = 1.

compute ars_1 = 2*(ARSIN(prop_alt**.5)).
compute ars_2 = 2*(ARSIN(prop_null**.5)).
compute h = ars_1-ars_2. 
compute z = h*(n**.5).
Compute alpha_tails = alpha/tails.
Compute prob = 1-alpha_tails.
Compute z_tabled =IDF.NORMAL(prob,0,1).
Compute z_power = z_tabled - z. 
COMPUTE Power = 1-CDF.NORMAL(z_power,0,1).
execute.

matrix.
GET M /VARIABLES=N Power .
print M/title = "Power for Differences Single Sample Proportion"/clabels = "N" "Power"/format f10.4.
End Matrix.