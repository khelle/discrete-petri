cableNames = { ...
	'tWRZ_2_HER', 'tHER_2_WRZ', % todo
	'tHER_2_LBN', 'tLBN_2_HER', % Herby - Lubliniec %
	'tWRZ_2_BLE', 'tBLE_2_WRZ',
	'tWRZ_2_KAW', 'tKAW_2_WRZ', % todo: DODAĆ ARC	
	'tWRZ_2_PRJ', 'tPRJ_2_WRZ', %TODO
	'tPRJ_2_MIJ', 'tMIJ_2_PRJ',%Poraj - Mijaczów	19,708
	'tMIJ_2_POH', 'tPOH_2_MIJ', 
	'tWRZ_2_GUA', 'tGUA_2_WRZ', 
	'tWRZ_2_HCW', 'tHCW_2_WRZ', %todo: Wrzosowa - HC Walcownia
	'tWRZ_2_JLK', 'tJLK_2_WRZ', %todo: Wrzosowa - Julianka
	'tJLK_2_KNC', 'tKNC_2_JLK',   %Julianka - Koniecpol
	'tKNC_2_SKC', 'tSKC_2_KNC',   %Koniecpol - Szczekociny
	'tSKC_2_ZWA', 'tZWA_2_SKC',   %Szczekociny - Zawada
	'tZWA_2_KOT', 'tKOT_2_ZWA',   %Zawada - Kotowice
	'tWRZ_2_RUD', 'tRUD_2_WRZ', %todo: Wrzosowa - Rudniki
	'tANI_2_HCW', 'tHCW_2_ANI', %todo: Aniołów - HC Walcownia
	'tANI_2_GUA', 'tGUA_2_ANI', %todo: Aniołów - Guardian (Huta Mirów)
	'tANI_2_RED', 'tRED_2_ANI', %todo: Aniołów - Rędziny
	'tRED_2_RUD', 'tRUD_2_RED',   %Rędziny - Rudniki
	'tANI_2_KDN', 'tKDN_2_ANI', %todo: Aniołów - Kiedrzyn
	'tKDN_2_ZAG', 'tZAG_2_KDN',   %Kiedrzyn - Zagórze
	'tANI_2_SIK', 'tSIK_2_ANI', %todo: Aniołów - Sikorskiego
	'tKAW_2_BLE', 'tBLE_2_KAW', %todo: Kawodrza - Błeszno
	'tKAW_2_SIK', 'tSIK_2_KAW', %todo: Kawodrza - Sikorskiego
	'tKAW_2_KLP', 'tKLP_2_KAW', %Kawodrza - Kłobuck Płd.
	'tKLP_2_KLO', 'tKLO_2_KLP',   %Kłobuck Płd. - Kłobuck 110
	'tKLO_2_PAN', 'tPAN_2_KLO',   %Kłobuck 110 - Panki
	'tPAN_2_PRA', 'tPRA_2_PAN',   %Panki - Praszka
	'tPRA_2_OLE', 'tOLE_2_PRA', %merge! Praszka - Kluczbork 13,462|Kluczbork - Olesno 21,123
	'tOLE_2_SOW', 'tSOW_2_OLE',   %Olesno - Sowczyce
	'tSOW_2_DBR', 'tDBR_2_SOW',   %Sowczyce - Dobrodzień
    'tZAG_2_KLO', 'tKLO_2_ZAG',
    'tPOH_2_KOT', 'tKOT_2_POH'
    } 
	
	powerUsages = [ % MW
		25,997, % WRZ_2_HER
		21,384, %HER_2_LBN
		-3,41, %WRZ_2_BLE
		0,558,%WRZ_2_KAW
		6,389,%WRZ_2_PRJ
		-0,081,%PRJ_2_MIJ
		-0,469,%MIJ_2_POH
		-5,163,%WRZ_2_GUA
		8,182,%WRZ_2_HCW
		-1,4,%WRZ_2_JLK
		6,402,%JLK-KNC
		-9,579,%KNC-SKC
		11,519,%SKC-ZWA
		9,878,%ZWA-KOT
		-3,018,%WRZ-RUD
		-3,832,%ANI-HCW
		-3,317,%ANI-GUA
		7,557,%ANI-RED
		1,852,%RED-RUD
		-7,743,%ANI-KDN
		12,183,%KDN-ZAG
		-5,175,%ANI-SIK
		-1,21,%KAW-BLE
		-2,985,%KAW-SIK
		-13,853,%KAW-KLP
		-16,492,%KLP-KLO
		23,495,%KLO-PAN
		-18,852,%PAN-PRA
		-1,116,%PRA-OLE
		1,117,%OLE-SOW
		1,277%SOW-DBR
		18,118,%ZAG-KLO
		0,469%POH-KOT
		];
	
	currentI = [ % kA
  0.138,%WRZ-HER
  0.115,%HER-LBN
  0.019,%WRZ-BLE
  0.006,%WRZ-KAW
  0.035,%WRZ-PRJ
  0.001,%PRJ-MIJ
  0.004,%MIJ-POH
  0.027,%WRZ-GUA
  0.043,%WRZ-HCW
  0.01,%WRZ-JLK
  0.034,%JLK-KNC
  0.051,%KNC-SKC
  0.062,%SKC-ZWA
  0.053,%ZWA-KOT
  0.024,%WRZ-RUD
  0.02,%ANI-HCW
  0.017,%ANI-GUA
  0.04,%ANI-RED
  0.016,%RED-RUD
  0.056,%ANI-KDN
  0.075,%KDN-ZAG
  0.029,%ANI-SIK
  0.007,%KAW-BLE
  0.016,%KAW-SIK
  0.084,%KAW-KLP
  0.095,%KLP-KLO
  0.126,%KLO-PAN
  0.102,%PAN-PRA
  0.006,%PRA-OLE
  0.006,%OLE-SOW
  0.007,%SOW-DBR
  0.102,%ZAG-KLO
  0.033%POH-KOT
  ];
	
	cableTypes = {
	'AFL6 120', 'AFL6 120', %tWRZ_2_HER
	'AFL6 120', 'AFL6 120', %tHER_2_LBN
	'AFL6 240', 'AFL6 240',%'tWRZ_2_BLE', 
	'AFL6 240', 'AFL6 240',%'tWRZ_2_KAW', 
	'AFL6 120', 'AFL6 120',	%'tWRZ_2_PRJ', 
	'AFL6 120', 'AFL6 120',	%'tPRJ_2_MIJ', 
	'AFL6 120', 'AFL6 120',	%'tMIJ_2_POH', 
	'AFL6 120', 'AFL6 120',	%'tWRZ_2_GUA', 
	'AFL6 240', 'AFL6 240',	% 'tWRZ_2_HCW',
	'AFL6 185', 'AFL6 185',	%'tWRZ_2_JLK', 
	'AFL6 185', 'AFL6 185',	%'tJLK_2_KNC', 
	'AFL6 185', 'AFL6 185',	%'tKNC_2_SKC', 
	'AFL6 240', 'AFL6 240',	%'tSKC_2_ZWA', 
	'AFL6 240', 'AFL6 240',	%'tZWA_2_KOT', 
	'AFL6 240', 'AFL6 240',	%'tWRZ_2_RUD', 
	'AFL6 240', 'AFL6 240',	%'tANI_2_HCW', 
	'AFL6 185', 'AFL6 185',	%'tANI_2_GUA', 
	'AFL6 240', 'AFL6 240',	%'tANI_2_RED', 
	'AFL6 240', 'AFL6 240',	%'tRED_2_RUD', 
	'AFL6 240', 'AFL6 240',	%'tANI_2_KDN', 
	'AFL6 240', 'AFL6 240',	%'tKDN_2_ZAG', 
	'AFL6 240', 'AFL6 240',	%'tANI_2_SIK',
	'AFL6 240', 'AFL6 240',	%'tKAW_2_BLE'
	'AFL6 240', 'AFL6 240',	%'tKAW_2_SIK'
	'AFL6 240', 'AFL6 240',%'tKAW_2_KLP'
	'AFL6 185', 'AFL6 185',	%'tKLP_2_KLO'
	'AFL6 240', 'AFL6 240',	%'tKLO_2_PAN'
	'AFL6 240', 'AFL6 240',	%'tPAN_2_PRA'
	'AFL6 240', 'AFL6 240',	%'tPRA_2_OLE'
	'AFL6 240', 'AFL6 240', %'tOLE_2_SOW'
	'AFL6 240',	'AFL6 240'%'tSOW_2_DBR'		
    'AFL6 185', 'AFL6 185'%'tZAG_2_KLO'
    'AFL6 240', 'AFL6 240'%'tPOH_2_KOT'
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
electricCurrent = 1; %AMPERS
cableTypeNames = {'AFL6 120','AFL6 185','AFL6 240'};
aluminiumTemperatureResistanceCoefficient = 4,4 /1000; % K ^ -1 
aluminiumSpecificHeat = 900; % J/(kg·K)
cableResistanceIn20Cels = [0.2214, 0.1482, 0.1172] * 10^-3; % ohm/m
cableMassPerKm = [518, 769, 952] * 10^-3;
baseTemperature = 20; % celsius
% in 10^(-6)/C
cableCoilExpansionFactor  = 11.5 * 10^-6;
thermalExpansionFactors = [19.23, 19.18, 19.5] * 10^-6 % 10^-6 / C;


CableName2CableLength = containers.Map(cableNames,cableLengths);
CableName2CableType = containers.Map(cableNames, cableTypes);
CableType2ThermalExpansionFactors = containers.Map(cableTypeNames, thermalExpansionFactors);
CableType2CableResistanceIn20Cels = containers.Map(cableTypeNames, cableResistanceIn20Cels);
CableType2CableMassPerKm = containers.Map(cableTypeNames, cableMassPerKm);
CableName2PowerUsage = containers.Map(cableNames, powerUsages);
