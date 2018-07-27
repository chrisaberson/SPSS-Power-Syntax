** File creates several datafiles in your d:\Temp directory. If you don't have a 
** d:\Temp directory, either change syntax to a directory that does exist or simply make a d:\temp
** directory. 


DATA LIST LIST /a b c.
BEGIN DATA
1 -.15 -.60
-.15  1 .25
-.60 .25 2
END DATA.

COMPUTE ID=$CASENUM.
Save OUTFILE='d:\temp\testmatrix1.sav'.

* read matrix data from a regular spss sav file.

MATRIX.
GET M /VARIABLES= a TO c.
PRINT M /TITLE='Original matrix'.
COMPUTE N=INV(M).
PRINT N /TITLE='Inverse of Matrix'.
Save N
/outifle = 'd:\temp\testmatrix2.sav'
/variables = ai bi ci.
END MATRIX.

GET FILE='d:\temp\testmatrix2.sav'.
COMPUTE ID=$CASENUM.
Compute ID2 = 4-$CASENUM.
Save OUTFILE='d:\temp\testmatrix2.sav'.

GET FILE='d:\temp\testmatrix1.sav'.
SORT CASES BY ID.
MATCH FILES FILE=*
	/TABLE='d:\temp\testmatrix2.sav'
	/BY=ID.
Execute. 

****Add these four values

Compute ry1 = .4.
Compute ry2 = .4.
Compute ry3 = -.4.
Compute R2 = .467.

If (id=1 and id2=3) r11 = ai.
If (id=2 and id2=2) r12 = ai.
If (id=3 and id2=1) r13 = ai.

If (id=1 and id2=3) beta1pt1 = ry1*r11.
If (id=2 and id2=2) beta1pt2 = ry2*r12.
If (id=3 and id2=1) beta1pt3 = ry3*r13.
execute.

If (id=1 and id2=3) r21 = bi.
If (id=2 and id2=2) r22 = bi.
If (id=3 and id2=1) r23 = bi.

If (id=1 and id2=3) beta2pt1 = ry1*r21.
If (id=2 and id2=2) beta2pt2 = ry2*r22.
If (id=3 and id2=1) beta2pt3 = ry3*r23.
If (id=1 and id2=3) r_ii = ai.
If (id=2 and id2=2) r_jj = bi.
If (id=2 and id2=2) r_ij = ai.
execute.


SAVE OUTFILE='d:\temp\testmatrix1.sav'
 /COMPRESSED.
WEIGHT
  OFF.
SORT CASES BY ID.

COMPUTE nobreak=1.
AGGREGATE  OUTFILE='d:\temp\testmatrix3.sav'
	/PRESORTED
	/BREAK=nobreak
	/beta1pt1x = SUM(beta1pt1)
	/beta1pt2x = SUM(beta1pt2)
	/beta1pt3x = SUM(beta1pt3)
	/beta2pt1x = SUM(beta2pt1)
	/beta2pt2x = SUM(beta2pt2)
	/beta2pt3x = SUM(beta2pt3)
	/rii = SUM(r_ii)
	/rij = SUM(r_ij)
	/rjj = SUM(r_jj)
	/Rsq = Max(R2)
	/k = max(ID).


GET FILE='d:\temp\testmatrix3.sav'.


Compute N = 892.
Compute Beta1 = beta1pt1x +beta1pt2x +beta1pt3x  .
Compute Beta2 = beta2pt1x +beta2pt2x +beta2pt3x  .
Compute sebpt1 = (1-Rsq) / (n-k-1).
Compute sebpt2 = (rii+rjj+(2*rij)).
Compute seb1_b2 = (sebpt1*sebpt2)**.5.
Compute t = abs ((beta1-beta2) / seb1_b2).
Compute t2 = t**2.
compute df = n-3.
Compute p = SIG.F(t2,1,df).
Compute alpha = .05.
Compute fail = 1-(alpha/2).
COMPUTE t_table = IDF.t(fail,df) .
Compute LL = (abs (beta1-beta2)) - (t_table*seb1_b2).
Compute UL = (abs (beta1-beta2)) + (t_table*seb1_b2).
COMPUTE Power = 1-NCDF.t(t_table,df,t) .
execute.

MATRIX.
GET M /VARIABLES= n ll ul power.
print M/title = "Comparing two dependent predictors"/clabels = "n" "LL" "UL" "power"/format f9.3.
End Matrix.

***Run these after closing the datafiles to clean up directory

Erase File = 'd:\temp\testmatrix1.sav'.
Erase File = 'd:\temp\testmatrix2.sav'.
Erase File = 'd:\temp\testmatrix3.sav'.