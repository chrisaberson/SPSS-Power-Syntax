***Two factor within simple effects
***This syntax can be problematic. The first set reflects what should work. 
***Following this syntax are three files that account for problems within SPSS running the analyses

MATRIX DATA VARIABLES = ROWTYPE_  pre_A post_A twohour_A sixhour_A pre_b post_b twohour_b sixhour_b.
BEGIN DATA
Mean -0.25 0.00 0.10 0.15 -0.25 .10 .30 .35
STDEV 0.40 0.50 2.5 2.0 0.40 0.50 2.5 2.0
N 335 335 335 335 335 335 335 335
Corr 1
Corr .5 1 
Corr .5 .5 1
Corr .5 .5 .5 1
Corr .5 .5 .5 .5  1
Corr .5 .5 .5 .5 .5 1
Corr .5 .5 .5 .5 .5 .5 1
Corr .5 .5 .5 .5 .5 .5 .5 1
END DATA. 	


MANOVA pre_A post_A twohour_A sixhour_A pre_b post_b twohour_b sixhour_b
 /WSFACTOR = condition(2) time(4)
 /MATRIX=IN(*)
 /power F (.05) t(.05) exact
 /print  signif (mult averf) homogeneity (all) signif (AVERF HF GG EFSIZE)
 /WSDESIGN = time condition time*condition
/ WSDESIGN = Time WITHIN Condition (1)
/ WSDESIGN = Time WITHIN Condition (2).



*** Note the syntax above sometimes won't run under SPSS. I modified values below by changing the means
*** The same effect sizes are represented but sometimes, larger mean values help SPSS run the analysis


MATRIX DATA VARIABLES = ROWTYPE_  pre_A post_A twohour_A sixhour_A pre_b post_b twohour_b sixhour_b.
BEGIN DATA
Mean .75 1.00 1.10 1.15  .75 1.10 1.30 1.35
STDEV 0.40 0.50 2.5 2.0 0.40 0.50 2.5 2.0
N 335 335 335 335 335 335 335 335
Corr 1
Corr .5 1 
Corr .5 .5 1
Corr .5 .5 .5 1
Corr .5 .5 .5 .5  1
Corr .5 .5 .5 .5 .5 1
Corr .5 .5 .5 .5 .5 .5 1
Corr .5 .5 .5 .5 .5 .5 .5 1
END DATA. 	


MANOVA pre_A post_A twohour_A sixhour_A pre_b post_b twohour_b sixhour_b
 /WSFACTOR = condition(2) time(4)
 /MATRIX=IN(*)
 /power F (.05) t(.05) exact
 /print  signif (mult averf) homogeneity (all) signif (AVERF HF GG EFSIZE)
/ WSDESIGN = Time WITHIN Condition (1).

MANOVA pre_A post_A twohour_A sixhour_A pre_b post_b twohour_b sixhour_b
 /WSFACTOR = condition(2) time(4)
 /MATRIX=IN(*)
 /power F (.05) t(.05) exact
 /print  signif (mult averf) homogeneity (all) signif (AVERF HF GG EFSIZE)
/ WSDESIGN = Time WITHIN Condition (2).