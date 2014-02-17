	*******-------------------------
	** Test Diff-in-Diff
	*******-------------------------
gen treat=1 if dist==2917
replace treat=0 if dist==2910
tab treat
summ age, detail
summ age if age==999
replace age=. if age==999
summ age, detail
gen agegr=1 if age<6
replace agegr=2 if age>=6 & age<18
replace agegr=3 if age>=18 & age<30
replace agegr=4 if age>=30 & age<42
replace agegr=5 if age>=42 & age<54
replace agegr=6 if age>=54 & age<66
replace agegr=7 if age>=66
replace agegr=. if age==.
tab agegr
gen post=1 if year==2008
replace post=0 if year==2004
gen treatpost=treat*post
reg yrschl treat post treatpost
