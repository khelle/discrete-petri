[cableMass] = calculateCableMass(cableLength, cableDensity)

% cableDensity [kg/km]
% cableLength [km]
cableLengthInKm = cableLength / 1000;
cableMass = cableDensity * cableLengthInKm; 