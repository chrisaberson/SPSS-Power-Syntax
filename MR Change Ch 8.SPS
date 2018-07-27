
INPUT PROGRAM.
LOOP n=20 TO 40 by 1.
END CASE.
END LOOP.
END FILE.
END INPUT PROGRAM.
EXECUTE .

*** Note -- to get model power set model and change as same values

Compute r2model = .467.
Compute r2change = .307.
Compute modelpred =  3.
Compute changepred =  2.
Compute alpha = .05.

compute df_change = changepred.
compute df_denom = (n - modelpred) -1. 
compute k2 = 1 - r2model.
compute multiplier = df_denom.
compute f2 = r2change/k2.
compute lambda = f2*multiplier .
compute F_Table = IDF.F(1-alpha,df_change,df_denom) .
compute power = 1 - NCDF.F(F_Table,df_change,df_denom,Lambda) .
execute.

matrix.
GET M /VARIABLES=n lambda Power .
print M/title = "Power for R2 Change"/clabels = "N" "Lambda" "Power"/format f10.4.
End Matrix.