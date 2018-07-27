INPUT PROGRAM.
LOOP n=25 TO 40 by 1.
END CASE.
END LOOP.
END FILE.
END INPUT PROGRAM.
EXECUTE .

Compute Epsilon = 0.815.
Compute measures = 4.
Compute Lambda = 11.767.
Compute Initial_n = 25.
Compute alpha = 0.05.

compute df_num = measures -1.
Compute df_denom = (df_num * n) - df_num.

Compute df_n_adj = df_num * Epsilon.
Compute df_d_adj = df_denom * Epsilon.
Compute n_adj = n * Epsilon.
Compute lambda_adj = ((Lambda/Initial_n) * n_adj).
COMPUTE F_Table = IDF.F(1-alpha,df_n_adj, df_d_adj) .
COMPUTE Power = 1-NCDF.F(F_table,df_n_adj, df_d_adj, lambda_adj) .
EXECUTE .

MATRIX.
GET M /VARIABLES=n lambda_adj power.
print M/title = "Sphericity Adjusted Power"/clabels = "n" "Lambda_Adj" "Power_Adj"/format f9.3.
End Matrix.




EXECUTE.

