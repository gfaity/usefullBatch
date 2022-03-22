clear;

WRK_PATH = "C:\Users\germain.faity\Documents\GitHub\OPTIMOD\DAT";
cleaned_PATH = fullfile(WRK_PATH,"001-rawcleaned","optimod");
raw_PATH = fullfile(WRK_PATH,"000-viconraw","optimod");

files2copy = findfiles(cleaned_PATH, "* - V - *");

for iFile = 1:size(files2copy,1)
    cleanedName = fullfile(cleaned_PATH, files2copy(iFile));
    rawName = fullfile(raw_PATH, files2copy(iFile));
    
    //copy
    datatxt = mgetl(cleanedName);
    mputl(datatxt, rawName);
    
    //delete old cleaned files
    deletefile(cleanedName);
end