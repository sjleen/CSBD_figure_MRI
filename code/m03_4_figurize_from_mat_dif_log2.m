clear

timestamp = string(datetime,'yyyyMMdd_HHmmss');

load('../mat/data_struct.mat');

% EDIT %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

threshold = 1.5;
map_y = 0.8;
map_rb = 0.2;

format = 'tif';
line_file = "line_extracted.mat";

skip = 15;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

color_map = customcolormap([0 0.5 1], [1 map_rb map_rb; 1 1 map_y; map_rb map_rb 1]);

load(strcat("../mat/", line_file));
data_line = line;

for i = 1:length(data)

    if data(i).normalization_method ~= "div_log2"
        continue;
    end

    subfolder = strcat("../out/out_div_log2_", timestamp, "/", data(i).name, "_threshold_", string(threshold), "_format_", format, "_line_", line_file, "_skip_", string(skip));
    mkdir(subfolder);

    current_data = data(i).value;

    data_bg = isnan(current_data);
    current_data = (current_data + threshold) / (2 * threshold);

    for loc = (skip+1):(skip+1):264
        img = ind2rgb(im2uint8(current_data(:,:,265-loc)), color_map);

        img(repmat(data_bg(:,:,265-loc), [1 1 3])) = 1;
        img(repmat(logical(data_line(:,:,265-loc)), [1 1 3])) = 0;

        img_out = imrotate(img, 90);

        imwrite(img_out(:, 5:end-4, :), strcat(subfolder, "/", sprintf('%03d',loc),".", format));
    end

end