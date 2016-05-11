function [fire, transition] = COMMON_PRE(transition)

% load data
load 'newdata.mat';
global global_info;


gen1 = strcmp(transition.name, 'tGEN_3');
gen2 = strcmp(transition.name, 'tGEN_4');
gen3 = strcmp(transition.name, 'tGEN_AT1');


globalCable = 0;
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
	electricCurrent  = CableName2ElectricalCurrent(cableName);
    cablePowerUsage = CableName2PowerUsage(cableName)
    
	%calculate how cable lengthens
	cableMass = calculateCableMass(185, cableMassPerKm);
	cableResistanceAtTemp = calculateTemperatureResistance(aluminiumTemperatureResistanceCoefficient, cableResistanceIn20Cels, global_info.EXTERNAL_TEMPERATURE - global_info.BASE_TEMPERATURE);
	heatChange = 3 * electricCurrent * electricCurrent* cableResistanceAtTemp;
	temperatureChange = heatChange / cableMass * aluminiumSpecificHeat;
	newCableLength = calculateCableLength(185, cableThermalExpansionFactor, temperatureChange)
    cableDiff = abs(185-newCableLength)
    sumCableLengthen = cableSegments * newCableLength;
    globalCable = newCableLength;
    
    %todo: obliczyæ o ile obni¿y siê kabel w najni¿szym miejcu i jakie s¹
    %graniczne wartoœci
end;


transition
switch 	transition.name
    case 'tGEN_AT1'
                                %FROM
        transition.new_color = {'100000000'};
        transition.override = 1;
        
         
    case 'tGEN_3'
                                %FROM
        transition.new_color = {'100000000'};
        transition.override = 1;
        
         
    case 'tGEN_4'
                                %FROM
        transition.new_color = {'100000000'};
        transition.override = 1;
        
        
      

    otherwise
        tokID = tokenAny(transition.name(2:4), 1);
        colors = get_color(transition.name(2:4),tokID);

        power = str2double(colors{1})
        power = power - cablePowerUsage

        disp([transition.name,  ' cable length difference : ', num2str(cableDiff),...
            '  [meters],  power usage ', num2str(cablePowerUsage),' (Watts)']);


        
        if(power <= 0)
            power = 0;
            global_info.STOP_SIMULATION = 1;
        end
        
        transition.new_color = {num2str(power)}; % put the sum as the new color 
        transition.override = 1; % only sum as color - NO inheritance
end


fire = 1;
