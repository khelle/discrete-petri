maaluminiumSpecificHeat = 900;
aluminiumTemperatureResistanceCoefficient = 4;
baseTemperature = 20;
cableCoilExpansionFactor = 1.15E-5;

cableLengths = ...
  [23026 23026;
   13859 13859;
   4185 4185;
   9328 9328;
   9552 9552;
   19708 19708;
   8360 8360;
   4420 4420;
   4907 4907;
   24497 24497;
   15154 15154;
   21074 21074;
   8375 8375;
   18599 18599;
   21361 21361;
   10552 10552;
   7696 7696;
   8364 8364;
   3073 3073;
   2877 2877;
   17617 17617;
   4181 4181;
   7733 7733;
   5047 5047;
   14913 14913;
   6938 6938;
   13140 13140;
   31193 31193;
   34585 34585;
   8023 8023;
   20056 20056;
   2952 2952;
   19576 19576;
   13773 13773];

cableMassPerKm = [518 769 952] * 10^-3;

cableNames = cell(33, 2);
cableNames{1,1} = 'tAAL_2_AAK';
cableNames{2,1} = 'tAAK_2_AAJ';
cableNames{3,1} = 'tAAL_2_AAP';
cableNames{4,1} = 'tAAL_2_AAN';
cableNames{5,1} = 'tAAL_2_AAU';
cableNames{6,1} = 'tAAU_2_AAV';
cableNames{7,1} = 'tAAV_2_AAW';
cableNames{8,1} = 'tAAL_2_AAQ';
cableNames{9,1} = 'tAAL_2_AAR';
cableNames{10,1} = 'tAAL_2_ABB';
cableNames{11,1} = 'tABB_2_ABA';
cableNames{12,1} = 'tABA_2_AAZ';
cableNames{13,1} = 'tAAZ_2_AAY';
cableNames{14,1} = 'tAAY_2_AAX';
cableNames{15,1} = 'tAAL_2_AAS';
cableNames{16,1} = 'tAAA_2_AAR';
cableNames{17,1} = 'tAAA_2_AAQ';
cableNames{18,1} = 'tAAA_2_AAT';
cableNames{19,1} = 'tAAT_2_AAS';
cableNames{20,1} = 'tAAA_2_AAB';
cableNames{21,1} = 'tAAB_2_AAC';
cableNames{22,1} = 'tAAA_2_AAM';
cableNames{23,1} = 'tAAN_2_AAP';
cableNames{24,1} = 'tAAN_2_AAM';
cableNames{25,1} = 'tAAN_2_AAO';
cableNames{26,1} = 'tAAO_2_AAD';
cableNames{27,1} = 'tAAD_2_AAE';
cableNames{28,1} = 'tAAE_2_AAF';
cableNames{29,1} = 'tAAF_2_AAG';
cableNames{30,1} = 'tAAG_2_AAH';
cableNames{31,1} = 'tAAH_2_AAI';
cableNames{32,1} = 'tAAC_2_AAD';
cableNames{33,1} = 'tAAW_2_AAX';
cableNames{34,1} = 'tAAI_2_AAJ';
cableNames{1,2} = 'tAAK_2_AAL';
cableNames{2,2} = 'tAAJ_2_AAK';
cableNames{3,2} = 'tAAP_2_AAL';
cableNames{4,2} = 'tAAN_2_AAL';
cableNames{5,2} = 'tAAU_2_AAL';
cableNames{6,2} = 'tAAV_2_AAU';
cableNames{7,2} = 'tAAW_2_AAV';
cableNames{8,2} = 'tAAQ_2_AAL';
cableNames{9,2} = 'tAAR_2_AAL';
cableNames{10,2} = 'tABB_2_AAL';
cableNames{11,2} = 'tABA_2_ABB';
cableNames{12,2} = 'tAAZ_2_ABA';
cableNames{13,2} = 'tAAY_2_AAZ';
cableNames{14,2} = 'tAAX_2_AAY';
cableNames{15,2} = 'tAAS_2_AAL';
cableNames{16,2} = 'tAAR_2_AAA';
cableNames{17,2} = 'tAAQ_2_AAA';
cableNames{18,2} = 'tAAT_2_AAA';
cableNames{19,2} = 'tAAS_2_AAT';
cableNames{20,2} = 'tAAB_2_AAA';
cableNames{21,2} = 'tAAC_2_AAB';
cableNames{22,2} = 'tAAM_2_AAA';
cableNames{23,2} = 'tAAP_2_AAN';
cableNames{24,2} = 'tAAM_2_AAN';
cableNames{25,2} = 'tAAO_2_AAN';
cableNames{26,2} = 'tAAD_2_AAO';
cableNames{27,2} = 'tAAE_2_AAD';
cableNames{28,2} = 'tAAF_2_AAE';
cableNames{29,2} = 'tAAG_2_AAF';
cableNames{30,2} = 'tAAH_2_AAG';
cableNames{31,2} = 'tAAI_2_AAH';
cableNames{32,2} = 'tAAD_2_AAC';
cableNames{33,2} = 'tAAX_2_AAW';
cableNames{34,2} = 'tAAJ_2_AAI';

