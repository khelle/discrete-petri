% Simulation file
clear all; clc;

global global_info;
global_info.EXTERNAL_TEMPERATURE = 40; % in Celsius
global_info.BASE_TEMPERATURE = 20;
pns = pnstruct('powergrid_pdf');

% priorities table - they determine which part of net will power go on 


%ANI-PRA
priorityANIPRA = {'tGEN_AT1',1, 'tANI_2_KDN',1, 'tKDN_2_ZAG',1, 'tZAG_2_KLO',1, 'tKLO_2_PAN',1, 'tPAN_2_PRA',1};
priorityHCWRED = {'tGEN_AT1',1, 'tANI_2_HCW',1, 'tHCW_2_WRZ',1, 'tWRZ_2_RUD',1, 'tRUD_2_RED',1};
priorityGUASIK = {'tGEN_AT1',1, 'tANI_2_GUA',1, 'tGUA_2_WRZ',1, 'tWRZ_2_BLE',1, 'tBLE_2_KAW',1, 'tKAW_2_SIK',1};
priorityWRZOLE = {'tGEN_3',1, 'tWRZ_2_HER',1, 'tHER_2_LBN',1, 'tLBN_2_DBR',1, 'tDBR_2_SOW',1, 'tSOW_2_OLE',1};
priorityWRZJLK = {'tGEN_3',1, 'tWRZ_2_PRJ',1, 'tPRJ_2_MIJ',1 , 'tMIJ_2_POH',1, 'tPOH_2_KOT',1, 'tKOT_2_ZWA',1, 'tZWA_2_SKC',1, 'tSKC_2_KNC',1 ,'tKNC_2_JLK',1};

dyn.ip = priorityANIPRA;
%dyn.ip = priorityHCWRED;
global_info.MAX_LOOP = floor(length(priorityANIPRA)/2);


%%%% initial dynamics %%%%
dyn.m0 = {'GENANI', 1}; 

%dyn.ft = {'allothers',1};
pni = initialdynamics(pns, dyn);

sim = gpensim(pni);

prnfinalcolors(sim);    % how much power left in last station
%plotp(sim, {'GENANI', 'ANI', 'KDN', 'ZAG', 'KLO', 'PAN', 'PRA'});
