//script to rename multiple files in a new directory (copy, no delete)

//init
clear;
WRK_PATH  = "C:\Users\germain.faity\Desktop\doss";
oldNames_PATH = fullfile(WRK_PATH,"oldNames");
newNames_PATH = fullfile(WRK_PATH,"newNames");

//list files to rename
oldNames_all = listfiles(oldNames_PATH);

//get names and copy in a loop
for iName = 1:size(oldNames_all,1)
    //old name
    oldName = oldNames_all(iName);
    oldFname = fullfile(oldNames_PATH,oldName);
    
    //new name: replace "p107" by "p007"
    newName_tmp = strsubst(oldName, "p107", "p007");
    //new name: replace "p108" by "p008"
    newName_tmp = strsubst(newName_tmp, "p108", "p008");
    //new name: replace "P108" by "p008"
    newName_tmp = strsubst(newName_tmp, "P108", "p008");
    //new name: replace "C01" by "c01"
    newName_tmp = strsubst(newName_tmp, "C01", "c01");
    //
    newFname =fullfile(newNames_PATH,newName_tmp);
    
    //get data in old file
    datatxt = mgetl(oldFname);
    
    //put data in new file
    mputl(datatxt, newFname);
    
end
