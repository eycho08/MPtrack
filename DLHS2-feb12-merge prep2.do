	*****------------------
	** renaming and defining variables for merge///////////
	*****---------------------------
label define Districts 2910 "Uttara Kannada" 2917 "Chikamaglur"
label values dist Districts
rename HP01 htotal
rename HM01 hmale
rename HF01 hfemale
rename H101_ lineno
rename H102_ relation
rename H106_ gender
rename H107_ age
rename H108_ marital
rename H109_ literate
rename H110_ yrschl
rename H114 hrelig
rename H115 hcaste
rename type rural
rename H116 water
rename H117 htype
rename H118 htoilet
rename HH_PK hhno
rename tal htehsil
gen year=2004
label var year year
drop lnrhh
rename hhst hstatus
