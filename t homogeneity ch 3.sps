** Modify the values 50, 68, 40, and 22 below to match your frequencies
** File creates several datafiles in your C:\Temp directory. If for some reason you don't have a 
** C:\Temp directory, either change syntax to a directory that does exist or simply make a c:\temp
** directory. 

INPUT PROGRAM.
LOOP n=120 TO 400 by 24.
END CASE.
END LOOP.
END FILE.
END INPUT PROGRAM.
EXECUTE .


**** Prop_N1 = Proportion of cases in first group -- set to .50 for equal # in each group

Compute Prop_N1 = 0.25.
Compute N1 = N * Prop_N1.
Compute N2 = N * (1-Prop_N1).
Compute M1 = 1.3.
Compute M2 = 0.
Compute S1 = 4.
Compute S2 = 1.
compute alpha = .05.
compute tails = 2.
execute.

***** Modifications End Here******

Compute df = n-2. 
compute n_harm = ((2*n1*n2)/(n1+n2)). 
compute var1 = s1*s1.
compute var2 = s2*s2.
compute nxs1 = (n1-1)*(var1). 
compute nxs2 = (n2-1)*(var2). 
compute s2p = (nxs1+nxs2)/(df).
compute sp = sqrt(s2p). 
compute d = (M1-M2)/sp.
compute delta = d*sqrt(n_harm / 2).
Compute alpha_tails = alpha/tails.
Compute fail = 1-alpha_tails.
COMPUTE t_table = IDF.t(fail,df) .
execute.

Compute sat_num = ((var1/n1)+(var2/n2)) *((var1/n1) + (var2/n2)).
compute sat_denom = ((((var1/n1)**2))/(n1-1)) +((((var2/n2)**2))/(n2-1)).

compute sx1_un = s1/sqrt(n1).
compute sx2_un = s2/sqrt(n2).
compute sx1x2_un = sqrt(sx1_un**2+sx2_un**2).
compute t_un = (M1-M2)/sx1x2_un.
Compute d_un = t_un * sqrt((n1+n2)/(n1*n2)).
Compute df_un = sat_num/sat_denom.
Compute delta_un = d_un*sqrt(n_harm / 2).
COMPUTE t_table_un = IDF.t(fail,df_un) .
COMPUTE Power_Eq = 1-NCDF.t(t_table,df,delta) .
COMPUTE Power_Un = 1-NCDF.t(t_table_un,df_un,delta_un) .
execute.



String n1string (a8).
COMPUTE n1string = String(n1, F8.2) .
COMPUTE select = (INDEX(UPCASE(n1string),'00') > 0).  
FILTER OFF.
USE ALL.
SELECT IF(select = 1).

MATRIX.
GET M /VARIABLES= n1 n2 d delta d_un delta_un power_eq power_un .
print M/title = "t test with homogeneity adjusted power"/clabels = "n1" "n2" "d" "delta" "d_un" "delta_un"  "power_eq" "power_un"/format f8.3.
End Matrix.