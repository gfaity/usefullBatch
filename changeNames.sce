//script to rename multiple files in a new directory (copy, no delete)

//init
clear;
WRK_PATH  = "C:\Users\germain.faity\Documents\STAPS\Doctorat\2 - Expériences\Expe2_OPTIMOD\Data & pretest\2- EXPE NOVEMBRE 2021\DATA";
oldNames_PATH = fullfile(WRK_PATH,"delsys_CSV_oldNames");
newNames_PATH = fullfile(WRK_PATH,"delsys_CSV_newNames");

//list files to rename
oldNames_all = listfiles(oldNames_PATH);

//get names and copy in a loop
for iName = 1:size(oldNames_all,1)
    
    //old name
    oldName = oldNames_all(iName);
    oldFname = fullfile(oldNames_PATH,oldName);
    
    //new name
    oldNameInParts = strsplit(oldName,"_");
    newName = oldNameInParts(1)+"_"+oldNameInParts(2)+" - D - "+strcat(oldNameInParts(3:$),"_");
    newFname =fullfile(newNames_PATH,newName);
    
    //get data in old file
    datatxt = mgetl(oldFname);
    
    //put data in new file
    mputl(datatxt, newFname);
    
end
