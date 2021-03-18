function prmsMap = defaultParamsContainer(classType)
% defaultParamsContainer - Generate the default container map for the basic
% parameter space for dacq or npix objects
% package: scanpix.helpers
% 
%
% Syntax:  prmsMap = scanpix.helpers.defaultParamsContainer
%
% Inputs:  classType - char to indicate class of object for the params container 
%          
%
% Outputs: prmsMap - map container with default parameters
%
% See also: scanpix.dacq; scanpix.npix;
%
% LM 2020
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

classFolder = what('scanpix');

switch classType
    % npix class object  
    case 'scanpix.npix'
        keys =  {   'ScalePos2PPM',...
                    'posMaxSpeed',...
                    'posSmooth',...
                    'posHead',...
                    'posFs',...
                    'APFs',...
                    'lfpFs',...
                    'defaultDir',...
                    'myRateMapParams'};
        
        vals =   {      400,...
                        4,...
                        0.4,...
                        0.5,...
                        50,...
                        3e4,...
                        2500,...
                        [classFolder.path filesep],...
                        ''           };
    % dacq class object
    case 'scanpix.dacq'
        
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
                    'defaultDir',...
                    'myRateMapParams'};
        
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
                        [classFolder.path filesep],...
                        ''           };
            
end

prmsMap = containers.Map(keys,vals);

end

