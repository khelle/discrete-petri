function [fire, transition] = COMMON_PRE(transition)

% load data
load 'newdata.mat';
global global_info;

placeNumber = 1;

gen1 = strcmp(transition.name, 'tGEN_ZZY');
gen2 = strcmp(transition.name, 'tGEN_ZZX');
gen3 = strcmp(transition.name, 'tGEN_ZZZ');


generators = gen1 || gen2 || gen3;
if ~generators

	% search for data of particular cable in hashmaps
    segmentLength = 185;
	cableName = transition.name;
	cableLength = CableName2CableLength(cableName);
    cableSegments = floor(cableLength/segmentLength);				% one segment in line is typically 185 meters long
	cableTypeName = CableName2CableType(cableName);
	cableThermalExpansionFactor = CableType2ThermalExpansionFactors(cableTypeName);
	cableResistanceIn20Cels  = CableType2CableResistanceIn20Cels(cableTypeName);
	cableMassPerKm = CableType2CableMassPerKm(cableTypeName);		% meters;
	electricCurrent  = CableName2ElectricalCurrent(cableName);
    cablePowerUsage = CableName2PowerUsage(cableName);
    
    
    Iac = electricCurrent / sqrt(1.0123 + 2.319 * 10^-5 * electricCurrent);
    
	% calculate how cable lengthens
    temperatureDiff =  abs(global_info.EXTERNAL_TEMPERATURE - global_info.BASE_TEMPERATURE);
	cableMass = calculateCableMass(segmentLength, cableMassPerKm);
	cableResistanceAtTemp = calculateTemperatureResistance(aluminiumTemperatureResistanceCoefficient, cableResistanceIn20Cels, temperatureDiff);
	heatChange = Iac * Iac * cableResistanceAtTemp;
	temperatureChange = heatChange / cableMass * aluminiumSpecificHeat;
    temperatureChange = temperatureChange * 0.1;			% we assume that 80% of heat is radiated from cable 
	newCableLength = calculateCableLength(segmentLength, cableThermalExpansionFactor, temperatureChange);
    cableDiff = abs(segmentLength-newCableLength);
    sumCableLengthen = cableSegments * newCableLength;
    globalCable = newCableLength;
    
    cableTension = calculateTensionFromTemperature(temperatureChange);
    sag = (segmentLength * segmentLength * cableMassPerKm) / (8 * cableTension);
    sag = sag * 10^4 * 3; 				% unit adjustment
    
    sag2 = 0.03 * temperatureChange;
    
end;

powerAT1 = 10^8;
powerGEN3 = 10^12;
powerGEN4 = 10^9;

%Add/Change color=power and display lenghtening with power usage
switch 	transition.name
    case 'tGEN_ZZZ'
        transition.new_color = {num2str(powerAT1)};
        transition.override = 1;
        
        disp([' ']);
        disp([transition.name]);
        disp(['generated: ', num2str(powerAT1/10^6), ' [MWatts],']);
        
    case 'tGEN_ZZY'
        transition.new_color = {num2str(powerGEN3)};
        transition.override = 1;
        
        disp([' ']);
        disp([transition.name]);
        disp(['generated: ', num2str(powerAT1/10^6), ' [MWatts],']);
        
    case 'tGEN_ZZX'
        transition.new_color = {num2str(powerGEN4)};
        transition.override = 1;
                
        disp([' ']);
        disp([transition.name]);
        disp(['generated: ', num2str(powerAT1/10^6), ' [MWatts],']);
        
    otherwise
        tokID = tokenAny(transition.name(2:4), 1);
        colors = get_color(transition.name(2:4),tokID);

        power = str2double(colors{1});
        power = power - cablePowerUsage;

        
        disp([' ']);
        disp([transition.name]);
        disp(['cable length difference: ', num2str(cableDiff), ' [meters],']);
        disp(['power usage: ', num2str(cablePowerUsage/1000),' [KiloWatts]']);
        disp(['cable temperature change: ', num2str(temperatureChange),' [Celsius]']);
        
        % sag is calculated according to temperature range
        if (temperatureChange >= 80)
            disp(['sag: ', num2str(sag), ' [meters]']);
             global_info.Sag = [global_info.Sag; sag];
        else
            disp(['sag: ', num2str(sag2), ' [meters]']);
            global_info.Sag = [global_info.Sag; sag2];
        end

        % global_info.Name = [global_info.Name, {];
        global_info.TransitionName = [global_info.TransitionName; {transition.name}];
        global_info.CableDiff = [global_info.CableDiff; cableDiff];
        global_info.CablePowerUsage = [global_info.CablePowerUsage; cablePowerUsage];
        global_info.TemperatureChange = [global_info.TemperatureChange; temperatureChange];
		
        % type(global_info.SIM_NAME)
        if(power <= 0)
            power = 0;

            global_info.STOP_SIMULATION = 1;
        end
        
        transition.new_color = {num2str(power)};
        transition.override = 1;
end

placeNumber = placeNumber + 1;
fire = 1;
