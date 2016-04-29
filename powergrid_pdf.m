% Simulation of Powergrid

function [png] = powergrid_pdf()

png.PN_name = 'Powergrid Simulation';
png.set_of_Ps = {'JNW','RBL','ZAG','KDN','ANI','GUA','WRZ','BLE','SIK','KAW','KLP',...
                 'KLO','PAN','PRA','OLE','SOW','DBR','LBN','HER','KSC','BKW','KLT',...
                 'ZWA','SEC','KOT','KNC','JLK','POH','MYL','MIJ','PRJ','RUD','RED',...
                 'CYK','HCW'};

png.set_of_Ts = {...
    'tGEN_3','tGEN_4','tGEN_AT1',...
    'tKDN_2_ZAG','tZAG_2_KLO','tKLO_2_PAN','tPAN_2_PRA','tPRA_2_OLE','tOLE_2_SOW','tSOW_2_DBR',...
    
};

png.set_of_As = {...
%    'GEN_3',?,1,    ... % Generator 3 empty transition
%    'GEN_4',?,1,    ... % Generator 4 empty transition
    


    'pStart','tColor',1, 'tColor','pCombined',1,   ... % tColor
    'pCombined','tA',1, 'tA','pA',1 ...                % tA
    'pCombined','tA_or_B',1, 'tA_or_B','pA_or_B',1 ... % tA_or_B
    'pCombined','tA_or_B_Preferred',1, ...             % tA_or_B_Preferred
         'tA_or_B_Preferred','pA_or_B_Preferred',1 ... % tA_or_B_Preferred
    'pCombined','tA_and_B',1, 'tA_and_B','pA_and_B',1 ... % tA_and_B    
                };
