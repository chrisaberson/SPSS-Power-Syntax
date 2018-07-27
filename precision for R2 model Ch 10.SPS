INPUT PROGRAM.
LOOP n=24 TO 100 by 4.
END CASE.
END LOOP.
END FILE.
END INPUT PROGRAM.
EXECUTE .

Compute r2model = .467.
Compute modelpred =  3.
Compute conf = .95.

Compute alpha = 1-conf.

compute df_model = modelpred.
compute df_denom = (n - modelpred) -1. 
compute k2 = 1 - r2model.
compute multiplier = df_denom.
compute f2 = r2model/k2.
compute lambda = f2*multiplier .
compute F_Table = IDF.F(1-alpha,df_model,df_denom) .
compute power1 = 1 - NCDF.F(F_Table,df_model,df_denom,Lambda) .
compute FVAL = f2 *(df_denom/df_model).
compute df1=df_model. 
compute df2=df_denom.
execute.

INCLUDE FILE='d:\Power\NoncF3.sps'.

Compute Precision = UR2-LR2. 
EXECUTE.

MATRIX.
GET M /VARIABLES=n LR2 UR2 Precision Power1.
print M/title = "Precision Analysis for R2 Model"/clabels = "N"  "LL" "UL" "Precise" "Power"/format f10.4.
End Matrix.