% Simulation file
clear all; clc;
close all;

global global_info;

externalTemperatures = [20 30 40 50];
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


%AAA-AAF
priorityAAAAAF = {'tGEN_ZZZ',1, 'tAAA_2_AAB',1, 'tAAB_2_AAC',1, 'tAAC_2_AAD',1, 'tAAD_2_AAE',1, 'tAAE_2_AAF',1};
priorityAARAAT = {'tGEN_ZZZ',1, 'tAAA_2_AAR',1, 'tAAR_2_AAL',1, 'tAAL_2_AAS',1, 'tAAS_2_AAT',1};
priorityAAQAAM = {'tGEN_ZZZ',1, 'tAAA_2_AAQ',1, 'tAAQ_2_AAL',1, 'tAAL_2_AAP',1, 'tAAP_2_AAN',1, 'tAAN_2_AAM',1};
priorityAALAAG = {'tGEN_ZZY',1, 'tAAL_2_AAK',1, 'tAAK_2_AAJ',1, 'tAAJ_2_AAI',1, 'tAAI_2_AAH',1, 'tAAH_2_AAG',1};
priorityAALABB = {'tGEN_ZZY',1, 'tAAL_2_AAU',1, 'tAAU_2_AAV',1 , 'tAAV_2_AAW',1, 'tAAW_2_AAX',1, 'tAAX_2_AAY',1, 'tAAY_2_AAZ',1, 'tAAZ_2_ABA',1 ,'tABA_2_ABB',1};


priorities = {priorityAAAAAF,priorityAARAAT, priorityAAQAAM, priorityAALAAG, priorityAALABB};
%dyn.ip = priorityAAAAAF;
%dyn.ip = priorityAARAAT;
%global_info.MAX_LOOP = floor(length(priorityAAAAAF)/2);


%%%% initial dynamics %%%%
%dyn.m0 = {'GENZZZ', 1}; 

%dyn.ft = {'allothers',1};
%pni = initialdynamics(pns, dyn);

%sim = gpensim(pni);

%prnfinalcolors(sim);    % how much power left in last station
%plotp(sim, {'GENZZZ', 'AAA', 'AAB', 'AAC', 'AAD', 'AAE', 'AAF'});


%Przesymuluj wszystkie linie

%Przesymuluj przy wartoœciach zewnêtrznych temperatury -20 0 20 40
% Zapisz : wyd³u¿enie na przêœle, zwis, spadek mocy i wzrost temperatury
% kabla

barTemp = [];
barPower = [];
barExtend = [];
barSag = [];

for j = 1 :   length(priorities);
    for i = 1 : length(externalTemperatures);
        global_info.SIM_NAME = strcat(priorities{j}{1}, 'TOO', priorities{j}{numel(priorities{j})-1},'temp', num2str(externalTemperatures(i)))
        %global_info.SIM_NAME = strcat(num2str(i), num2str(j));
        global_info.EXTERNAL_TEMPERATURE = externalTemperatures(i);
        
        dyn.ip = priorities{j};
        global_info.MAX_LOOP = floor(length(priorities{j})/2);


        %%%% initial dynamics %%%%
        dyn.m0 = {'GENZZZ', 1}; 
        if j >= 4
             dyn.m0 = {'GENZZY', 1};  
        end;
            
        %dyn.ft = {'allothers',1};
        pni = initialdynamics(pns, dyn);

        sim = gpensim(pni);

        prnfinalcolors(sim);    % how much power left in last station
        %plotp(sim, {'GENZZZ', 'AAA', 'AAB', 'AAC', 'AAD', 'AAE', 'AAF'});
         Name = {'Transition'; 'CablePowerUsage'; 'CableDiff'; 'TemperatureChange'};
        T = table(global_info.TransitionName,global_info.CableDiff,global_info.CablePowerUsage,global_info.TemperatureChange, global_info.Sag, 'VariableNames', {'Tran', 'Lengthdiff', 'Power', 'Temp', 'Sag'})
        barExtend = [barExtend; global_info.CableDiff];
        barTemp = [barTemp; global_info.TemperatureChange];
        barPower = [barPower; global_info.CablePowerUsage];

        barSag = [barSag; global_info.Sag];
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
     placesNumber = numel(priorities{j})
      
        elementsLength = length(barPower);
        n = placesNumber/2 - 1;
        loopBreak = length(barPower)/4;
        
        barPower = barPower';
        barExtend = barExtend';
        barTemp = barTemp';
        barSag = barSag'
        
         newPower = [];
         newExtend = [];
         newTemp = [];
         newSag = [];
         for k = 1: loopBreak
             %barPower = [barPower(1:n:elementsLength);barPower(2:n:elementsLength); barPower(3:n:elementsLength); barPower(4:n:elementsLength)]
            
            
              newPower = [newPower ;  barPower(k:n:elementsLength)];
              newExtend = [newExtend ; barExtend(k:n:elementsLength)];
              newTemp = [newTemp ; barTemp(k:n:elementsLength)];
              newSag = [newSag ; barSag(k:n:elementsLength)];
        end;
        
       
        
        
        fig =figure(j*i+ 12);
        %title(strcat('Segment nr '), num2str(j));
        %hold on;
        
        subplot(2,2,1);
       
        
        
        
       
  
       
        
        
        
        bar(newPower);
         legend('20', '30', '40', '50');
       
        ylabel('Power Usage [MW]');
        xlabel('Number of place');
        %print(fig,strcat('sim', num2str(j*i +1),'-dpng');
        
        subplot(2,2,2);
         bar(newExtend);
          legend('20', '30', '40', '50');
       
        ylabel('CableExtension [m]');
        xlabel('Number of place');
        %print(fig,strcat('sim', num2str(j*i +2),'-dpng');
        subplot(2,2,3);
        %fig = figure(j*i+ 3);
         bar(newTemp);
         legend('20', '30', '40', '50');
       
        ylabel('TemperatureChange [C]');
        xlabel('Number of place');
        
        subplot(2,2,4);
        
        bar(newSag);
        ylabel('Sag [m]');
        xlabel('Number of place');
    
        legend('20', '30', '40', '50');
         print(fig,strcat('sim', num2str(j), num2str(i)),'-dpng');
       
        
   
    barTemp = [];
    barPower = [];
    barExtend = [];
    barSag = [];
end;