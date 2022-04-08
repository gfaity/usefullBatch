//script to rename multiple files in a new directory (copy, no delete)

//init
clear;
WRK_PATH  = "C:\Users\germain.faity\Documents\GitHub\CircularSteeringTask\1-ScilabMainAnalysis\DAT\20220406_Circular_Tifenn";
oldNames_PATH = fullfile(WRK_PATH,"oldNames");
newNames_PATH = fullfile(WRK_PATH,"newNames");

//list files to rename
oldNames_all = listfiles(oldNames_PATH);

//get names and copy in a loop
for iName = 1:size(oldNames_all,1)
    
    //old name
    oldName = oldNames_all(iName);
    oldFname = fullfile(oldNames_PATH,oldName);
    
    //new name
    oldNameInParts = strsplit(oldName,["_condition","."]);
    newName = "S"+oldNameInParts(1)+"xx"+"_R"+oldNameInParts(2)+"_"+"dominant"+".csv";
    newFname =fullfile(newNames_PATH,newName);
    
    //get data in old file
    datatxt = mgetl(oldFname);
    
    //put data in new file
    mputl(datatxt, newFname);
    
end
