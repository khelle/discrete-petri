% Simulation file
clear all; clc;

global global_info;
global_info.counter = 0; 
global_info.STOP_AT = 150; 

pns = pnstruct('single_inputplace_pdf');

%%%% initial dynamics %%%%
dyn.m0 = {'pStart', 20}; 
dyn.ft = {'allothers',1};
pni = initialdynamics(pns, dyn);

sim = gpensim(pni);
prnfinalcolors(sim); 