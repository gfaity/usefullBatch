//script to rename multiple files in a new directory (copy, no delete)

//init
clear;
WRK_PATH  = "C:\Users\germain.faity\Desktop\doss";
oldNames_PATH = fullfile(WRK_PATH,"oldNames");
newNames_PATH = fullfile(WRK_PATH,"newNames");

//Info to add
Rep = "R1"; //"R1" or "R2"

//list files to rename
names_all = listfiles(oldNames_PATH);

//get names and copy in a loop
for iName = 1:size(names_all,1)
    //inform user
    disp("Now begin of file " +string(iName)+"/"+string(size(names_all,1)));
    
    //old name
    oldName = names_all(iName);
    oldFname = fullfile(oldNames_PATH,oldName);
    
    //get data in old file
    datatxt = mgetl(oldFname);
    
    //new name = same
    newName = oldName;
    newFname = oldFname;
    
    //STEP 1: change REP to R0
    newnewName = strsubst(newName, "_R0_", "_"+Rep+"_");
    newnewFname =fullfile(newNames_PATH,newnewName);
    
    //put data in new file
    mputl(datatxt, newnewFname);
end

disp("//////////////////END OF CODE//////////////////")
