clear;

WRK_PATH = "C:\Users\germain.faity\Documents\STAPS\Doctorat\2 - Expériences\Expe2_OPTIMOD\Data & pretest\2- EXPE NOVEMBRE 2021\DATA"

delsys_PATH = fullfile(WRK_PATH,"delsys_CSV_newNames");
viconWithoutRPE_PATH = fullfile(WRK_PATH,"vicon_CSV_newNames");
viconWithRPE_PATH = fullfile(WRK_PATH,"vicon_CSV_newNames_withRPE");

delsysFiles = findfiles(delsys_PATH, "* D - REACH_*");

for iFile = 1:size(delsysFiles,1)
    delsysFilename = delsysFiles(iFile);
    
    //find corresponding Vicon file
    SubjectRep = strsplit(delsysFilename," - ")(1);
    cond1 = strsplit(strsplit(delsysFilename, " - ")(3),"_")(1);
    cond2 = strsplit(strsplit(delsysFilename, " - ")(3),"_")(2);
    cond3 = strsplit(strsplit(delsysFilename, " - ")(3),"_")(3);
    RPE = strsplit(strsplit(delsysFilename, " - ")(3),["_","."])(4);
    ext = strsplit(delsysFilename, ".")($);
    
    viconFilenameWithoutRPE = SubjectRep + " - V - " + cond1 + "_" + cond2 + "_" + cond3 + "." + ext;
    viconFilenameWithRPE = SubjectRep + " - V - " + cond1 + "_" + cond2 + "_" + cond3 + "_" + RPE + "." + ext;
    
    viconfullFnameWithoutRPE = fullfile(viconWithoutRPE_PATH,viconFilenameWithoutRPE);
    vicondatatxt = mgetl(viconfullFnameWithoutRPE);
    
    //copy with new name
    viconfullFnameWithRPE = fullfile(viconWithRPE_PATH,viconFilenameWithRPE);
    mputl(vicondatatxt, viconfullFnameWithRPE);
end
