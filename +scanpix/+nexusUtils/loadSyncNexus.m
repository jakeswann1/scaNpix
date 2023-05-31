function offset = loadSyncNexus(trialIterator)
%loadSyncNexus - Loads time offset for each trial from session.csv, as
%produced by the loop_axona_spikeinterface.ipynb python script
% 
% Usage:
%       

if trialIterator == 1
    offset = 0;

else
    sessionFile = dir('session.csv');
    
    if isempty(sessionFile)
        [fName,fPath] = uigetfile(fullfile(cd,'*.csv'),'Select csv file with trial times for current data set');
        cd(fPath);
    else
        fName = sessionFile.name;
    end
    
    % Parse csv file and extract total time elapsed in sorting prior to the
    % start of the selected trial
    table = readtable(fName);
    tableInc = table(1:trialIterator-1,10);
    times = str2double(extractBefore(tableInc{:,:}, 8));
    offset = sum(times);

end

