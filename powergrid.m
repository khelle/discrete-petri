% Simulation file
clear all; clc;

global global_info;

externalTemperatures = [-20 0 20 40];
global_info.EXTERNAL_TEMPERATURE = 40; % in Celsius
global_info.BASE_TEMPERATURE = 20;
global_info.SIM_NAME  = 'newsim';

global_info.Name = [];
global_info.TransitionName = [];
global_info.CablePowerUsage = [];
global_info.CableDiff  = [];
global_info.TemperatureChange = [];
global_info.Sag = [];

pns = pnstruct('powergrid_pdf');

% priorities table - they determine which part of net will power go on 


%ANI-PRA
priorityANIPRA = {'tGEN_AT1',1, 'tANI_2_KDN',1, 'tKDN_2_ZAG',1, 'tZAG_2_KLO',1, 'tKLO_2_PAN',1, 'tPAN_2_PRA',1};
priorityHCWRED = {'tGEN_AT1',1, 'tANI_2_HCW',1, 'tHCW_2_WRZ',1, 'tWRZ_2_RUD',1, 'tRUD_2_RED',1};
priorityGUASIK = {'tGEN_AT1',1, 'tANI_2_GUA',1, 'tGUA_2_WRZ',1, 'tWRZ_2_BLE',1, 'tBLE_2_KAW',1, 'tKAW_2_SIK',1};
priorityWRZOLE = {'tGEN_3',1, 'tWRZ_2_HER',1, 'tHER_2_LBN',1, 'tLBN_2_DBR',1, 'tDBR_2_SOW',1, 'tSOW_2_OLE',1};
priorityWRZJLK = {'tGEN_3',1, 'tWRZ_2_PRJ',1, 'tPRJ_2_MIJ',1 , 'tMIJ_2_POH',1, 'tPOH_2_KOT',1, 'tKOT_2_ZWA',1, 'tZWA_2_SKC',1, 'tSKC_2_KNC',1 ,'tKNC_2_JLK',1};


priorities = {priorityANIPRA,priorityHCWRED, priorityGUASIK, priorityWRZOLE, priorityWRZJLK};
%dyn.ip = priorityANIPRA;
%dyn.ip = priorityHCWRED;
%global_info.MAX_LOOP = floor(length(priorityANIPRA)/2);


%%%% initial dynamics %%%%
%dyn.m0 = {'GENANI', 1}; 

%dyn.ft = {'allothers',1};
%pni = initialdynamics(pns, dyn);

%sim = gpensim(pni);

%prnfinalcolors(sim);    % how much power left in last station
%plotp(sim, {'GENANI', 'ANI', 'KDN', 'ZAG', 'KLO', 'PAN', 'PRA'});


%Przesymuluj wszystkie linie

%Przesymuluj przy wartoœciach zewnêtrznych temperatury -20 0 20 40
% Zapisz : wyd³u¿enie na przêœle, zwis, spadek mocy i wzrost temperatury
% kabla

for j = 1 :   length(priorities);
    for i = 1 : length(externalTemperatures);
        global_info.SIM_NAME = strcat(priorities{j}{1}, 'TOO', priorities{j}{numel(priorities{j})-1},'temp', num2str(externalTemperatures(i)))
        %global_info.SIM_NAME = strcat(num2str(i), num2str(j));
        global_info.EXTERNAL_TEMPERATURE = externalTemperatures(i);
        
        dyn.ip = priorities{j};
        global_info.MAX_LOOP = floor(length(priorities{j})/2);


        %%%% initial dynamics %%%%
        dyn.m0 = {'GENANI', 1}; 
        if j >= 4
             dyn.m0 = {'GENWRZ3', 1};  
        end;
            
        %dyn.ft = {'allothers',1};
        pni = initialdynamics(pns, dyn);

        sim = gpensim(pni);

        prnfinalcolors(sim);    % how much power left in last station
        %plotp(sim, {'GENANI', 'ANI', 'KDN', 'ZAG', 'KLO', 'PAN', 'PRA'});
         Name = {'Transition'; 'CablePowerUsage'; 'CableDiff'; 'TemperatureChange'};
        T = table(global_info.TransitionName,global_info.CableDiff,global_info.CablePowerUsage,global_info.TemperatureChange, global_info.Sag, 'VariableNames', {'Tran', 'Lengthdiff', 'Power', 'Temp', 'Sag'})
           
            writetable(T, global_info.SIM_NAME,'Delimiter','\t');
            global_info.SIM_NAME
            %type global_info.SIM_NAME;
            
            global_info.Name = [];
            global_info.TransitionName = [];
            global_info.CablePowerUsage = [];
            global_info.CableDiff  = [];
            global_info.TemperatureChange = [];
            global_info.Sag = [];
    
    end;
end;