function [newLength] =  calculateCableLength(oldLength, thermalExpansionFactor, temperatureDifference)

newLength = oldLength * (1 * thermalExpansionFactor * temperatureDifference);

end;