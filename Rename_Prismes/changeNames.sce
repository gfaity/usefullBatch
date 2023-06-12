//script to rename multiple files in a new directory (copy, no delete)

//init
clear;
WRK_PATH  = "C:\Users\germain.faity\Desktop\Rename_Prismes";
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
    newName = strsubst(oldName,"-","- Z -");
    newFname =fullfile(newNames_PATH,newName);
    
    //get data in old file
    datatxt = mgetl(oldFname);
    
    //put data in new file
    mputl(datatxt, newFname);
    
end
