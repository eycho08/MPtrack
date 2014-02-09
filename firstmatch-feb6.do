use "H:\ec155\MastersProject\Data\DLHS3\DLHS3HIND - Karnataka - first match.DTA"
	*****----------------------------
	**renumbering variables for reshaping///////////
	*****-----------------------------
rename hvline_0 hhline1
rename hvline_1 hhline2
rename hvline_2 hhline3
rename hvline_3 hhline4
rename hvline_4 hhline5
rename hvline_5 hhline6
rename hvline_6 hhline7
rename hvline_7 hhline8
rename hvline_8 hhline9
rename hvline_9 hhline10
rename hvline10 hhline11
rename hvline11 hhline12
rename hvline12 hhline13
rename hvline13 hhline14
	**
rename hv103_01 hv103_1
rename hv103_02 hv103_2
rename hv103_03 hv103_3
rename hv103_04 hv103_4
rename hv103_05 hv103_5
rename hv103_06 hv103_6
rename hv103_07 hv103_7
rename hv103_08 hv103_8
rename hv103_09 hv103_9
	**
rename hv105_01 hv105_1
rename hv105_02 hv105_2
rename hv105_03 hv105_3
rename hv105_04 hv105_4
rename hv105_05 hv105_5
rename hv105_06 hv105_6
rename hv105_07 hv105_7
rename hv105_08 hv105_8
rename hv105_09 hv105_9
	**
rename hv106_01 hv106_1
rename hv106_02 hv106_2
rename hv106_03 hv106_3
rename hv106_04 hv106_4
rename hv106_05 hv106_5
rename hv106_06 hv106_6
rename hv106_07 hv106_7
rename hv106_08 hv106_8
rename hv106_09 hv106_9
	**
rename hv107_01 hv107_1
rename hv107_02 hv107_2
rename hv107_03 hv107_3
rename hv107_04 hv107_4
rename hv107_05 hv107_5
rename hv107_06 hv107_6
rename hv107_07 hv107_7
rename hv107_08 hv107_8
rename hv107_09 hv107_9
	**
rename hv108_01 hv108_1
rename hv108_02 hv108_2
rename hv108_03 hv108_3
rename hv108_04 hv108_4
rename hv108_05 hv108_5
rename hv108_06 hv108_6
rename hv108_07 hv108_7
rename hv108_08 hv108_8
rename hv108_09 hv108_9
	**
rename hv109_01 hv109_1
rename hv109_02 hv109_2
rename hv109_03 hv109_3
rename hv109_04 hv109_4
rename hv109_05 hv109_5
rename hv109_06 hv109_6
rename hv109_07 hv109_7
rename hv109_08 hv109_8
rename hv109_09 hv109_9
	**
rename hv110_01 hv110_1
rename hv110_02 hv110_2
rename hv110_03 hv110_3
rename hv110_04 hv110_4
rename hv110_05 hv110_5
rename hv110_06 hv110_6
rename hv110_07 hv110_7
rename hv110_08 hv110_8
rename hv110_09 hv110_9
	**
rename hv111_01 hv111_1
rename hv111_02 hv111_2
rename hv111_03 hv111_3
rename hv111_04 hv111_4
rename hv111_05 hv111_5
rename hv111_06 hv111_6
rename hv111_07 hv111_7
rename hv111_08 hv111_8
rename hv111_09 hv111_9
	**
rename hv112_01 hv112_1
rename hv112_02 hv112_2
rename hv112_03 hv112_3
rename hv112_04 hv112_4
rename hv112_05 hv112_5
rename hv112_06 hv112_6
rename hv112_07 hv112_7
rename hv112_08 hv112_8
rename hv112_09 hv112_9
	**
rename hv113_01 hv113_1
rename hv113_02 hv113_2
rename hv113_03 hv113_3
rename hv113_04 hv113_4
rename hv113_05 hv113_5
rename hv113_06 hv113_6
rename hv113_07 hv113_7
rename hv113_08 hv113_8
rename hv113_09 hv113_9
	**
rename hv114_01 hv114_1
rename hv114_02 hv114_2
rename hv114_03 hv114_3
rename hv114_04 hv114_4
rename hv114_05 hv114_5
rename hv114_06 hv114_6
rename hv114_07 hv114_7
rename hv114_08 hv114_8
rename hv114_09 hv114_9
	**
	******-----------------------------------
	*****reshaping data////////////////////
	******----------------------------------
reshape long hhline hv103_ hv105_ hv106_ hv107_ hv108_ hv109_ hv110_ hv111_ hv112_ hv113_ hv114_, i( dist psu hhno htehsil) j(membern)
	******-----------------------------------
	******labeling/renaming newly shaped variables///
	*******----------------------------------
label variable hv103_ "relationship"
label variable hv105_ "gender"
label variable hv106_ "age"
label variable hv107_ "marital status
label var hv108_ "can read write"
label variable hv109_ "ever been to school"
label var hv110_ "reasons for never schl"
label var hv111_ "completed years schl"
label var hv112_ "still in college/school"
label var hv113_ "main reason not going to school"
label var hv114_ "unmarried/ever married"
label var hhline "member line no"
rename hv103_ hv103
rename hv105_ hv105
rename hv106_ hv106
rename hv107_ hv107
rename hv108_ hv108
rename hv109_ hv109
rename hv110_ hv110
rename hv111_ hv111
rename hv112_ hv112
rename hv113_ hv113
rename hv114_ hv114
	*******
label var membern "hh member no"
	******----------------------------
	****missing data pattern by member no/////
	*****-----------------------------
mvpatterns hv103 hv105 hv106 hv107 hv108 hv108 hv109 hv110 hv111 hv112 hv113 hv114 if membern>20
mvpatterns hv103 hv105 hv106 hv107 hv108 hv108 hv109 hv111 if membern==20
mvpatterns hv103 hv105 hv106 hv107 hv108 hv108 hv109 hv111 if membern==21
tab hv103 hhno if membern==20
mvpatterns hv103 hv105 hv106 hv107 hv108 hv108 hv109 hv110 hv111 hv112 hv113 hv114 if membern>25
summ psu if membern>25
	**
drop if membern>25
