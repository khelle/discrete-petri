% Simulation file
clear all; clc;

%hacked

global global_info;
global_info.counter = 0; 
global_info.STOP_AT = 2; 
global_info.EXTERNAL_TEMPERATURE = 30; % in Celsius
global_info.BASE_TEMPERATURE = 20;
pns = pnstruct('powergrid_pdf');

%%%% initial dynamics %%%%
dyn.m0 = {'GENANI', 100}; 
dyn.ft = {'allothers',1};
pni = initialdynamics(pns, dyn);

sim = gpensim(pni);
prnfinalcolors(sim); 