% Simulation of Powergrid

function [png] = powergrid_pdf()


png.PN_name = 'Powergrid Simulation';
png.set_of_Ps = {...
    'ANI','KDN','ZAG','KLO','PAN','PRA','OLE','SOW','DBR','LBN',...
    'HER','WRZ','SIK','KAW','KLP','BLE','GUA','HCW','RUD','RED',...
    ...
    'PRJ','MIJ','POH','KOT','ZWA','SKC','KNC','JLK',...
    ...
    'GENANI','GENWRZ3','GENWRZ4'
};

png.set_of_Ts = {...
    
    'tGEN_3','tGEN_4','tGEN_AT1',... % GENERATORS!
    ... % Circle 1 - ANI
    'tANI_2_HCW','tHCW_2_ANI',...
    'tANI_2_SIK','tSIK_2_ANI',...
    'tANI_2_KDN','tKDN_2_ANI',...
    'tANI_2_RED','tRED_2_ANI',...
    'tANI_2_GUA','tGUA_2_ANI',...
    ... % Circle 2 - WRZ
    ...     %2connectors
    'tWRZ_2_HCW','tHCW_2_WRZ',...
    'tWRZ_2_RUD','tRUD_2_WRZ',...
    'tWRZ_2_JLK','tJLK_2_WRZ',...
    'tWRZ_2_BLE','tBLE_2_WRZ',...
    'tWRZ_2_GUA','tGUA_2_WRZ',...
    'tWRZ_2_PRJ','tPRJ_2_WRZ',...
    'tWRZ_2_HER','tHER_2_WRZ',...
    'tWRZ_2_KAW','tKAW_2_WRZ',...
    ... % Circle 3 - KAW
    'tKAW_2_BLE','tBLE_2_KAW',...
    'tKAW_2_KLP','tKLP_2_KAW',...
    'tKAW_2_SIK','tSIK_2_KAW',...
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
    'tDBR_2_LBN','tLBN_2_DBR',...
    'tLBN_2_HER','tHER_2_LBN',...
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
    'GENWRZ3','tGEN_3',1, 'tGEN_3','WRZ',1,... % Generator 3 empty transition
    'GENWRZ4','tGEN_4',1, 'tGEN_4','WRZ',1,... % Generator 4 empty transition
    'GENANI','tGEN_AT1',1, 'tGEN_AT1','ANI',1,...
    ... %right:
    ... %PRJ
    'PRJ','tPRJ_2_MIJ',1, 'tPRJ_2_MIJ','MIJ',1, ...
    'MIJ','tMIJ_2_PRJ',1, 'tMIJ_2_PRJ','PRJ',1, ...
    ... %MIJ
    'MIJ','tMIJ_2_POH',1, 'tMIJ_2_POH','POH',1, ...
    'POH','tPOH_2_MIJ',1, 'tPOH_2_MIJ','MIJ',1, ...
    ... %POH
    'POH','tPOH_2_KOT',1, 'tPOH_2_KOT','KOT',1, ...
    'KOT','tKOT_2_POH',1, 'tPOH_2_KOT','KOT',1, ...
    ... %KOT
    'KOT','tKOT_2_ZWA',1, 'tKOT_2_ZWA','ZWA',1, ...
    'ZWA','tZWA_2_KOT',1, 'tZWA_2_KOT','KOT',1, ...
    ... %ZWA
    'ZWA','tZWA_2_SKC',1, 'tZWA_2_SKC','SKC',1, ...
    'SKC','tSKC_2_ZWA',1, 'tSKC_2_ZWA','ZWA',1, ...
    ... %SKC
    'SKC','tSKC_2_KNC',1, 'tSKC_2_KNC','KNC',1, ...
    'KNC','tKNC_2_SKC',1, 'tKNC_2_SKC','SKC',1, ...
    ... %KNC
    'KNC','tKNC_2_JLK',1, 'tKNC_2_JLK','JLK',1, ...
    'JLK','tJLK_2_KNC',1, 'tJLK_2_KNC','KNC',1, ...
    ... %RED-RUD
    'RED','tRED_2_RUD',1, 'tRED_2_RUD','RUD',1, ...
    'RUD','tRUD_2_RED',1, 'tRUD_2_RED','RED',1, ...
    ...
    ... left:
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
    'HER','tHER_2_WRZ',1, 'tHER_2_WRZ','WRZ',1, ...
    'WRZ','tWRZ_2_HER',1, 'tWRZ_2_HER','WRZ',1, ...
    ... %PAN
    'PAN','tPAN_2_KLO',1, 'tPAN_2_KLO','KLO',1, ...
    'KLO','tKLO_2_PAN',1, 'tKLO_2_PAN','KLO',1, ...
    ... %KLO
    'KLO','tKLO_2_KLP',1, 'tKLO_2_KLP','KLP',1, ...
    'KLP','tKLP_2_KLO',1, 'tKLP_2_KLO','KLO',1, ...
    'KLO','tKLO_2_ZAG',1, 'tKLO_2_ZAG','ZAG',1, ...
    'ZAG','tZAG_2_KLO',1, 'tZAG_2_KLO','KLO',1, ...
    ... %KLP
    'KLP','tKLP_2_KAW',1, 'tKLP_2_KAW','KAW',1, ...
    'KAW','tKAW_2_KLP',1, 'tKAW_2_KLP','KLP',1, ...
    ... %ZAG
    'ZAG','tZAG_2_KDN',1, 'tZAG_2_KDN','KDN',1, ...
    'KDN','tKDN_2_ZAG',1, 'tKDN_2_ZAG','ZAG',1, ...
    ... %KDN
    'KDN','tKDN_2_ANI',1, 'tKDN_2_ANI','ANI',1, ...
    'ANI','tANI_2_KDN',1, 'tANI_2_KDN','KDN',1, ...
    ... %KAW
    'KAW','tKAW_2_BLE',1, 'tKAW_2_BLE','BLE',1, ...
    'BLE','tBLE_2_KAW',1, 'tBLE_2_KAW','KAW',1, ...
    'KAW','tKAW_2_SIK',1, 'tKAW_2_SIK','SIK',1, ...
    'SIK','tSIK_2_KAW',1, 'tSIK_2_KAW','KAW',1, ...
    'KAW','tKAW_2_WRZ',1, 'tKAW_2_WRZ','WRZ',1, ... %connected to WRZ
    'WRZ','tWRZ_2_KAW',1, 'tWRZ_2_KAW','KAW',1, ...
    ... %WRZ
    'WRZ','tWRZ_2_BLE',1, 'tWRZ_2_BLE','BLE',1, ...
    'BLE','tBLE_2_WRZ',1, 'tBLE_2_WRZ','WRZ',1, ...
    'WRZ','tWRZ_2_HCW',1, 'tWRZ_2_HCW','HCW',1, ...
    'HCW','tHCW_2_WRZ',1, 'tHCW_2_WRZ','WRZ',1, ...
    'WRZ','tWRZ_2_GUA',1, 'tWRZ_2_GUA','GUA',1, ...
    'GUA','tGUA_2_WRZ',1, 'tGUA_2_WRZ','WRZ',1, ... 
    'WRZ','tWRZ_2_RUD',1, 'tWRZ_2_RUD','RUD',1, ...
    'RUD','tRUD_2_WRZ',1, 'tRUD_2_WRZ','WRZ',1, ...
    'WRZ','tWRZ_2_JLK',1, 'tWRZ_2_JLK','JLK',1, ...
    'JLK','tJLK_2_WRZ',1, 'tJLK_2_WRZ','WRZ',1, ...
    'WRZ','tWRZ_2_PRJ',1, 'tWRZ_2_PRJ','PRJ',1, ...
    'PRJ','tPRJ_2_WRZ',1, 'tPRJ_2_WRZ','WRZ',1, ...
    ... %ANI
    'ANI','tANI_2_SIK',1, 'tANI_2_SIK','SIK',1, ...
    'SIK','tSIK_2_ANI',1, 'tSIK_2_ANI','ANI',1, ...
    'ANI','tANI_2_HCW',1, 'tANI_2_HCW','HCW',1, ...
    'HCW','tHCW_2_ANI',1, 'tHCW_2_ANI','ANI',1, ...
    'ANI','tANI_2_GUA',1, 'tANI_2_GUA','GUA',1, ...
    'GUA','tGUA_2_ANI',1, 'tGUA_2_ANI','ANI',1, ...
    'ANI','tANI_2_RED',1, 'tANI_2_RED','RED',1, ...
    'RED','tRED_2_ANI',1, 'tRED_2_ANI','ANI',1, ...
};
