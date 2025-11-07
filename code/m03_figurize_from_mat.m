clear

timestamp = string(datetime,'yyyyMMdd_HHmmss');

load('../mat/data_struct.mat');

% EDIT %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Data filtering
normalization_method = "div_log2";

% Processing
threshold = 0.3;
map_y = 0.7;
map_rb = 0.2;
color_map = customcolormap([0 0.5 1], [1 map_rb map_rb; 1 1 map_y; map_rb map_rb 1]);

% Exporting
format = 'tif';
line_file = "line_extracted.mat";

% Location - Outputs from first_location_of_range, within the [first_location_of_range, last_location_of_range] range, skipping by 'skip' steps.
first_location_of_range = 80;
skip = 15;
last_location_of_range = 192; % Enter 0 to process until the end (max size)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

load(strcat("../mat/", line_file));

for i = 1:length(data)

    if data(i).normalization_method ~= normalization_method
        continue;
    end

    subfolder = strcat("../out/out_", normalization_method, "_", timestamp, "/", data(i).name, "__threshold_", string(threshold), "__format_", format, "__line_", line_file, "__location_range_", string(first_location_of_range), "-", string(last_location_of_range), "__skip_", string(skip));
    mkdir(subfolder);
    current_data = data(i).value;

    if sum(sum(sum(isnan(current_data)))) > 0
        data_bg = isnan(current_data);
    else
        color_data_bg = current_data(2, round(size(current_data,2)/2), 1);

        current_data(1,:,:) = color_data_bg;
        current_data(end,:,:) = color_data_bg;
        current_data(:,1,:) = color_data_bg;
        current_data(:,end,:) = color_data_bg;

        data_bg = current_data == color_data_bg;
    end

    data_line = line;

    current_data = (current_data + threshold) / (2 * threshold);

    for loc = first_location_of_range:(skip+1):min(size(current_data,3), (last_location_of_range + ((last_location_of_range == 1) * size(current_data,3))))
        img = ind2rgb(im2uint8(current_data(:,:,size(current_data,3)+1-loc)), color_map);

        img_r = img(:,:,1);
        img_g = img(:,:,2);
        img_b = img(:,:,3);

        img_r(data_bg(:,:,size(current_data,3)+1-loc)) = 1;
        img_g(data_bg(:,:,size(current_data,3)+1-loc)) = 1;
        img_b(data_bg(:,:,size(current_data,3)+1-loc)) = 1;

        img_r(data_line(:,:,size(current_data,3)+1-loc)) = 0;
        img_g(data_line(:,:,size(current_data,3)+1-loc)) = 0;
        img_b(data_line(:,:,size(current_data,3)+1-loc)) = 0;

        img(:,:,1) = img_r;
        img(:,:,2) = img_g;
        img(:,:,3) = img_b;

        img_out = imrotate(img, 90);

        imwrite(img_out(:, 5:end-4, :), strcat(subfolder, "/", sprintf('%03d',loc),".", format));
    end

    scale_bar_R = color_map(:, 1);
    scale_bar_G = color_map(:, 2);
    scale_bar_B = color_map(:, 3);
    scale_ber = cat(3, reshape(scale_bar_R, 1, []), reshape(scale_bar_G, 1, []), reshape(scale_bar_B, 1, []));
    
    imwrite(scale_ber, strcat(strcat("../out/out_", normalization_method, "_", timestamp, "/scalebar__range_", string(-threshold), " - ", string(threshold), ".", format)));

end
