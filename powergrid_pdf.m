% Simulation of Powergrid

function [png] = powergrid_pdf()

png.PN_name = 'Powergrid Simulation';
png.set_of_Ps = {...
    'JNW','ZAG','KDN','ANI','GUA','WRZ','BLE','SIK','KAW','KLP',...
    'KLO','PAN','PRA','OLE','SOW','DBR','LBN','HER','ZWA','KOT',...
    'KNC','JLK','POH','MIJ','PRJ','RUD','RED','HCW',...
    'KOL1_W1', 'KOL1_W1','KOL1_W2', 'KOL1_W3', 'KOL1_W4',...
    'KOL1_Z1', 'KOL1_Z1', 'KOL1_Z3', 'KOL1_Z4', 'KOL2_Z1', 'KOL2_Z2',...
    'KOL2_Z2', 'KOL2_Z3', 'KOL2_Z4', 'KOL2_Z5', 'KOL2_Z6', 'KOL2_W1',...
    'KOL2_W2', 'KOL2_W3', 'KOL2_W4', 'KOL2_W5', 'KOL2_W6', 'KOL3_W1',...
    'KOL3_W2', 'KOL3_W3', 'KOL3_Z1', 'KOL3_Z2', 'KOL3_Z3', ...
};

png.set_of_Ts = {...
    'tGEN_3','tGEN_4','tGEN_AT1',... % GENERATORS!
    ... % Circle 1
    'tANI_2_KOL1Z1','tKOL1Z1_2_ANI',...
    'tKOL1Z1_2_KOL1Z2','tKOL1Z2_2_KOL1Z1',...
    'tKOL1Z2_2_KOL1Z3','tKOL1Z3_2_KOL1Z2',...
    'tKOL1Z3_2_KOL1Z4','tKOL1Z4_2_KOL1Z3',...
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
    'tKOL2Z2_2_RUD', 'tRUD_2_KOL2Z2',...
    'tKOL2Z3_2_JLK', 'tJLK_2_KOL2Z3',...
    'tWRZ_2_BLE','tBLE_2_WRZ',...
    'tKOL2Z5_2_KOL3W2','tKOL3W2_2_KOL2Z5',... %connect cir2 to cir3
    'tKOL2Z6_2_GUA','tGUA_2_KOL2Z6',...
    'tKOL2W2_2_PRJ', 'tPRJ_2_KOL2W2',...
    'tKOL2W6_2_HER', 'tHER_2_KOL2W6',...
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
%    'GEN_3',?,1,    ... % Generator 3 empty transition
%    'GEN_4',?,1,    ... % Generator 4 empty transition
    'JNW', 'tJNW_2_KLO', 1,'tJNW_2_KLO', 'KLO', 1,...
    'KLO', 'tKLO_2_JNW', 1,'tKLO_2,JNW', 'JNW', 1,...
    'PRA', 'tPRA_2_PAN', 1,'tPRA_2_PAN', 'PAN', 1,...
    'PAN', 'tPAN_2_PRA', 1,'tPAN_2_PRA', 'PRA', 1,...
    'PRA', 'tPRA_2_OLE', 1, 'tPRA_2_OLE', 'OLE',1,...
    'OLE', 'tOLE_2_PRA', 1, 'tOLE_2_PRA', 'PRA', 1,...
    'OLE', 'tOLE_2_SOW', 1, 'tOLE_2_SOW', 'SOW', 1,...
    'SOW', 'tSOW_2_OLE', 1, 'tSOW_2_OLE', 'OLE', 1,...
    'SOW', 'tSOW_2_DBR', 1, 'tSOW_2_DBR', 'DBR',1,...
    'DBR', 'tDBR_2_SOW', 1, 'tDBR_2_SOW', 'SOW',1,...
    'DBR', 'tDBR_2_LBN', 1, 'tDBR_2_LBN', 'LBN',1,...
    'LBN', 'tLBN_2_DBR', 1' 'tLBN_2_DBR', 'DBR',1,...
    'LBN', 'tLBN_2_HER', 1, 'tLBN_2_HER', 'HER',1,...
    'HER', 'tHER_2_LBN', 1, 'tHER_2_LBN', 'LBN',1,...
    'HER', 'tHER_2_KOL2W6', 1, 'tHER_2_KOL2W6', 'KOL2W6',1,...
    'KOL2W6', 'TKOL2W6_2_HER',1, 'TKOL2W6_2_HER', 'KOL2W6',1,...
    'PAN', 'tPAN_2_KLO', 1,'tPAN_2_KLO', 'KLO', 1,...
    'KLO', 'tKLO_2_PAN', 1,'tKLO_2_PAN', 'KLO', 1,...
    'KLO', 'tKLO_2_KLP', 1,'tKLO_2_KLP', 'KLP', 1,...
    'KLP', 'tKLP_2_KLO', 1,'tKLP_2_KLO', 'KLO',1,...
    'KLO', 'tKLO_2_ZAG', 1,'tKLO_2_ZAG', 'ZAG',1,...
    'ZAG', 'tZAG_2_KLO', 1,'tZAG_2_KLO', 'KLO',1,...
    'ZAG', 'tZAG_2_KDN', 1, 'tZAG_2_KDN', 'KDN',1,...
    'KDN', 'tKDN_2_ZAG', 1, 'tKDN_2_ZAG', 'ZAG', 1,...
    'KDN', 'tKDN_2_KOLZ4', 1, 'tKDN_2_KOLZ4', 'KOL2Z4', 1,...
    'KOL2Z4', 'tKOLZ4_2_KDN',1, 'tKOLZ4_2_KDN', 'KDN', 1,...
    'KLP', 'tKLP_2_KAW', 1, 'tKLP_2_KAW','KAW',1,...
    'KAW', 'tKAW_2_KLP', 1, 'tKAW_2_KLP', 'KLP',1,...
	'KAW', 'tKAW_2_KOL3Z2', 1, 'tKAW_2_KOL3Z2', 'KOL3Z2', 1,...
	'KOL3Z2', 'tKOL3Z2_2_KAW', 1, 'tKOL3Z2_2_KAW', 'KAW', 1,...
	'KAW', 'tKAW_2_KOL3Z1', 1, 'tKAW_2_KOL3Z1', 'KOL3Z1', 1,...
	'KOL3Z1', 'tKOL3Z1_2_KAW', 1, 'tKOL3Z1_2_KAW', 'KAW', 1,...
	'KOL3Z2', 'tKOL3Z2_2_KOL3Z1', 1, 'tKOL3Z2_2_KOL3Z1', 'KOL3Z1', 1,...
	'KOL3Z1', 'tKOL3Z1_2_KOL3Z2', 1, 'tKOL3Z1_2_KOL3Z2', 'KOL3Z2', 1,...
	
	
	
    
    
    
