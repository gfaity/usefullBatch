//script to rename multiple files in a new directory (copy, no delete)

//init
clear;
WRK_PATH  = "C:\Users\germain.faity\Desktop\doss";
oldNames_PATH = fullfile(WRK_PATH,"oldNames");
newNames_PATH = fullfile(WRK_PATH,"newNames");

//Info to add
HeightTarget = "High";//"Big" or "Low"
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
    
    //STEP 1: replace name of file
    //new name: replace "Big" by "BigLow"
    newName_tmp = strsubst(oldName, "Big", "Big"+HeightTarget);
    //new name: replace "Small" by "SmallLow"
    newName = strsubst(newName_tmp, "Small", "Small"+HeightTarget);
    newFname =fullfile(newNames_PATH,newName);
    
    //get data in old file
    datatxt = mgetl(oldFname);
    
    //STEP 2: replace name of Record for Mocap files
    //get the line to be changed (Record)
    iRecord = grep(datatxt,"Record");
    if ~isempty(iRecord) then
        lineTxt_old = datatxt(iRecord);
        //replace "Small" by "SmallLow"
        lineTxt_tmp = strsubst(lineTxt_old,"Small","Small"+HeightTarget);
        //replace "Big" by "BigLow"
        lineTxt_new = strsubst(lineTxt_tmp,"Big","Big"+HeightTarget);
        //put it back in the datatxt
        datatxt(iRecord)=lineTxt_new;
    end
    
    //STEP 3: replace RPE names
    //get the line to be changed (RPE_REACH_lightBig)
    //1. RPE_REACH_lightBig
    iRPE_REACH_lightBig = grep(datatxt,"RPE_REACH_lightBig");
    if ~isempty(iRPE_REACH_lightBig) then
        lineTxt_old = datatxt(iRPE_REACH_lightBig);
        //replace "RPE_REACH_lightBig" by "RPE_REACH_lightBigLow"
        lineTxt_new = strsubst(lineTxt_old,"RPE_REACH_lightBig","RPE_REACH_lightBig"+HeightTarget);
        //put it back in the datatxt
        datatxt(iRPE_REACH_lightBig)=lineTxt_new;
    end
    //2. RPE_REACH_lightSmall
    iRPE_REACH_lightSmall = grep(datatxt,"RPE_REACH_lightSmall");
    if ~isempty(iRPE_REACH_lightSmall) then
        lineTxt_old = datatxt(iRPE_REACH_lightSmall);
        //replace "RPE_REACH_lightSmall" by "RPE_REACH_lightSmall"
        lineTxt_new = strsubst(lineTxt_old,"RPE_REACH_lightSmall","RPE_REACH_lightSmall"+HeightTarget);
        //put it back in the datatxt
        datatxt(iRPE_REACH_lightSmall)=lineTxt_new;
    end
    //3. RPE_REACH_ctrlBig
    iRPE_REACH_ctrlBig = grep(datatxt,"RPE_REACH_ctrlBig");
    if ~isempty(iRPE_REACH_ctrlBig) then
        lineTxt_old = datatxt(iRPE_REACH_ctrlBig);
        //replace "RPE_REACH_ctrlBig" by "RPE_REACH_ctrlBig"
        lineTxt_new = strsubst(lineTxt_old,"RPE_REACH_ctrlBig","RPE_REACH_ctrlBig"+HeightTarget);
        //put it back in the datatxt
        datatxt(iRPE_REACH_ctrlBig)=lineTxt_new;
    end
    //4. RPE_REACH_ctrlSmall
    iRPE_REACH_ctrlSmall = grep(datatxt,"RPE_REACH_ctrlSmall");
    if ~isempty(iRPE_REACH_ctrlSmall) then
        lineTxt_old = datatxt(iRPE_REACH_ctrlSmall);
        //replace "RPE_REACH_ctrlSmall" by "RPE_REACH_ctrlSmall"
        lineTxt_new = strsubst(lineTxt_old,"RPE_REACH_ctrlSmall","RPE_REACH_ctrlSmall"+HeightTarget);
        //put it back in the datatxt
        datatxt(iRPE_REACH_ctrlSmall)=lineTxt_new;
    end
    //5. RPE_REACH_loadBig
    iRPE_REACH_loadBig = grep(datatxt,"RPE_REACH_loadBig");
    if ~isempty(iRPE_REACH_loadBig) then
        lineTxt_old = datatxt(iRPE_REACH_loadBig);
        //replace "RPE_REACH_loadBig" by "RPE_REACH_loadBig"
        lineTxt_new = strsubst(lineTxt_old,"RPE_REACH_loadBig","RPE_REACH_loadBig"+HeightTarget);
        //put it back in the datatxt
        datatxt(iRPE_REACH_loadBig)=lineTxt_new;
    end
    //6. RPE_REACH_loadSmall
    iRPE_REACH_loadSmall = grep(datatxt,"RPE_REACH_loadSmall");
    if ~isempty(iRPE_REACH_loadSmall) then
        lineTxt_old = datatxt(iRPE_REACH_loadSmall);
        //replace "RPE_REACH_loadSmall" by "RPE_REACH_loadSmall"
        lineTxt_new = strsubst(lineTxt_old,"RPE_REACH_loadSmall","RPE_REACH_loadSmall"+HeightTarget);
        //put it back in the datatxt
        datatxt(iRPE_REACH_loadSmall)=lineTxt_new;
    end
    
    //STEP 4: add REP in name
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
