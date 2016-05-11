function [newResistanceValue] = calculateTemperatureResistance(temperatureResistanceCoefficient, baseResistance, temperatureChange)

newResistanceValue = baseResistance * (1 + temperatureResistanceCoefficient * temperatureChange);

end