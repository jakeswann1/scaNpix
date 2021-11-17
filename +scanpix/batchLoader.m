function objData = batchLoader(cribSheetPath, method, dataType, varargin )
% batchLoader - load a bunch of data based on info from an excel sheet.
% Basically a wrapper for scanpix.objLoader
% See 'scanpix.helper.readExpInfo' for details on sheet format. 
%
% Syntax:
%       objData = scanpix.batchLoader(cribSheetPath, method )
%       objData = scanpix.batchLoader(cribSheetPath, method, Name-Value comma separated list )
%
% Inputs:
%    cribSheetPath - path to cribsheet on disk 
%    method        - 'exp' or 'single'
%    varargin      - 'objParams' - containers.Map (see 'scanpix.helpers.defaultParamsContainer' for details on format)
%                  - 'mapParams' - mapParamsStruct (see 'scanpix.maps.defaultParamsRateMaps' for details on format)
%
% Outputs:
%    objData       - cell array with data
%
%
% LM 2021
%
%%
objParams       = [];
mapParams       = [];

p = inputParser;
addParameter(p,'objParams', objParams);
addParameter(p,'mapParams', mapParams, @isstruct);

parse(p,varargin{:});

%%
expInfo = scanpix.helpers.readExpInfo( cribSheetPath, method );

objData = cell(length(expInfo), 1);
for i = 1:length(expInfo.animal)
    objData{i} = scanpix.objLoader(dataType,expInfo.fullPath{i}, p.Results.objParams, p.Results.mapParams);
end

end

