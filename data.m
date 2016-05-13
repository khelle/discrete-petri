cableNames = { ...
	'tAAL_2_AAK', 'tAAK_2_AAL', % todo
	'tAAK_2_AAJ', 'tAAJ_2_AAK', % Herby - Lubliniec %
	'tAAL_2_AAP', 'tAAP_2_AAL',
	'tAAL_2_AAN', 'tAAN_2_AAL', % todo: DODAĆ ARC	
	'tAAL_2_AAU', 'tAAU_2_AAL', %TODO
	'tAAU_2_AAV', 'tAAV_2_AAU',%Poraj - Mijaczów	19,708
	'tAAV_2_AAW', 'tAAW_2_AAV', 
	'tAAL_2_AAQ', 'tAAQ_2_AAL', 
	'tAAL_2_AAR', 'tAAR_2_AAL', %todo: Wrzosowa - HC Walcownia
	'tAAL_2_ABB', 'tABB_2_AAL', %todo: Wrzosowa - Julianka
	'tABB_2_ABA', 'tABA_2_ABB',   %Julianka - Koniecpol
	'tABA_2_AAZ', 'tAAZ_2_ABA',   %Koniecpol - Szczekociny
	'tAAZ_2_AAY', 'tAAY_2_AAZ',   %Szczekociny - Zawada
	'tAAY_2_AAX', 'tAAX_2_AAY',   %Zawada - Kotowice
	'tAAL_2_AAS', 'tAAS_2_AAL', %todo: Wrzosowa - Rudniki
	'tAAA_2_AAR', 'tAAR_2_AAA', %todo: Aniołów - HC Walcownia
	'tAAA_2_AAQ', 'tAAQ_2_AAA', %todo: Aniołów - Guardian (Huta Mirów)
	'tAAA_2_AAT', 'tAAT_2_AAA', %todo: Aniołów - Rędziny
	'tAAT_2_AAS', 'tAAS_2_AAT',   %Rędziny - Rudniki
	'tAAA_2_AAB', 'tAAB_2_AAA', %todo: Aniołów - Kiedrzyn
	'tAAB_2_AAC', 'tAAC_2_AAB',   %Kiedrzyn - Zagórze
	'tAAA_2_AAM', 'tAAM_2_AAA', %todo: Aniołów - Sikorskiego
	'tAAN_2_AAP', 'tAAP_2_AAN', %todo: Kawodrza - Błeszno
	'tAAN_2_AAM', 'tAAM_2_AAN', %todo: Kawodrza - Sikorskiego
	'tAAN_2_AAO', 'tAAO_2_AAN', %Kawodrza - Kłobuck Płd.
	'tAAO_2_AAD', 'tAAD_2_AAO',   %Kłobuck Płd. - Kłobuck 110
	'tAAD_2_AAE', 'tAAE_2_AAD',   %Kłobuck 110 - Panki
	'tAAE_2_AAF', 'tAAF_2_AAE',   %Panki - Praszka
	'tAAF_2_AAG', 'tAAG_2_AAF', %merge! Praszka - Kluczbork 13,462|Kluczbork - Olesno 21,123
	'tAAG_2_AAH', 'tAAH_2_AAG',   %Olesno - Sowczyce
	'tAAH_2_AAI', 'tAAI_2_AAH',   %Sowczyce - Dobrodzień
    'tAAC_2_AAD', 'tAAD_2_AAC',
    'tAAW_2_AAX', 'tAAX_2_AAW'
    } 
	
	powerUsages = [ % MW
		25,997,%AAL_2_AAK
		21,384,%AAK_2_AAJ
		-3,41, %AAL_2_AAP
		0,558,%AAL_2_AAN
		6,389,%AAL_2_AAU
		-0,081,%AAU_2_AAV
		-0,469,%AAV_2_AAW
		-5,163,%AAL_2_AAQ
		8,182,%AAL_2_AAR
		-1,4,%AAL_2_ABB
		6,402,%ABB-ABA
		-9,579,%ABA-AAZ
		11,519,%AAZ-AAY
		9,878,%AAY-AAX
		-3,018,%AAL-AAS
		-3,832,%AAA-AAR
		-3,317,%AAA-AAQ
		7,557,%AAA-AAT
		1,852,%AAT-AAS
		-7,743,%AAA-AAB
		12,183,%AAB-AAC
		-5,175,%AAA-AAM
		-1,21,%AAN-AAP
		-2,985,%AAN-AAM
		-13,853,%AAN-AAO
		-16,492,%AAO-AAD
		23,495,%AAD-AAE
		-18,852,%AAE-AAF
		-1,116,%AAF-AAG
		1,117,%AAG-AAH
		1,277%AAH-AAI
		18,118,%AAC-AAD
		0,469%AAW-AAX
		];
	
	currentI = [ % kA
  0.138,%AAL-AAK
  0.115,%AAK-AAJ
  0.019,%AAL-AAP
  0.006,%AAL-AAN
  0.035,%AAL-AAU
  0.001,%AAU-AAV
  0.004,%AAV-AAW
  0.027,%AAL-AAQ
  0.043,%AAL-AAR
  0.01,%AAL-ABB
  0.034,%ABB-ABA
  0.051,%ABA-AAZ
  0.062,%AAZ-AAY
  0.053,%AAY-AAX
  0.024,%AAL-AAS
  0.02,%AAA-AAR
  0.017,%AAA-AAQ
  0.04,%AAA-AAT
  0.016,%AAT-AAS
  0.056,%AAA-AAB
  0.075,%AAB-AAC
  0.029,%AAA-AAM
  0.007,%AAN-AAP
  0.016,%AAN-AAM
  0.084,%AAN-AAO
  0.095,%AAO-AAD
  0.126,%AAD-AAE
  0.102,%AAE-AAF
  0.006,%AAF-AAG
  0.006,%AAG-AAH
  0.007,%AAH-AAI
  0.102,%AAC-AAD
  0.033%AAW-AAX
  ];
	
	cableTypes = {
	'AFL6 120', 'AFL6 120', %tAAL_2_AAK
	'AFL6 120', 'AFL6 120', %tAAK_2_AAJ
	'AFL6 240', 'AFL6 240',%'tAAL_2_AAP', 
	'AFL6 240', 'AFL6 240',%'tAAL_2_AAN', 
	'AFL6 120', 'AFL6 120',	%'tAAL_2_AAU', 
	'AFL6 120', 'AFL6 120',	%'tAAU_2_AAV', 
	'AFL6 120', 'AFL6 120',	%'tAAV_2_AAW', 
	'AFL6 120', 'AFL6 120',	%'tAAL_2_AAQ', 
	'AFL6 240', 'AFL6 240',	% 'tAAL_2_AAR',
	'AFL6 185', 'AFL6 185',	%'tAAL_2_ABB', 
	'AFL6 185', 'AFL6 185',	%'tABB_2_ABA', 
	'AFL6 185', 'AFL6 185',	%'tABA_2_AAZ', 
	'AFL6 240', 'AFL6 240',	%'tAAZ_2_AAY', 
	'AFL6 240', 'AFL6 240',	%'tAAY_2_AAX', 
	'AFL6 240', 'AFL6 240',	%'tAAL_2_AAS', 
	'AFL6 240', 'AFL6 240',	%'tAAA_2_AAR', 
	'AFL6 185', 'AFL6 185',	%'tAAA_2_AAQ', 
	'AFL6 240', 'AFL6 240',	%'tAAA_2_AAT', 
	'AFL6 240', 'AFL6 240',	%'tAAT_2_AAS', 
	'AFL6 240', 'AFL6 240',	%'tAAA_2_AAB', 
	'AFL6 240', 'AFL6 240',	%'tAAB_2_AAC', 
	'AFL6 240', 'AFL6 240',	%'tAAA_2_AAM',
	'AFL6 240', 'AFL6 240',	%'tAAN_2_AAP'
	'AFL6 240', 'AFL6 240',	%'tAAN_2_AAM'
	'AFL6 240', 'AFL6 240',%'tAAN_2_AAO'
	'AFL6 185', 'AFL6 185',	%'tAAO_2_AAD'
	'AFL6 240', 'AFL6 240',	%'tAAD_2_AAE'
	'AFL6 240', 'AFL6 240',	%'tAAE_2_AAF'
	'AFL6 240', 'AFL6 240',	%'tAAF_2_AAG'
	'AFL6 240', 'AFL6 240', %'tAAG_2_AAH'
	'AFL6 240',	'AFL6 240'%'tAAH_2_AAI'		
    'AFL6 185', 'AFL6 185'%'tAAC_2_AAD'
    'AFL6 240', 'AFL6 240'%'tAAW_2_AAX'
}

