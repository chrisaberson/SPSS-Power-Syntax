
** File creates several datafiles in your d:\Temp directory. If you don't have a 
** d:\Temp directory, either change syntax to a directory that does exist or simply make a d:\temp
** directory. 

** 3 x 2 design

DATA LIST LIST / x1 x2 po.
BEGIN DATA
1 1 .25
1 2 .25
2 1 .10
2 2 .10
3 1 .25
3 2 .05
END DATA.

compute n = 100.
Compute alpha = .05.



compute fo = po * n. 
execute.
WEIGHT BY fo.
If (x1=1) sumx1_1 = sum(fo).
If (x1=2) sumx1_2 = sum(fo).
If (x2=1) sumx2_1 = sum(fo).
If (x2=2) sumx2_2 = sum(fo).
If (x1=3) sumx1_3 = sum(fo).
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
	/Row3 = n(sumx1_3)
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
If (x1=3 and x2=1) fe = (row3*col1) / n.
If (x1=3 and x2=2) fe = (row3*col2) / n.
Compute chiwork = ((fo-fe)**2) / fe.
execute. 


SAVE OUTFILE='d:\temp\chipowerind2.sav'
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


Erase File = 'd:\temp\temp.sav'.

SAVE OUTFILE='d:\temp\chipowerind2.sav'
 /COMPRESSED.
WEIGHT by fo.

Compute Phi = sqrt(chi/n).
COMPUTE lambda = N*(Phi*Phi) .
COMPUTE Chi_Table = IDF.CHISQ(1-alpha,df) .
COMPUTE power = 1-NCDF.CHISQ(Chi_Table,df,Lambda) .
EXECUTE .

SUMMARIZE
  /TABLES=N power
  /FORMAT=NOLIST NOTOTAL
  /TITLE='Case Summaries'
  /MISSING=VARIABLE
  /CELLS=MEAN .