cableResistanceIn20Cels = [0.2214 0.1482 0.1172] * 10^-3;

cableTypeNames = cell(1, 3);
cableTypeNames{1} = 'AFL6 120';
cableTypeNames{2} = 'AFL6 185';
cableTypeNames{3} = 'AFL6 240';

cableTypes = cell(33, 2);
cableTypes{1,1} = 'AFL6 120';
cableTypes{2,1} = 'AFL6 120';
cableTypes{3,1} = 'AFL6 240';
cableTypes{4,1} = 'AFL6 240';
cableTypes{5,1} = 'AFL6 120';
cableTypes{6,1} = 'AFL6 120';
cableTypes{7,1} = 'AFL6 120';
cableTypes{8,1} = 'AFL6 120';
cableTypes{9,1} = 'AFL6 240';
cableTypes{10,1} = 'AFL6 185';
cableTypes{11,1} = 'AFL6 185';
cableTypes{12,1} = 'AFL6 185';
cableTypes{13,1} = 'AFL6 240';
cableTypes{14,1} = 'AFL6 240';
cableTypes{15,1} = 'AFL6 240';
cableTypes{16,1} = 'AFL6 240';
cableTypes{17,1} = 'AFL6 185';
cableTypes{18,1} = 'AFL6 240';
cableTypes{19,1} = 'AFL6 240';
cableTypes{20,1} = 'AFL6 240';
cableTypes{21,1} = 'AFL6 240';
cableTypes{22,1} = 'AFL6 240';
cableTypes{23,1} = 'AFL6 240';
cableTypes{24,1} = 'AFL6 240';
cableTypes{25,1} = 'AFL6 240';
cableTypes{26,1} = 'AFL6 185';
cableTypes{27,1} = 'AFL6 240';
cableTypes{28,1} = 'AFL6 240';
cableTypes{29,1} = 'AFL6 240';
cableTypes{30,1} = 'AFL6 240';
cableTypes{31,1} = 'AFL6 240';
cableTypes{32,1} = 'AFL6 185';
cableTypes{33,1} = 'AFL6 240';
cableTypes{1,2} = 'AFL6 120';
cableTypes{2,2} = 'AFL6 120';
cableTypes{3,2} = 'AFL6 240';
cableTypes{4,2} = 'AFL6 240';
cableTypes{5,2} = 'AFL6 120';
cableTypes{6,2} = 'AFL6 120';
cableTypes{7,2} = 'AFL6 120';
cableTypes{8,2} = 'AFL6 120';
cableTypes{9,2} = 'AFL6 240';
cableTypes{10,2} = 'AFL6 185';
cableTypes{11,2} = 'AFL6 185';
cableTypes{12,2} = 'AFL6 185';
cableTypes{13,2} = 'AFL6 240';
cableTypes{14,2} = 'AFL6 240';
cableTypes{15,2} = 'AFL6 240';
cableTypes{16,2} = 'AFL6 240';
cableTypes{17,2} = 'AFL6 185';
cableTypes{18,2} = 'AFL6 240';
cableTypes{19,2} = 'AFL6 240';
cableTypes{20,2} = 'AFL6 240';
cableTypes{21,2} = 'AFL6 240';
cableTypes{22,2} = 'AFL6 240';
cableTypes{23,2} = 'AFL6 240';
cableTypes{24,2} = 'AFL6 240';
cableTypes{25,2} = 'AFL6 240';
cableTypes{26,2} = 'AFL6 185';
cableTypes{27,2} = 'AFL6 240';
cableTypes{28,2} = 'AFL6 240';
cableTypes{29,2} = 'AFL6 240';
cableTypes{30,2} = 'AFL6 240';
cableTypes{31,2} = 'AFL6 240';
cableTypes{32,2} = 'AFL6 185';
cableTypes{33,2} = 'AFL6 240';
cableTypes{34,2} = 'AFL6 120';

