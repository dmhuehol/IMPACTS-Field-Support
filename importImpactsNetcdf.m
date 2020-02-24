function [impacts] = importImpactsNetcdf(impacts_nc)
impacts.height = ncread(impacts_nc,'ht');
impacts.pressure = ncread(impacts_nc,'pres');
impacts.temp = ncread(impacts_nc,'temp');
impacts.rhum = ncread(impacts_nc,'rh');
impacts.wind_spd = ncread(impacts_nc,'wspd');
impacts.wind_dir = ncread(impacts_nc,'wdir');
end