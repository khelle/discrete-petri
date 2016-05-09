% Simulation of Powergrid

function [png] = powergrid_pdf()

png.PN_name = 'Powergrid Simulation';
png.set_of_Ps = {...
    'ANI','KDN','ZAG','KLO','PAN','PRA','OLE','SOW','DBR','LBN',...
	'HER','WRZ','SIK','KAW','KLP','BLE','GUA','HCW','RUD','RED',...
	...
	'PRJ','MIJ','POH','KOT','ZWA','SKC','KNC','JLK',...
    ...
    'KOL1W1','KOL1W1','KOL1W2','KOL1W3','KOL1W4',...
    'KOL1Z1','KOL1Z1','KOL1Z3','KOL1Z4',...
	'KOL2W1','KOL2W2','KOL2W3','KOL2W4','KOL2W5','KOL2W6',...
	'KOL2Z1','KOL2Z2','KOL2Z2','KOL2Z3','KOL2Z4','KOL2Z5','KOL2Z6',...
	'KOL3W1','KOL3W2','KOL3W3',...
	'KOL3Z1','KOL3Z2',...
};

png.set_of_Ts = {...
    'tGEN_3','tGEN_4','tGEN_AT1',... % GENERATORS!
    ... % Circle 1
    'tANI_2_KOL1Z1','tKOL1Z1_2_ANI',...
    'tKOL1Z1_2_KOL1Z2','tKOL1Z2_2_KOL1Z1',...
    'tKOL1Z2_2_KOL1Z3','tKOL1Z3_2_KOL1Z2',...
    'tKOL1Z3_2_KOL1Z4','tKOL1Z4_2_KOL1Z3',...
    'tKOL1Z4_2_ANI', 'tANI_2_KOL1Z4', ...
	...
    'tKOL1W1_2_KOL1W2','tKOL1W2_2_KOL1W1',...
    'tKOL1W2_2_KOL1W3','tKOL1W3_2_KOL1W2',...
    'tKOL1W3_2_KOL1W4','tKOL1W4_2_KOL1W3',...
    'tKOL1W4_2_KOL1W1','tKOL1W1_2_KOL1W4',...
    ...     %1connectors
    'tANI_2_KOL1W1','tKOL1W1_2_ANI',... %connect z to w
    'tKOL1Z2_2_HCW','tHCW_2_KOL1Z2',...
    'tKOL1Z3_2_SIK','tSIK_2_KOL1Z3',...
    'tKOL1Z4_2_KDN','tKDN_2_KOL1Z4',...
    'tKOL1W3_2_RED','tRED_2_KOL1W3',...
    'tKOL1W4_2_GUA','tGUA_2_KOL1W4',...
    ... % Circle 2
    'tKOL2Z1_2_KOL2Z2','tKOL2Z2_2_KOL2Z1',...
    'tKOL2Z2_2_KOL2Z3','tKOL2Z3_2_KOL2Z2',...
    'tKOL2Z3_2_KOL2Z4','tKOL2Z4_2_KOL2Z3',...
    'tKOL2Z4_2_WRZ','tWRZ_2_KOL2Z4',...
    'tWRZ_2_KOL2Z5','tKOL2Z5_2_WRZ',...
    'tKOL2Z5_2_KOL2Z6','tKOL2Z6_2_KOL2Z5',...
    'tKOL2Z6_2_KOL2Z1','tKOL2Z1_2_KOL2Z6',...
    ...
    'tKOL2W1_2_KOL2W2','tKOL2W2_2_KOL2W1',...
    'tKOL2W2_2_KOL2W3','tKOL2W3_2_KOL2W2',...
    'tKOL2W3_2_KOL2W4','tKOL2W4_2_KOL2W3',...
    'tKOL2W4_2_KOL2W5','tKOL2W5_2_KOL2W4',...
    'tKOL2W5_2_KOL2W6','tKOL2W6_2_KOL2W5',...
    'tKOL2W6_2_KOL2W1','tKOL2W1_2_KOL2W6',...
    ...     %2connectors
    'tKOL2Z1_2_HCW','tHCW_2_KOL2Z1',...
    'tKOL2Z2_2_RUD','tRUD_2_KOL2Z2',...
    'tKOL2Z3_2_JLK','tJLK_2_KOL2Z3',...
    'tWRZ_2_BLE','tBLE_2_WRZ',...
    'tKOL2Z5_2_KOL3W2','tKOL3W2_2_KOL2Z5',... %connect cir2 to cir3
    'tKOL2Z6_2_GUA','tGUA_2_KOL2Z6',...
    'tKOL2W2_2_PRJ','tPRJ_2_KOL2W2',...
    'tKOL2W6_2_HER','tHER_2_KOL2W6',...
    ... % Circle 3
    'tKOL3Z1_2_KOL3Z2','tKOL3Z2_2_KOL3Z1',...
    'tKOL3Z2_2_KAW','tKAW_2_KOL3Z2',...
    'tKOL3Z1_2_KAW','tKAW_2_KOL3Z1',...
    ...
    'tKOL3W1_2_KOL3W2','tKOL3W2_2_KOL3W1',...
    'tKOL3W2_2_KOL3W3','tKOL3W3_2_KOL3W2',...
    'tKOL3W3_2_KOL3W1','tKOL3W1_2_KOL3W3',...
    ...     %2connectors
    'tKOL3Z2_2_KOL3W3','tKOL3W3_2_KOL3Z2',... %connect z to w
    'tKOL3Z1_2_BLE','tBLE_2_KOL3Z1',...
    'tKAW_2_KLP','tKLP_2_KAW',...
    'tKOL3W1_2_SIK','tSIK_2_KOL3W1',...
    ... % OTHERS:
    ... %left:
    'tKDN_2_ZAG','tZAG_2_KDN',...
    'tZAG_2_KLO','tKLO_2_ZAG',...
    'tKLO_2_KLP','tKLP_2_KLO',...
    'tKLO_2_PAN','tPAN_2_KLO',...
    'tPAN_2_PRA','tPRA_2_PAN',...
    'tPRA_2_OLE','tOLE_2_PRA',...
    'tOLE_2_SOW','tSOW_2_OLE',...
    'tSOW_2_DBR','tDBR_2_SOW',...
    'tDBR_2_LBN','tLBN_2_HER',...
    ...
	'tRED_2_RUD','tRUD_2_RED',...
    ... %right:
    'tPRJ_2_MIJ','tMIJ_2_PRJ',...
    'tMIJ_2_POH','tPOH_2_MIJ',...
	'tPOH_2_KOT','tKOT_2_POH',...
    'tKOT_2_ZWA','tZWA_2_KOT',...
    'tZWA_2_SKC','tSKC_2_ZWA',...
	'tSKC_2_KNC','tKNC_2_SKC',...
    'tKNC_2_JLK','tJLK_2_KNC',...
    };


