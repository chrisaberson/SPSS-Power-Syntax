** File creates several datafiles in your d:\Temp directory. If you don't have a 
** d:\Temp directory, either change syntax to a directory that does exist or simply make a d:\temp
** directory. 

*** Goodness of fit

DATA LIST LIST / x1 po pe.
BEGIN DATA
1 .25 .25
2 .20 .25
3 .20 .25
4 .35 .25
END DATA.

compute n = 10.
compute alpha = .05.

compute fo = po * n. 
compute fe = pe * n.
execute.
WEIGHT BY fo.


SORT CASES BY x1.
COMPUTE nobreak=1.
AGGREGATE OUTFILE='d:\temp\temp.sav'
	/PRESORTED
	/BREAK=nobreak
	/cat1=MAX(x1)
	/N = n(fo).
 	
MATCH FILES FILE=*
	/TABLE='d:\temp\temp.sav'
	/BY=nobreak.
Execute.

Compute df = (cat1-1).
Compute chiwork = ((fo-fe)**2) / fe.
execute. 
COMPUTE propO = fo / N .
COMPUTE propE = fe / N .
compute phipart= ((propO-propE)**2)/propE.
EXECUTE .

SAVE OUTFILE='d:\temp\chigfpower.sav'
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




SAVE OUTFILE='d:\temp\chigfpower.sav'
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
