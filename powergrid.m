% Simulation file
clear all; clc;

%hacked

global global_info;
global_info.counter = 0; 
%global_info.STOP_AT = 2; 
global_info.MAX_LOOP = 5;
global_info.EXTERNAL_TEMPERATURE = 30; % in Celsius
global_info.BASE_TEMPERATURE = 20;
pns = pnstruct('powergrid_pdf');

% priorities table - they determine which part of net will power go on 

%ANI-PRA
priorityANIPRA = {'tANI_2_KDN', 1, 'tKDN_2_ZAG', 1, 'tZAG_2_KLO', 1, 'tKLO_2_PAN', 1, 'tPAN_2_PRA'};
%dyn.ip = {'tANI_2_KDN', 1, 'tKDN_2_ZAG', 1}
dyn.ip = priorityANIPRA;

%%%% initial dynamics %%%%
dyn.m0 = {'GENANI', 100}; 
%dyn.ft = {'allothers',1};
pni = initialdynamics(pns, dyn);

sim = gpensim(pni);
prnfinalcolors(sim); 