function [fire, transition] = COMMON_PRE(transition)

% load data
load 'data.mat';
global global_info ;

transition.name

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
	newCableLength = calculateCableLength(185, cableThermalExpansionFactor, temperatureChange)
    sumCableLengthen = cableSegments * newCableLength;
    %todo: obliczyæ o ile obni¿y siê kabel w najni¿szym miejcu i jakie s¹
    %graniczne wartoœci
end;

switch 	transition.name
    case 'tGEN_AT1'
        transition.new_color = {'MOC W CHUJ', '500', 'ANI-PRA'}
        transition.override = 1
	case 'tANI_2_HCW'
		s = 'trolololo'
end

fire = 1;
