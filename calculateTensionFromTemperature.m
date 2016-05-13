function [tension] = calculateTensionFromTemperature(temperature)

	tempVals = [80 160];
	tenVals = [34.5 27.9] * 10^6;
	[p, ErrorEst] = polyfit(tempVals, tenVals, 1);
	
	a = p(1);
	b = p(2);
	
	tension = (a * temperature + b ); %* 10^6; % in Pa
end