% lines in m 
cableLengths = [ ...
	23026, 23026,
	13859, 13859,
	4185, 4185,
	9328, 9328,
	9552, 9552,
	19708,19708,
	8360, 8360,
	4420, 4420,
	4907, 4907,
	24497, 24497,
	15154, 15154,
	21074, 21074,
	8375, 8375,
	18599, 18599,
	21361, 21361,
	10552, 10552,
	7696, 7696,
	8364, 8364,
	3073, 3073,
	2877, 2877,
	17617, 17617,
	4181, 4181,
	7733, 7733,
	5047, 5047,
	14913, 14913,
	6938, 6938,
	13140, 13140,
	31193, 31193,
	34585, 34585,
	8023, 8023,
	20056, 20056,
    2952, 2952,
    19576, 19576
]

%TODO tabela z I dla kabli
electricCurrent = 1;		%AMPERS
cableTypeNames = {'AFL6 120','AFL6 185','AFL6 240'};
aluminiumTemperatureResistanceCoefficient = 4,4 /1000; 		% K ^ -1 
aluminiumSpecificHeat = 900;		% J/(kg·K)
cableResistanceIn20Cels = [0.2214, 0.1482, 0.1172] * 10^-3; 	% ohm/m
cableMassPerKm = [518, 769, 952] * 10^-3;
baseTemperature = 20;		% celsius
	% in 10^(-6)/C
cableCoilExpansionFactor  = 11.5 * 10^-6;
thermalExpansionFactors = [19.23, 19.18, 19.5] * 10^-6 		% 10^-6 / C;


CableName2CableLength = containers.Map(cableNames,cableLengths);
CableName2CableType = containers.Map(cableNames, cableTypes);
CableType2ThermalExpansionFactors = containers.Map(cableTypeNames, thermalExpansionFactors);
CableType2CableResistanceIn20Cels = containers.Map(cableTypeNames, cableResistanceIn20Cels);
CableType2CableMassPerKm = containers.Map(cableTypeNames, cableMassPerKm);
CableName2PowerUsage = containers.Map(cableNames, powerUsages);
