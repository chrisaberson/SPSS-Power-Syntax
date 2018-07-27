
*** Regression Interactions by Group


INPUT PROGRAM.
LOOP n=120 TO 140 by 2.
END CASE.
END LOOP.
END FILE.
END INPUT PROGRAM.
EXECUTE .

Compute Estimates = 1 .
Compute Group1 = -.26.
Compute Group2 = .25.
Compute Sx1 = 3.25.
Compute Sx2= 3.25.
Compute Sy1= 2.10.
Compute Sy2= 3.22.
Compute alpha = .05.
Compute Prop_N1 = 0.5.
Compute N1 = N * Prop_N1.
Compute N2 = N * (1-Prop_N1).
If Estimates = 1 r1 = Group1.
If Estimates = 1 r2 = Group2.
If Estimates = 2 r1 = Group1*(Sx1/Sy1).
If Estimates = 2 r2 = Group2*(Sx2/Sy2).
Compute sx1_sq = Sx1**2. 	
Compute sx2_sq = Sx2**2.
Compute sy1_sq = Sy1**2.
Compute sy2_sq = Sy2**2.
Compute r1_sq = r1**2.
Compute r2_sq = r2**2.
Compute numer1 = ((n1-1)*r1_sq* sy1_sq) + ((n2-1)*r2_sq* sy2_sq).
Compute numer2 = (((n1-1)*r1 * sx1 * sy1)+ ((n2-1)*r2 * sx2 * sy2))**2.
Compute numer3 = ((n1-1)* sx1_sq)+ ((n2-1)* sx2_sq).
Compute numer = numer1 - (numer2 / numer3).
compute denom = ((n1-2)*(1-r1_sq)* sy1_sq) + ((n2-2)*(1-r2_sq)* sy2_sq).
compute f2 = numer/denom.
Compute df1 = 1. 
Compute df2 = n-4.
Compute Lambda = f2 * df2.
COMPUTE F_Table = IDF.F(1-alpha,df1, df2) .
COMPUTE Power = 1-NCDF.F(F_table,df1, df2, lambda) .

MATRIX.
GET M /VARIABLES=n1 n2 lambda power.
print M/title = "Group Based Regression Interaction"/clabels = "n1" "n2" "Lambda" "Power"/format f9.3.
End Matrix.