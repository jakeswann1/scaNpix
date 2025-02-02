function prms = defaultParamsRateMaps
% defaultParamsRateMaps - Generate the default params structure for making rate maps
% package: scanpix.maps
%
% Syntax:  prms = scanpix.maps.defaultParamsRateMaps
%
% Inputs:
%
% Outputs: prms - prms struct with default parameters
%
%
% LM 2020

%% params for maps

%% general
% prms.gen.posFs                 = 50;    % sample rate
speedFilterLimitLow              = 2.5;
speedFilterLimitHigh             = 400;
showWaitBar                      = false;

%% rate maps
prms.rate.speedFilterFlagRMaps   = 1;    % y/n
prms.rate.speedFilterLimitLow    = speedFilterLimitLow;
prms.rate.speedFilterLimitHigh   = speedFilterLimitHigh;
prms.rate.binSizeSpat            = 2.5;  % spatial bin size in cm^2
prms.rate.smooth                 = 'adaptive'; % 'boxcar; 'adaptive'
prms.rate.smoothKernel           = 5;    % size smoothing kernel (in bins)
prms.rate.alpha                  = 200;  % alpha parameter - don't change
prms.rate.envSize                = [];
prms.rate.trimNaNs               = false;
prms.rate.showWaitBar            = showWaitBar;

%% dir maps
prms.dir.speedFilterFlagDMaps    = 1;    % y/n
prms.dir.speedFilterLimitLow     = speedFilterLimitLow;
prms.dir.speedFilterLimitHigh    = speedFilterLimitHigh;
prms.dir.binSizeDir              = 6;    % in degrees
prms.dir.dirSmoothKern           = 5;    % smooth across that many bins
prms.rate.showWaitBar            = showWaitBar;

%% lin maps
prms.lin.trackType               = [];
% Parameters for linearisation of position data 
prms.lin.trackLength             = [];   % in pixels; for square track it should be length for 1 arm 
prms.lin.minDwellForEdge         = 1;    % in s
prms.lin.durThrCohRun            = 2;   % In seconds
prms.lin.filtSigmaForRunDir      = 3;    % Units=sec. Sigma of the Gaussian filter to pre-filter the data before finding CW and CCW runs. Kernel is 2*sigma in length.
prms.lin.durThrJump              = 2;    % In seconds
prms.lin.gradThrForJumpSmooth    = 2.5;
prms.lin.runDimension            = [];                  % This is the dimension to run (X=1, Y=2); will be estimated if empty (lin track only parameter) 
prms.lin.dirTolerance            = 70;  % Tolerance for heading direction, relative to arm direction, for calculating run direction (degrees, but will switch to radians)
    
% linear map params
prms.lin.binSizeLinMaps          = 2.5; % bin size (cm^2)
prms.lin.smoothFlagLinMaps       = 1;  % y/n
prms.lin.smoothKernelSD          = 2;  % SD, in bins
prms.lin.speedFilterFlagLMaps    = 1;  % y/n
prms.lin.speedFilterLimitLow     = speedFilterLimitLow;
prms.lin.speedFilterLimitHigh    = speedFilterLimitHigh;
prms.lin.posIsCircular           = 0;
prms.lin.remTrackEnds            = 0;  % Remove this many bins from each end of the linear track. Set to 0 to remove none.
% prms.lin.normSort              = 1;
% don't change
prms.lin.dirTolerance            = prms.lin.dirTolerance * pi/180; % radians

%% object vector maps
prms.objVect.binSz_dist          = 2.5;   % in cm;  2cm in H�ydal et al (2019)
prms.objVect.binSz_dir           = 5;     % in degrees;  5deg in H�ydal et al (2019)
% prms.ov.posFs                  = 50;    % sample rate
prms.objVect.smKernelSz_OV       = 5;
prms.objVect.smSigma_OV          = 2;
prms.objVect.showWaitBar         = showWaitBar;

%% speed maps
% prms.speed.posRate             = 50;    % Hz (50)
prms.speed.minBinProp            = 0.005; % valid speed bins need to contain > prctg of samples of population (0.5%)
prms.speed.speedBinSz            = 2;     % cm/s (2 cm/s)
prms.speed.maxSpeed              = 40;    % cm/s (40 cm/s)
prms.speed.smKernelLength        = 0.25;  % in seconds (250ms)
prms.speed.normaliseFR           = true;  % logical flag
prms.speed.confInt               = 95;    % confidence interval
prms.speed.showWaitBar           = showWaitBar;

%% spatial autocorellograms
prms.sac.dum                     = [];  % dummy field

%% grid props
prms.gridProps.peakMode          = 'point';     % Are peaks local max points ('point'), or contig areas over corrThr ('area')?
prms.gridProps.corrThr           = 0;          % For peakMode='point', points must be >corrThr. For peakMode='area', look for contig regions over corrThr.
prms.gridProps.fieldExtentMethod = 'watershed'; % How do we find the extent of the peaks. 'halfHeight' or 'watershed'.
prms.gridProps.corrThrMode       = 'abs';    % Does corrThr refer to absolute r-value (default) or r relative to central point ('rel', for time-win ACs).
prms.gridProps.areaThr           = 20;           % Min size of contig areas when peakMode='area'. 100(MoserThr) * 1.5^2(MoserBin) / 1.92^2(WillsBin) = 61
prms.gridProps.closePeakFilter   = [0 1 1 1 0; ones(3,5); 0 1 1 1 0];    % When peakMode='point', this filter defines area within which two peaks are counted as one.
prms.gridProps.radius            = 'est';         % How are peaks used to estimate gridness ring. 
prms.gridProps.cenPkThr          = 0.5;           % Threshold used to define extent of central peak (removed from gridness corrs). Relative to central point.
prms.gridProps.centreMaskSizeThr = 0.5;    % If (central peak area)/(outer peak circle area) > centreMaskSizeThr, reject as grid cell. Using this option ..
                             %  .. checks that the AC has a well-defined central peak, otherwise it's not a grid. Set to [] to inactivate.
prms.gridProps.crossCorrMode     = 0;        % Assumes CG is a cross-cell CG. Looks for closest peak to centre, treats this point as the centre of the CG and proceeds
                             % to calculate gridness. Set 'centreMaskSizeThr' to [], as this code hasn't been fixed for cross-corrs.
prms.gridProps.verbose           = 0;              % Print to screen prms struct
prms.gridProps.showCorrRing      = 0;         % Display figure with 'doughnut' of autocorr bins that are rotated and correlated to form grid score.


