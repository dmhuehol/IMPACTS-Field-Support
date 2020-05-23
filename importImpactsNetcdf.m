function [impacts] = importImpactsNetcdf(impacts_nc)
%%importImpactsNetcdf
%   Import a single sounding in formats associated with the IMPACTS field
%   campaign.
%
%   General form: [impacts] = importImpactsNetcdf(impacts_nc)
%
%   Version date: 5/22/2020
%   Last major revision: 5/22/2020
%   Written by: Daniel Hueholt
%   Research Assistant at Environment Analytics
%   North Carolina State University

%% Detect sounding type by variable names
[netinfo] = ncinfo(impacts_nc);
varNames = {netinfo.Variables.Name}; %HAGL
if ~isempty(find(contains(varNames,'HAGL'),1))
    inst = 'UIUC';
elseif ~isempty(find(contains(varNames,'refractive_index'),1))
    inst = 'SBU';
elseif ~isempty(find(contains(varNames,'thtv'),1))
    inst = 'NWS';
elseif ~isempty(find(contains(varNames,'ht'),1))
    inst = 'NCSU';
else
    inst = NaN;
    msg = 'Unknown format! Cannot import file.';
    error(msg)
end

switch inst
    case 'UIUC'
        impacts.height = ncread(impacts_nc,'HAGL');
        impacts.pressure = ncread(impacts_nc,'PRESS');
        impacts.temp = ncread(impacts_nc,'TC');
        impacts.rhum = ncread(impacts_nc,'RH');
        impacts.wind_spd = ncread(impacts_nc,'WINDSPD');
        impacts.wind_dir = ncread(impacts_nc,'WINDDRN');
    case 'SBU'
        msgSBU = 'Support for SBU format is unfinished!';
        warning(msgSBU)
        impacts = [];
    case 'NCSU'
        impacts.height = ncread(impacts_nc,'ht');
        impacts.pressure = ncread(impacts_nc,'pres');
        impacts.temp = ncread(impacts_nc,'temp');
        impacts.rhum = ncread(impacts_nc,'rh');
        impacts.wind_spd = ncread(impacts_nc,'wspd');
        impacts.wind_dir = ncread(impacts_nc,'wdir');
    case 'NWS'
        msgNWS = 'Support for NWS format is unfinished! Use IGRA dataset and associated functions when possible.';
        warning(msgNWS)
        impacts = [];
end
disp(['Balloon launched by: ' inst])

end