png.set_of_As = {...
    'tGEN_3','KOL2Z4',1,... % Generator 3 empty transition
    'tGEN_4','KOL2W3',1,... % Generator 4 empty transition
    'tGEN_AT1','KOL1W2',1,...
    ... %right:
	'ZWA','tZWA_2_SKC',1, 'tZWA_2_SKC','SKC',1, ...
	'SKC','tSKC_2_ZWA',1, 'tSKC_2_ZWA','ZWA',1, ...
	'KOT','tKOT_2_ZWA',1, 'tKOT_2_ZWA','ZWA',1, ...
	'ZWA','tZWA_2_KOT',1, 'tZWA_2_KOT','KOT',1, ...
    'POH','tPOH_2_KOT',1, 'tPOH_2_KOT','KOT',1, ...
	'KOT','tKOT_2_POH',1, 'tPOH_2_KOT','KOT',1, ...
	'MIJ','tMIJ_2_POH',1, 'tMIJ_2_POH','POH',1, ...
	'POH','tPOH_2_MIJ',1, 'tPOH_2_MIJ','MIJ',1, ...
	'PRJ','tPRJ_2_MIJ',1, 'tPRJ_2_MIJ','MIJ',1, ...
	'MIJ','tMIJ_2_PRJ',1, 'tMIJ_2_PRJ','PRJ',1, ...
	'SKC','tSKC_2_KNC',1, 'tSKC_2_KNC','KNC',1, ...
    'KNC','tKNC_2_SKC',1, 'tKNC_2_SKC','SKC',1, ...
	'KNC','tKNC_2_JLK',1, 'tKNC_2_JLK','JLK',1, ...
	'JLK','tJLK_2_KNC',1, 'tJLK_2_KNC','KNC',1, ...
	...
	'RED','tRED_2_RUD',1, 'tRED_2_RUD','RUD',1, ...
	'RUD','tRUD_2_RED',1, 'tRUD_2_RED','RED',1, ...
	...
	... left:
	... %PAN
	'PAN','tPAN_2_KLO',1, 'tPAN_2_KLO','KLO',1, ...
    'KLO','tKLO_2_PAN',1, 'tKLO_2_PAN','KLO',1, ...
    ... %PRA
	'PRA','tPRA_2_PAN',1, 'tPRA_2_PAN','PAN',1, ...
    'PAN','tPAN_2_PRA',1, 'tPAN_2_PRA','PRA',1, ...
    'PRA','tPRA_2_OLE',1, 'tPRA_2_OLE','OLE',1, ...
    'OLE','tOLE_2_PRA',1, 'tOLE_2_PRA','PRA',1, ...
    ... %OLE
	'OLE','tOLE_2_SOW',1, 'tOLE_2_SOW','SOW',1, ...
    'SOW','tSOW_2_OLE',1, 'tSOW_2_OLE','OLE',1, ...
    ... %SOW
	'SOW','tSOW_2_DBR',1, 'tSOW_2_DBR','DBR',1, ...
    'DBR','tDBR_2_SOW',1, 'tDBR_2_SOW','SOW',1, ...
    ... %DBR
	'DBR','tDBR_2_LBN',1, 'tDBR_2_LBN','LBN',1, ...
    'LBN','tLBN_2_DBR',1' 'tLBN_2_DBR','DBR',1, ...
	... %LBN
	'LBN','tLBN_2_HER',1, 'tLBN_2_HER','HER',1, ...
    'HER','tHER_2_LBN',1, 'tHER_2_LBN','LBN',1, ...
    ... %HER
	'HER','tHER_2_KOL2W6',1, 'tHER_2_KOL2W6','KOL2W6',1, ...
    'KOL2W6','TKOL2W6_2_HER',1, 'TKOL2W6_2_HER','KOL2W6',1, ...
	... %KLO
	'KLO','tKLO_2_KLP',1, 'tKLO_2_KLP','KLP',1, ...
    'KLP','tKLP_2_KLO',1, 'tKLP_2_KLO','KLO',1, ...
    'KLO','tKLO_2_ZAG',1, 'tKLO_2_ZAG','ZAG',1, ...
    'ZAG','tZAG_2_KLO',1, 'tZAG_2_KLO','KLO',1, ...
    ... %ZAG
	'ZAG','tZAG_2_KDN',1, 'tZAG_2_KDN','KDN',1, ...
    'KDN','tKDN_2_ZAG',1, 'tKDN_2_ZAG','ZAG',1, ...
	... %KDN
	'KDN','tKDN_2_KOL1Z4',1, 'tKDN_2_KOL1Z4','KOL1Z4',1, ...
    'KOL1Z4','tKOL1Z4_2_KDN',1, 'tKOL1Z4_2_KDN','KDN',1, ...
	... %KLP
	'KLP','tKLP_2_KAW',1, 'tKLP_2_KAW','KAW',1, ...
    'KAW','tKAW_2_KLP',1, 'tKAW_2_KLP','KLP',1, ...
	... %KAW
	'KAW','tKAW_2_KOL3Z2',1, 'tKAW_2_KOL3Z2','KOL3Z2',1, ...
	'KOL3Z2','tKOL3Z2_2_KAW',1, 'tKOL3Z2_2_KAW','KAW',1, ...
	'KAW','tKAW_2_KOL3Z1',1, 'tKAW_2_KOL3Z1','KOL3Z1',1, ...
	'KOL3Z1','tKOL3Z1_2_KAW',1, 'tKOL3Z1_2_KAW','KAW',1, ...
	... %KOL3Z1
	'KOL3Z1','tKOL3Z1_2_BLE',1, 'tKOL3Z1_2_BLE','BLE',1, ...
	'BLE','tBLE_2_KOL3Z1',1, 't_BLE_2_KOL3Z1','KOL3Z1',1, ...
	... %KOL3Z2
	'KOL3Z2','tKOL3Z2_2_KOL3Z1',1, 'tKOL3Z2_2_KOL3Z1','KOL3Z1',1, ...
	'KOL3Z1','tKOL3Z1_2_KOL3Z2',1, 'tKOL3Z1_2_KOL3Z2','KOL3Z2',1, ...
	... %KOL3W1
	'KOL3W1','tKOL3W1_2_SIK',1, 'tKOL3W1_2_SIK','SIK',1, ...
	'SIK','tSIK_2_KOL3W1',1, 'tSIK_2_KOL3W1','KOL3W1',1, ...
	'KOL3W1','tKOL3W1_2_KOL3W2',1, 'tKOL3W1_2_KOL3W2','KOL3W2',1, ...
	'KOL3W2','tKOL3W2_2_KOL3W1',1, 'tKOL3W2_2_KOL3W1','KOL3W1',1, ...
	'KOL3W1','tKOL3W1_2_KOL3W3',1, 'tKOL3W1_2_KOL3W3','KOL3W3',1, ...
	'KOL3W3','tKOL3W3_2_KOL3W1',1, 'tKOL3W3_2_KOL3W1','KOL3W1',1, ...
	... %KOL3W2
	'KOL3W2','tKOL3W2_2_KOL2Z5',1, 'tKOL3W2_2_KOL2Z5','KOL2Z5',1, ... %cir2 to cir3
	'KOL2Z5','tKOL2Z5_2_KOL3W2',1, 'tKOL2Z5_2_KOL3W2','KOL3W2',1, ... %cir3 to cir2
	'KOL3W2','tKOL3W2_2_KOL3W3',1, 'tKOL3W2_2_KOL3W3','KOL3W3',1, ...
	'KOL3W3','tKOL3W3_2_KOL3W2',1, 'tKOL3W3_2_KOL3W2','KOL3W2',1, ...
	... %KOL3W3
	'KOL3W3','tKOL3W3_2_KOL3Z2',1, 'tKOL3W3_2_KOL3Z2','KOL3Z2',1, ...
	'KOL3Z2','tKOL3Z2_2_KOL3W3',1, 'tKOL3Z2_2_KOL3W3','KOL3W3',1, ...
	... %KOL2Z1
	'KOL2Z1','tKOL2Z1_2_HCW',1, 'tKOL2Z1_2_HCW','HCW',1, ...
	'HCW','tHCW_2_KOL2Z1',1, 'tHCW_2_KOL2Z1','KOL2Z1',1, ...
	'KOL2Z1','tKOL2Z1_2_KOL2Z2',1, 'tKOL2Z1_2_KOL2Z2','KOL2Z2',1, ...
	'KOL2Z2','tKOL2Z2_2_KOL2Z1',1, 'tKOL2Z2_2_KOL2Z1','KOL2Z1',1, ...
	'KOL2Z1','tKOL2Z1_2_KOL2Z6',1, 'tKOL2Z1_2_KOL2Z6','KOL2Z6',1, ...
	'KOL2Z6','tKOL2Z6_2_KOL2Z1',1, 'tKOL2Z6_2_KOL2Z1','KOL2Z1',1, ...
	... %KOL2Z2
	'KOL2Z2','tKOL2Z2_2_RUD',1, 'tKOL2Z2_2_RUD','RUD',1, ...
	'RUD','tRUD_2_KOL2Z2',1, 'tRUD_2_KOL2Z2','KOL2Z2',1, ...
	'KOL2Z2','tKOL2Z2_2_KOL2Z3',1, 'tKOL2Z2_2_KOL2Z3','KOL2Z3',1, ...
	'KOL2Z3','tKOL2Z3_2_KOL2Z2',1, 'tKOL2Z3_2_KOL2Z2','KOL2Z2',1, ...
	... %KOL2Z3
	'KOL2Z3','tKOL2Z3_2_JLK',1, 'tKOL2Z3_2_JLK','JLK',1, ...
	'JLK','tJLK_2_KOL2Z3',1, 'tJLK_2_KOL2Z3','KOL2Z3',1, ...
	'KOL2Z3','tKOL2Z3_2_KOL2Z4',1, 'tKOL2Z3_2_KOL2Z4','KOL2Z4',1, ...
	'KOL2Z4','tKOL2Z4_2_KOL2Z3',1, 'tKOL2Z4_2_KOL2Z3','KOL2Z3',1, ...
	... %KOL2Z4
	'KOL2Z4','tKOL2Z4_2_WRZ',1, 'tKOL2Z4_2_WRZ','WRZ',1, ...
	'WRZ','tWRZ_2_KOL2Z4',1, 'tWRZ_2_KOL2Z4','KOL2Z4',1, ...
	... %WRZ
	'WRZ','tWRZ_2_KOL2Z5',1, 'tWRZ_2_KOL2Z5','KOL2Z5',1, ...
	'KOL2Z5','tKOL2Z5_2_WRZ',1, 'tKOL2Z4_2_WRZ','WRZ',1, ...
	'WRZ','tWRZ_2_BLE',1, 'tWRZ_2_BLE','BLE',1, ...
	'BLE','tBLE_2_WRZ',1, 'tBLE_2_WRZ','WRZ',1, ...
	... %KOL2Z5
	'KOL2Z5','tKOL2Z5_2_KOL2Z6',1, 'tKOL2Z5_2_KOL2Z6','KOL2Z6',1, ...
	'KOL2Z6','tKOL2Z6_2_KOL2Z5',1, 'tKOL2Z6_2_KOL2Z5','KOL2Z5',1, ...
	... %KOL2Z6
	'KOL2Z6','tKOL2Z6_2_GUA',1, 'tKOL2Z6_2_GUA','GUA',1, ...
	'GUA','tGUA_2_KOL2Z6',1, 'tGUA_2_KOL2Z6','KOL2Z6',1, ... 
	... %KOL2W1
	'KOL2W1','tKOL2W1_2_KOL2W2',1, 'tKOL2W1_2_KOL2W2','KOL2W2',1, ...
	'KOL2W2','tKOL2W2_2_KOL2W1',1, 'tKOL2W2_2_KOL2W1','KOL2W1',1, ...
	'KOL2W1','tKOL2W1_2_KOL2W6',1, 'tKOL2W1_2_KOL2W6','KOL2W6',1, ...
	'KOL2W6','tKOL2W6_2_KOL2W1',1, 'tKOL2W6_2_KOL2W1','KOL2W1',1, ...
	... %KOL2W2
	'KOL2W2','tKOL2W2_2_KOL2W3',1, 'tKOL2W2_2_KOL2W3','KOL2W3',1, ...
	'KOL2W3','tKOL2W3_2_KOL2W2',1, 'tKOL2W3_2_KOL2W2','KOL2W2',1, ...
	'KOL2W2','tKOL2W2_2_PRJ',1, 'tKOL2W2_2_PRJ','PRJ',1, ...
	'PRJ','tPRJ_2_KOL2W2',1, 'tPRJ_2_KOL2W2','KOL1W2',1, ...
	... %KOL2W3
	'KOL2W3','tKOL2W3_2_KOL2W4',1, 'tKOL2W3_2_KOL2W4','KOL2W4',1, ...
	'KOL2W4','tKOL2W4_2_KOL2W3',1, 'tKOL2W4_2_KOL2W3','KOL2W3',1, ...
	... %KOL2W4
	'KOL2W4','tKOL2W4_2_KOL2W5',1, 'tKOL2W4_2_KOL2W5','KOL2W5',1, ...
	'KOL2W5','tKOL2W5_2_KOL2W4',1, 'tKOL2W5_2_KOL2W4','KOL2W4',1, ...
	... %KOL2W5
	'KOL2W5','tKOL2W5_2_KOL2W6',1, 'tKOL2W5_2_KOL2W6','KOL2W6',1, ...
	'KOL2W6','tKOL2W6_2_KOL2W5',1, 'tKOL2W6_2_KOL2W5','KOL2W5',1, ...
	... %KOL2W6 - all done earlier
	... %KOL1Z1
	'KOL1Z1','tKOL1Z1_2_ANI',1, 'tKOL1Z1_2_ANI','ANI',1, ...
	'ANI','tANI_2_KOL1Z1',1, 'tANI_2_KOL1Z1','KOL1Z1',1, ...
	'KOL1Z1','tKOL1Z1_2_KOL1Z2',1, 'tKOL1Z1_2_KOL1Z2',1, ...
	'KOL1Z2','tKOL1Z2_2_KOL1Z1',1, 'tKOL1Z2_2_KOL1Z1',1, ...
	... %KOL1Z2%
	'KOL1Z2','tKOL1Z2_2_HCW',1, 'tKOL1Z2_2_HCW','HCW',1, ...
	'HCW','tHCW_2_KOL1Z2',1, 'tHCW_2_KOL1Z2','KOL1Z2',1, ...
	'KOL1Z2','tKOL1Z2_2_KOL1Z3',1, 'tKOL1Z2_2_KOL1Z3','KOL1Z3',1, ...
	'KOL1Z3','tKOL1Z3_2_KOL1Z2',1, 'tKOL1Z3_2_KOL1Z2','KOL1Z2',1, ...
	... %KOL1Z3
	'KOL1Z3','tKOL1Z3_2_SIK',1, 'tKOL1Z3_2_SIK','SIK',1, ...
	'SIK','tSIK_2_KOL1Z3',1, 'tSIK_2_KOL1Z3','KOL1Z3',1, ...
	'KOL1Z3','tKOL1Z3_2_KOL1Z4',1, 'tKOL1Z3_2_KOL1Z4','KOL1Z4',1, ...
	'KOL1Z4','tKOL1Z4_2_KOL1Z3',1, 'tKOL1Z4_2_KOL1Z3','KOL1Z3',1, ...
	... %KOL1Z4
	'KOL1Z4','tKOL1Z4_2_ANI',1, 'tKOL1Z4_2_ANI','ANI',1, ...
	'ANI','tANI_2_KOL1Z4',1, 'tANI_2_KOL1Z4','KOL1Z4',1, ...
	... %KOL1W1
	'KOL1W1','tKOL1W1_2_ANI',1, 'tKOL1W1_2_ANI','ANI',1, ...
	'ANI','tANI_2_KOL1W1',1, 'tANI_2_KOL1W1','KOL1W1',1, ...
	'KOL1W1','tKOL1W1_2_KOL1W2',1, 'tKOL1W1_2_KOL1W2','KOL1W2',1, ...
	'KOL1W2','tKOL1W2_2_KOL1W1',1, 'tKOL1W2_2_KOL1W1','KOL1W1',1, ...
	'KOL1W1','tKOL1W1_2_KOL1W4', 1, 'tKOL1W1_2_KOL1W4','KOL1W4',1, ...
	'KOL1W4','tKOL1W4_2_KOL1W1', 1, 'tKOL1W4_2_KOL1W1','KOL1W1',1, ...
	... % KOL1W2
	'KOL1W2','tKOL1W2_2_KOL1W3',1, 'tKOL1W2_2_KOL1W3','KOL1W3',1, ...
	'KOL1W3','tKOL1W3_2_KOL1W2',1, 'tKOL1W3_2_KOL1W2','KOL1W2',1, ...
	... %KOL1W3
	'KOL1W3','tKOL1W3_2_KOL1W4',1, 'tKOL1W3_2_KOL1W4','KOL1W4',1, ...
	'KOL1W4','tKOL1W4_2_KOL1W3',1, 'tKOL1W4_2_KOL1W3','KOL1W3',1, ...
	'KOL1W3','tKOL1W3_2_RED',1, 'tKOL1W3_2_RED','RED',1, ...
	'RED','tRED_2_KOL1W3',1, 'tRED_2_KOL1W3','KOL1W3',1, ...
	... %KOL1W4
	'KOL1W4','tKOL1W4_2_GUA',1, 'tKOL1W4_2_GUA','GUA',1, ...
	'GUA','tGUA_2_KOL1W4',1, 'tGUA_2_KOL1W4','KOL1W4',1, ...
};
