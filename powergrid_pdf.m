% Example-29-1: SUMMARY: token selection from a single input place

function [png] = powergrid_pdf()

png.PN_name = 'Powergrid Simulation';
png.set_of_Ps = {'JNW','RBL','ZAG','KDN','ANI','GUA','WRZ','BLE','SIK','KAW','KLP',...
                 'KLD','PAN','PRA','OLE','SDW','DBR','LBN','HER','KSC','BKW','KLT',...
                 'ZWA','SEC','KOT','KNC','JLK','POH','MYL','MIJ','PRJ','RUD','RED',...
                 'CYK','HCW'};

png.set_of_Ts = {'tColor', 'tA', 'tA_or_B', 'tA_or_B_Preferred','tA_and_B'};

png.set_of_As = {...
    'pStart','tColor',1, 'tColor','pCombined',1,   ... % tColor
    'pCombined','tA',1, 'tA','pA',1 ...                % tA
    'pCombined','tA_or_B',1, 'tA_or_B','pA_or_B',1 ... % tA_or_B
    'pCombined','tA_or_B_Preferred',1, ...             % tA_or_B_Preferred
         'tA_or_B_Preferred','pA_or_B_Preferred',1 ... % tA_or_B_Preferred
    'pCombined','tA_and_B',1, 'tA_and_B','pA_and_B',1 ... % tA_and_B    
                };
