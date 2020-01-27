function [wetbulbTemp] = wetbulb(P,Td,T)
%%wetbulb
    %Function to calculate wetbulb temperature given pressure, dewpoint, and
    %temperature. Uses the psychrometric formula from the American
    %Meteorological Society glossary. Vapor pressure calculations use the
    %improved August-Roche-Magnus approximation, that is, equation 21 from
    % Alduchov, O.A. and R.E. Eskridge, 1996: 
    % Improved Magnus Form Approximation of Saturation Vapor Pressure.
    % J. Appl. Meteor., 35, 601?609,
    % https://doi.org/10.1175/1520-0450(1996)035<0601:IMFAOS>2.0.CO;2
    %
    %General form:
    % [wetbulbTemp] = wetbulb(P,Td,T)
    %Inputs:
    %P: pressure in hectopascals
    %Td: dewpoint in deg C
    %T: temperature in deg C
    %
    %Version Date: 10/25/2019
    %Last major revision: 10/25/2019
    %Written by: Daniel Hueholt
    %North Carolina State University
    %Undergraduate Research Assistant at Environment Analytics
    %
    %See also addWetbulb
    %

syms Tw %Declare the Tw symbol, required for symbolic toolbox operations

eAct = 6.1094.*exp((17.625.*Td)./(243.04+Td)); % Actual vapor pressure calculated from Td using improved ARM

if T>0
    wetbulbTemp = vpasolve(eAct == 6.1094.*exp((17.625.*Tw)./(243.04+Tw))-6.60.*10^(-4).*(1+0.00115.*Tw).*P.*(T-Tw),Tw,[-100 50]); %Solves the wetbulb equation numerically with AMS glossary formula
else
    wetbulbTemp = vpasolve(eAct == 6.1094.*exp((17.625.*Tw)./(243.04+Tw))-5.82.*10^(-4).*(1+0.00115.*Tw).*P.*(T-Tw),Tw,[-100 50]); %Solves the wetbulb equation numerically with AMS glossary formula
end

end