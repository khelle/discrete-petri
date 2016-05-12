function [tension] = calculateTensionFromTemperature(temperature)

tempVals = [80 160];
tenVals = [34.5 27.9] * 10^6;
 [p, ErrorEst] = polyfit(tempVals, tenVals, 1);
 
 pop_fit = polyval(tempVals,tenVals,ErrorEst);
 
 
 a = p(1);
 b = p(2);
 
tension = (a * temperature + b ); %* 10^6; % in Pa
 
x = -30:1:200;
y = a * x + b;

%figure(2);
%plot(x,y);

end