currentI = ...
  [0.0138 0.0138;
   0.0115 0.0115;
   0.019 0.019;
   0.006 0.006;
   0.035 0.035;
   0.001 0.001;
   0.004 0.004;
   0.027 0.027;
   0.043 0.043;
   0.01 0.01;
   0.034 0.034;
   0.051 0.051;
   0.062 0.062;
   0.053 0.053;
   0.024 0.024;
   0.02 0.02;
   0.017 0.017;
   0.04 0.04;
   0.016 0.016;
   0.056 0.056;
   0.075 0.075;
   0.029 0.029;
   0.007 0.007;
   0.016 0.016;
   0.084 0.084;
   0.095 0.095;
   0.0126 0.0126;
   0.0102 0.0102;
   0.006 0.006;
   0.006 0.006;
   0.007 0.007;
   0.0102 0.0102;
   0.033 0.033;
   0.0115 0.0115
   ] * 10^3;

powerUsages = ...
  [25.997 25.997;
   21.384 21.384;
   -3.41 -3.41;
   0.558 0.558;
   6.389 6.389;
   -0.081 -0.081;
   -0.469 -0.469;
   -5.163 -5.163;
   8.182 8.182;
   -1.4 -1.4;
   6.402 6.402;
   -9.579 -9.579;
   11.519 11.519;
   9.878 9.878;
   -3.018 -3.018;
   -3.832 -3.832;
   -3.317 -3.317;
   7.557 7.557;
   1.852 1.852;
   -7.743 -7.743;
   12.183 12.183;
   -5.175 -5.175;
   -1.21 -1.21;
   -2.985 -2.985;
   -13.853 -13.853;
   -16.492 16.492;
   23.495 -23.495;
   -18.852 -18.852;
   -1.116 -1.116;
   1.117 1.117;
   1.277 1.277;
   18.118 18.118;
   0.469 0.469;
   21.384, 21.384];
powerUsages = abs(powerUsages) * 10^6;  

thermalExpansionFactors = [1.923E-5 1.918E-5 1.95E-5];

CableName2CableLength = containers.Map(cableNames,cableLengths);
CableName2CableType = containers.Map(cableNames, cableTypes);
CableType2ThermalExpansionFactors = containers.Map(cableTypeNames, thermalExpansionFactors);
CableType2CableResistanceIn20Cels = containers.Map(cableTypeNames, cableResistanceIn20Cels);
CableType2CableMassPerKm = containers.Map(cableTypeNames, cableMassPerKm);
CableName2PowerUsage = containers.Map(cableNames, powerUsages);
CableName2ElectricalCurrent = containers.Map(cableNames, currentI);
