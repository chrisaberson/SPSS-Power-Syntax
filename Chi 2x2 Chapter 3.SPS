** Modify the values 50, 68, 40, and 22 below to match your frequencies
** File creates several datafiles in your d:\Temp directory. If you don't have a 
** d:\Temp directory, either change syntax to a directory that does exist or simply make a d:\temp
** directory. 


***** Modifications Start Here******

DATA LIST LIST / x1 x2 po.
BEGIN DATA
1 1 .28
1 2 .38
2 1 .22
2 2 .12
END DATA.

compute n = 180.
compute alpha = .05.



***** Modifications End Here******

compute fo = po * n. 
execute.
WEIGHT BY fo.
If (x1=1) sumx1_1 = sum(fo).
If (x1=2) sumx1_2 = sum(fo).
If (x2=1) sumx2_1 = sum(fo).
If (x2=2) sumx2_2 = sum(fo).
execute. 


SORT CASES BY x1.
COMPUTE nobreak=1.
AGGREGATE OUTFILE='d:\temp\temp.sav'
	/PRESORTED
	/BREAK=nobreak
	/cat1=MAX(x1)
	/cat2=MAX(x2)
            /N = n(fo)
 	/Row1 = n(sumx1_1)
	/Row2 = n(sumx1_2)
	/Col1 = n(sumx2_1)
	/Col2 = n(sumx2_2).

MATCH FILES FILE=*
	/TABLE='d:\temp\temp.sav'
	/BY=nobreak.
Execute.

Compute df = (cat1-1)*(cat2-1).
If (x1=1 and x2=1) fe = (row1*col1) / n.
If (x1=1 and x2=2) fe = (row1*col2) / n.
If (x1=2 and x2=1) fe = (row2*col1) / n.
If (x1=2 and x2=2) fe = (row2*col2) / n.
Compute chiwork = ((fo-fe)**2) / fe.
execute. 


SAVE OUTFILE='d:\temp\chipowerind.sav'
 /COMPRESSED.
WEIGHT
  OFF.
SORT CASES BY x1.

AGGREGATE  OUTFILE='d:\temp\temp.sav'
	/PRESORTED
	/BREAK=nobreak
	/Chi = SUM(chiwork).

MATCH FILES FILE=*
	/TABLE='d:\temp\temp.sav'
	/BY=nobreak.
Execute.

SAVE OUTFILE='d:\temp\chipowerind.sav'
 /COMPRESSED.
WEIGHT by fo.
Compute fail = 1-alpha.
Compute Phi = sqrt(chi/n).
COMPUTE lambda = N*(Phi*Phi) .
COMPUTE Chi_Table = IDF.CHISQ(fail,df) .
COMPUTE power = 1-NCDF.CHISQ(Chi_Table,df,Lambda) .
EXECUTE .


SUMMARIZE
  /TABLES=N power
  /FORMAT=NOLIST NOTOTAL
  /TITLE='Case Summaries'
  /MISSING=VARIABLE
  /CELLS=MEAN .

Erase File = 'd:\temp\temp.sav'.

