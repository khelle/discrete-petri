% Example-29-1: SUMMARY: token selection from a single input place

function [png] = powergrid_pdf()

png.PN_name = 'Ex-29-1: token selection from a single input place';
png.set_of_Ps = {'ZWA', 'SEC', 'KOT', 'KNC', 'JLK', 'POH' ...  
    'MYL', 'MIJ', 'PRJ', 'RUD', 'RED', 'CYK', 'ANI', 'HCW' 'GUA' ... 
        'WRZ'};
             
png.set_of_Ts = {'tColor', 'tA', 'tA_or_B', 'tA_or_B_Preferred','tA_and_B'};

png.set_of_As = {...
    'pStart','tColor',1, 'tColor','pCombined',1,   ... % tColor
    'pCombined','tA',1, 'tA','pA',1 ...                % tA
    'pCombined','tA_or_B',1, 'tA_or_B','pA_or_B',1 ... % tA_or_B
    'pCombined','tA_or_B_Preferred',1, ...             % tA_or_B_Preferred
         'tA_or_B_Preferred','pA_or_B_Preferred',1 ... % tA_or_B_Preferred
    'pCombined','tA_and_B',1, 'tA_and_B','pA_and_B',1 ... % tA_and_B    
                };
