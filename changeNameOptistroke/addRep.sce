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
    
    //STEP 1: add REP in name
    //Attention à la casse! ça peut être SC01P011 ou Sc01p011
    //format file = Sc01p011 => Sc01p011_R1
    formatDelsys = "Sc**p***";
    //format file = c01, p014 - ... - REACH.txt => c01, p014, R1 - ... - REACH.txt
    formatMacoki = "c**, p***";
    if strsplit(strsplit(newName,"_")(1))(1)=="S" then
        formatName = "delsys";
    elseif strsplit(strsplit(newName,"_")(1))(1)=="c" | strsplit(strsplit(newName,"_")(1))(1)=="C" then
        formatName = "macoki";
    else
        warning("Format unknown: not delsys, not macoki");
        pause
    end
    
    if formatName == "delsys" then
        sepName = "_";
        sepID = "_";
    elseif formatName == "macoki" then
        sepName = " - ";
        sepID = ", ";
    end
    ID = strsplit(newName,sepName)(1);
    newID = strcat([ID,Rep],sepID);
    newnewName = strcat([newID,(strsplit(newName,sepName)(2:$))'],sepName);
    newnewFname =fullfile(newNames_PATH,newnewName);
    
    //put data in new file
    mputl(datatxt, newnewFname);
end

disp("//////////////////END OF CODE//////////////////")
