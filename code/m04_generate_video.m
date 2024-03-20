clear

% EDIT %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

folder = '../out/out_div_log2_20240314_162701';

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

subfolder_list = dir(strcat(".\", folder));

for i = 1:length(subfolder_list)

    if subfolder_list(i).name == "." || subfolder_list(i).name == ".."
        continue;
    end

    file_list = dir(strcat(".\", folder, "\", subfolder_list(i).name, "\*.tif"));

    writerObj = VideoWriter(strcat(".\", folder, "\", subfolder_list(i).name, "\video.avi"), 'Uncompressed AVI');
    writerObj.FrameRate = 30;

    open(writerObj);
    for j = 1:length(file_list)
        img = strcat(".\", folder, "\", subfolder_list(i).name, "\", file_list(j).name);
        frame = im2uint8(imread(img));

        writeVideo(writerObj, frame);
    end
    close(writerObj);

end

clear