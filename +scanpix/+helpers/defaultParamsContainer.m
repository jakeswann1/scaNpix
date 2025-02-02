function prmsMap = defaultParamsContainer(dataType)
% defaultParamsContainer - Generate the default container map for the basic
% parameter space for dacq or npix objects
% package: scanpix.helpers
% 
%
% Syntax:  prmsMap = scanpix.helpers.defaultParamsContainer
%
% Inputs:  dataType - char to indicate data type of object for the params container 
%                     ('dacq' or 'npix')
%          
%
% Outputs: prmsMap - map container with default parameters
%
% See also: scanpix.ephys
%
% LM 2020
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

classFolder = what('scanpix');

switch dataType
    % npix class object  
    case 'npix'
        keys =  {   'ScalePos2PPM',...
                    'posMaxSpeed',...
                    'posSmooth',...
                    'posHead',...
                    'posFs',...
                    'loadFromPhy',...
                    'APFs',...
                    'lfpFs',...
                    'defaultDir',...
                    'myRateMapParams',...
                    'type'          };
        
        vals =   {      400,...
                        4,...
                        0.4,...
                        0.5,...
                        50,...
                        true,...
                        3e4,...
                        2500,...
                        [classFolder.path filesep],...
                        '',...  
                        'npix'       };
    % dacq class object
    case 'dacq'
        
        keys =  {   'ScalePos2PPM',...
                    'posMaxSpeed',...
                    'posSmooth',...
                    'posHead',...
                    'posFs',...
                    'cutFileType'...
                    'cutTag1',...
                    'cutTag2',...
                    'lfpFs',...
                    'lfpHighFs',...
                    'loadHighFsLFP',...
                    'defaultDir',...
                    'myRateMapParams',...
                    'type'              };
        
        vals =   {      400,...
                        4,...
                        0.4,...
                        0.5,...
                        [],...
                        'cut',...
                        '',...
                        '',...
                        [],...
                        [],...
                        true,...
                        [classFolder.path filesep],...
                        '',...
                        'dacq'          };
    case 'nexus'
            
end

prmsMap = containers.Map(keys,vals);

end

