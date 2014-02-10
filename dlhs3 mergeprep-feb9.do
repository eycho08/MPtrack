	******-------------------------
	*** merge prep feb/9//////////
	******-----------------------
use "H:\ec155\MPtrack\DLHS3HH-merge prep feb9.dta" 
	** dropping variables unmatched with DLHS2
drop hfedit hoedit hkey hinvest hv101h hv101m hv101m hv118 hv119a hv119b hv119c hv119d hv119e hv119f hv119g hv119h hv119i hv121 hv122 hv123 hv125 hv126 hv127 hv128a hv128b hv129a hv129b hv129c hv129d hv129e hv129f hv129g hv129h hv129i hv129j hv129k hv129l hv129m hv129n hv129o hv129p hv129q hv129r hv129s hv129t hv129u hv129v hv129w hv129x hv129y hv130 hv131 hv132 hv133a hv133b hv133c hv133d hv133e hv133f hv133g hv134 hv135 hv136a hv136b hv136c hv136d hv136e hv136f hv136g hv137 hv138a hv138b hv138c hv138d hv138e hv138f hv138g hv138h hv138i hv138j hv138k hv140t hv151a01 hv151ba0 hv151bb0 hv151bc0 hv151bd0 hv151be0 hv151bf0 hv151bg0 hv151bh0 hv151bi0 hv151a02 hv151ba1 hv151bb1 hv151bc1 hv151bd1 hv151be1 hv151bf1 hv151bg1 hv151bh1 hv151bi1 hv151a03 hv151ba2 hv151bb2 hv151bc2 hv151bd2 hv151be2 hv151bf2 hv151bg2 hv151bh2 hv151bi2 hv151a04 hv151ba3 hv151bb3 hv151bc3 hv151bd3 hv151be3 hv151bf3 hv151bg3 hv151bh3 hv151bi3 hv151a05 hv151ba4 hv151bb4 hv151bc4 hv151bd4 hv151be4 hv151bf4 hv151bg4 hv151bh4 hv151bi4 hv151a06 hv151ba5 hv151bb5 hv151bc5 hv151bd5 hv151be5 hv151bf5 hv151bg5 hv151bh5 hv151bi5 hv151a07 hv151ba6 hv151bb6 hv151bc6 hv151bd6 hv151be6 hv151bf6 hv151bg6 hv151bh6 hv151bi6 hv151a08 hv151ba7 hv151bb7 hv151bc7 hv151bd7 hv151be7 hv151bf7 hv151bg7 hv151bh7 hv151bi7 hv151a09 hv151ba8 hv151bb8 hv151bc8 hv151bd8 hv151be8 hv151bf8 hv151bg8 hv151bh8 hv151bi8 hv151a10
	** dropping weights
drop hhwt emwt umwt shhwt sewwt sumwt ihhwt iewwt iunmwt
	** dropping unnecessary village/hh info
drop psupop segno nsegsl
	** dropping more observations based on missing age/gender instead of general membern variable
mvpatterns hhline hv105 hv106 hv108 hv109
drop if hv016==.	
	*****----------------------------
	** recoding to incorporate DLHS2 ////
	*****-----------------------------
replace hv107=3 if hv107==4
replace hv107=4 if hv107==5
	**
replace hv117=1 if hv117==2
replace hv117=2 if hv117==3
replace hv117=3 if hv117==4 | hv117==5
replace hv117=4 if hv117==6
replace hv117=5 if hv117==7
replace hv117=8 if hv117==9 | hv117==10 | hv117==11 | hv117==12
replace hv117=6 if hv117==13
replace hv117=7 if hv117==14
replace hv117=9 if hv117==96
	**
replace hv120=1 if hv120==11 | hv120==12 | hv120==13 | hv120==14 | hv120==15
replace hv120=2 if hv120==21 | hv120==22 | hv120==23
replace hv120=9 if hv120==31 | hv120==41 | hv120==96
replace hv120=5 if hv120==51
