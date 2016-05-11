function [fire, transition] = COMMON_PRE(transition)

% load data
load 'data.mat';
global global_info ;

gen1 = strcmp(transition.name, 'tGEN_3');
gen2 = strcmp(transition.name, 'tGEN_4');
gen3 = strcmp(transition.name, 'tGEN_AT1');

generators = gen1 || gen2 || gen3;
if ~generators
% search for data of particular cable in hashmaps
	cableName = transition.name;
	cableLength = CableName2CableLength(cableName);
    cableSegments = floor(cableLength/185); %one segment in line is typically 185 meters long
	cableTypeName = CableName2CableType(cableName);
	cableThermalExpansionFactor = CableType2ThermalExpansionFactors(cableTypeName);
	cableResistanceIn20Cels  = CableType2CableResistanceIn20Cels(cableTypeName);
	cableMassPerKm = CableType2CableMassPerKm(cableTypeName);
	
	%calculate how cable lengthens
	cableMass = calculateCableMass(185, cableMassPerKm);
	cableResistanceAtTemp = calculateTemperatureResistance(aluminiumTemperatureResistanceCoefficient, cableResistanceIn20Cels, global_info.EXTERNAL_TEMPERATURE - global_info.BASE_TEMPERATURE);
	heatChange = 3 * electricCurrent * electricCurrent* cableResistanceAtTemp;
	temperatureChange = heatChange / cableMass * aluminiumSpecificHeat;
	newCableLength = calculateCableLength(185, cableThermalExpansionFactor, temperatureChange);
    sumCableLengthen = cableSegments * newCableLength;
    %todo: obliczy� o ile obni�y si� kabel w najni�szym miejcu i jakie s�
    %graniczne warto�ci
end;

switch 	transition.name
    case 'tGEN_AT1'
                                %FROM    , POWER, ...
        transition.new_color = {'500'};
        transition.override = 1
	case 'tANI_2_KDN'

        tokID = tokenAny(transition.name(2:4), 1); % first, select the only token
        colors = get_color(transition.name(2:4),tokID) % % second, get the colors of the token

        power = str2double(colors{1}) % convert the color-2 into number
        power = power -50;

        transition.new_color = {num2str(power)}; % put the sum as the new color 
        transition.override = 1; % only sum as color - NO inheritance
	case 'tKDN_2_ZAG'
        tokID = tokenAny(transition.name(2:4), 1);
        colors = get_color(transition.name(2:4),tokID)


    otherwise
        transition
end

fire = 1;
