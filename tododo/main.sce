clear;
WRK_PATH = "C:/Users/germain.faity/Documents/GitHub/usefullBatch/tododo"

oldNames_PATH = fullfile(WRK_PATH,"before");
newNames_PATH = fullfile(WRK_PATH,"after");

//list files to rename
oldNames_all = listfiles(oldNames_PATH);

//get names and copy in a loop
for iName = 1:size(oldNames_all,1)
    
    //old name
    oldName = oldNames_all(iName);
    oldFname = fullfile(oldNames_PATH,oldName);
    
    //new name
    oldNameInParts = strsplit(oldName,"_");
    newName = oldNameInParts(1)+"_"+oldNameInParts(2)+"_"+oldNameInParts(3)+"_"+oldNameInParts(4)+"_"+oldNameInParts(5)+"_"+"HandT"+"_"+oldNameInParts(6);
    newFname =fullfile(newNames_PATH,newName);
    
    //get data in old file
    datatxt = mgetl(oldFname);
    
    //put data in new file
    mputl(datatxt, newFname);
end
