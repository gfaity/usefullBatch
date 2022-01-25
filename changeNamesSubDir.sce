//script to rename multiple files in a new directory (copy, no delete)

//init
clear;
WRK_PATH  = "C:\Users\germain.faity\Documents\STAPS\Doctorat\2 - Expériences\Expe2_OPTIMOD\Data & pretest\2- EXPE NOVEMBRE 2021\DATA\Vicon\only csv";
newNames_PATH = fullfile(WRK_PATH,"all_newNames");

//files are organised into subfolders
subjects = listfiles(WRK_PATH)(1:$-1);

//get names and copy in a loop

for iSubject = 1:size(subjects,1) //loop for subject
    subject = subjects(iSubject);
    repetitions = listfiles(fullfile(WRK_PATH,subject));
    
    for iRep = 1:size(repetitions,1)   //loop for reps
        repetition=repetitions(iRep);
        if repetition == "Session 2" then
            Rep = "R2";
        elseif repetition == "Session 1" then
            Rep = "R1";
        else
            disp("problem in repetition name: please solve");
            pause
        end
        
        oldName_PATH = fullfile(WRK_PATH,subject,repetition);
        //list files to rename, for this subject, for this rep
        oldNames_all = listfiles(oldName_PATH);
        
        for iName = 1:size(oldNames_all,1) //loop for file
            
            //old name
            oldName = oldNames_all(iName);
            oldFname = fullfile(WRK_PATH,subject,repetition,oldName);
            
            //new name
            oldNameInParts = strsplit(oldName,"_");
            newName = subject + "_" + Rep + " - V - " + oldName;
            newFname =fullfile(newNames_PATH,newName);
            
            //get data in old file
            datatxt = mgetl(oldFname);
            
            //put data in new file
            mputl(datatxt, newFname);
        end
    end
end
