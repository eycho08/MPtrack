	*****----------------------------------
	** DLHS2 merge prep/////////////////////
	*****----------------------------------
use "H:\ec155\MPtrack\DHLS2-merge prep feb9.dta" 
	** drop non-match districts
drop if dist !=10 & dist !=17
	** drop unnecessary variables
drop S_NAME D_NAME newi nhi ihhwt hhwt phase H142 H140F_5 H140G_5 H140H_5 H140I_5 H140J_5 H140K_5 H140L_5 H140M_5 H140N_5 H140O_5 H140P_5 H141_5 H134_5 H135_5 H135A_5 H136_5 H137_5 H138_5 H139_5 H140A_5 H140B_5 H140C_5 H140D_5 H140E_5 H122 H123AB H123AG H123AT MAR_1 H123BB_1 H123BG_1 MAR_2 H123BB_2 H123BG_2 MAR_3 H123BB_3 H123BG_3 MAR_4 H123BB_4 H123BG_4 H124 H125M H125F H125T DEATH_1 H126_1 H127_1 H128U_1 H128AD_1 H129M_1 H129Y_1 H130_1 H131_1 H132_1 H133_1 H134_1 H135_1 H135A_1 H136_1 H137_1 H138_1 H139_1 H140A_1 H140B_1 H140C_1 H140D_1 H140E_1 H140F_1 H140G_1 H140H_1 H140I_1 H140J_1 H140K_1 H140L_1 H140M_1 H140N_1 H140O_1 H140P_1 H141_1 DEATH_2 H126_2 H127_2 H128U_2 H128AD_2 H129M_2 H129Y_2 H130_2 H131_2 H132_2 H133_2 H134_2 H135_2 H135A_2 H136_2 H137_2 H138_2 H139_2 H140A_2 H140B_2 H140C_2 H140D_2 H140E_2 H140F_2 H140G_2 H140H_2 H140I_2 H140J_2 H140K_2 H140L_2 H140M_2 H140N_2 H140O_2 H140P_2 H141_2 DEATH_3 H126_3 H127_3 H128U_3 H128AD_3 H129M_3 H129Y_3 H130_3 H131_3 H132_3 H133_3 H134_3 H135_3 H135A_3 H136_3 H137_3 H138_3 H139_3 H140A_3 H140B_3 H140C_3 H140D_3 H140E_3 H140F_3 H140G_3 H140H_3 H140I_3 H140J_3 H140K_3 H140L_3 H140M_3 H140N_3 H140O_3 H140P_3 H141_3 DEATH_4 H126_4 H127_4 H128U_4 H128AD_4 H129M_4 H129Y_4 H130_4 H131_4 H132_4 H133_4 H134_4 H135_4 H135A_4 H136_4 H137_4 H138_4 H139_4 H140A_4 H140B_4 H140C_4 H140D_4 H140E_4 H140F_4 H140G_4 H140H_4 H140I_4 H140J_4 H140K_4 H140L_4 H140M_4 H140N_4 H140O_4 H140P_4 H141_4 DEATH_5 H126_5 H127_5 H128U_5 H128AD_5 H129M_5 H129Y_5 H130_5 H131_5 H132_5 H133_5
drop H119 H120 H121A H121B H121C H121D H121E H121F H121G H121H H121I
	** reshape wide to long
reshape long H101_ H102_ H103_ H104_ H105_ H106_ H107_ H108_ H109_ H110_ H111_ H112_ H113_, i( dist psu tal srv HH_PK) j(member)
	** drop member-organized unnecessary variables
drop H103_ H104_ H105_ H111_ H112_ H113_
	** label reshaped variables
label var H101_ "line number of respondent"
label var H102_ "relationship"
label var H106_ "gender"
label var H107_ "age"
label var H108_ "marital status"
label var H109_ "can read write"
label var H110_ "years of schooling"
	** analyze missing data and drop member numbers
mvpatterns H102_ H106_ H107_ H108_ H109_ H110_ H114 H115 if membern>25
mvpatterns if membern>25
summ HH_PK
summ HH_PK if membern>25
drop if membern>25
	** missing member hh line no allows to drop non-existant hh members for each hh instead of dropping by general membern variable
mvpatterns H101_ H102_ H102_ H109_ H110_
drop if H101_==.
	******--------------------------------
	** recoding to match DLHS3 //////////
	******-------------------------------
replace H102_=14 if H102_==13
	**
replace hhst=9 if hhst==8
replace hhst=8 if hhst==7
replace hhst=7 if hhst==6
replace hhst=6 if hhst==5
replace hhst=5 if hhst==4
replace hhst=4 if hhst==3
replace hhst=3 if hhst==2
	**
replace H114=96 if H114==9
replace H114=. if H114==99
replace H114=9 if H114==8
replace H114=8 if H114==7
	**
replace H115=. if H115==99
	**
replace H116=6 if H116==7
replace H116=. if H116==99
	**
replace H117=. if H117==9
	**
replace H118=. if H118==9
