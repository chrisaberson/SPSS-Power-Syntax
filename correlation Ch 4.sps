INPUT PROGRAM.
LOOP n=60 TO 100 by 2.
END CASE.
END LOOP.
END FILE.
END INPUT PROGRAM.
EXECUTE .

Compute r = 0.3.
Compute alpha = .05.
Compute tails = 2.
Compute r = abs(r).
compute t = (r*((n-2)**.5))/((1-(r**2))**.5).
compute d = 2*r/((1-(r**2))**.5).
Compute delta = (d*sqrt(n-2))/2.
Compute alpha_tails = alpha/tails.
Compute fail = 1-alpha_tails.
compute df = n-2.
COMPUTE t_table = IDF.t(fail,df) .
COMPUTE Power = 1-NCDF.t(t_table,df,delta) .
execute.

Matrix.
GET M /VARIABLES=n d delta Power .
print M/title = "Power Analysis for Correlation"
/clabels = "N" "d" "Delta" "Power"/format f10.4.
End Matrix.