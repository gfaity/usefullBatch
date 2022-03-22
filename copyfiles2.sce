clear;
WRK_PATH = "D:\VISUEL\CREATIONS\SAINT-DROP\VIsuels INSTRUS\VIDEOS";
RES_PATH = "D:\VISUEL\CREATIONS\SAINT-DROP\VIsuels INSTRUS\VIDEOS\IMG";

//make directory
mkdir(RES_PATH);

//search for directory to find in
allFiles = listfiles(WRK_PATH);

for iDir = 1:size(allFiles, 1)
    thisDir = allFiles(iDir);
    thisDirFname = fullfile(WRK_PATH, thisDir);
    
    if thisDirFname <>  "D:\VISUEL\CREATIONS\SAINT-DROP\VIsuels INSTRUS\VIDEOS\IMG" then
    
        //check if its a dir
        if isdir(thisDirFname) then
            //find for jpg
            allJPGnames = findfiles(thisDirFname, "*.jpg");
            for iJPG = 1:size(allJPGnames, 1)
                thisJPGname = allJPGnames(iJPG);
                //copy
                if isempty(grep(thisJPGname, "YT")) then
                    thisJPGFname = fullfile(thisDirFname, thisJPGname);
                    
                    [path, fname, extension] = fileparts(thisJPGname);
                    thisJPGFname_new = fullfile(RES_PATH, fname+"_"+string(iDir)+extension);
                    copyfile(thisJPGFname, thisJPGFname_new);
                end
            end
            
            //find for png
            allPNGnames = findfiles(thisDirFname, "*.png");
            for iPNG = 1:size(allPNGnames, 1)
                thisPNGname = allPNGnames(iPNG);
                //copy
                if isempty(grep(thisPNGname, "YT")) then
                    thisPNGFname = fullfile(thisDirFname, thisPNGname);
                    [path, fname, extension] = fileparts(thisPNGname);
                    thisPNGFname_new = fullfile(RES_PATH, fname+"_"+string(iDir)+extension);
                    copyfile(thisPNGFname, thisPNGFname_new);
                end
            end
            
            disp(string(iDir)+" sur "+string(size(allFiles, 1)));
        end
    end
end
