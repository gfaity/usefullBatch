//script to rename multiple files in a new directory (copy, no delete)

//init
clear;
WRK_PATH  = "C:\Users\germain.faity\Desktop\doss";
oldNames_PATH = fullfile(WRK_PATH,"oldNames");
newNames_PATH = fullfile(WRK_PATH,"newNames");

//Info to add
HeightTarget = "Low";//"Big" or "Low"

//list files to rename
names_all = listfiles(oldNames_PATH);

//get names and copy in a loop
for iName = 1:size(names_all,1)
    //old name
    filename = names_all(iName);
    oldFname = fullfile(oldNames_PATH,filename);
    newFname =fullfile(newNames_PATH,filename);
    
    //get data in old file
    datatxt = mgetl(oldFname);
    
    //get the line to be changed (Record)
    iRecord = grep(datatxt,"Record")
    lineTxt_old = datatxt(iRecord);
    //replace "Small" by "SmallLow"
    lineTxt_tmp = strsubst(lineTxt_old,"Small","Small"+HeightTarget);
    //replace "Big" by "BigLow"
    lineTxt_new = strsubst(lineTxt_tmp,"Big","Big"+HeightTarget);
    //put it back in the datatxt
    datatxt(iRecord)=lineTxt_new;
    
    //put data in new file
    mputl(datatxt, newFname);
    
end
