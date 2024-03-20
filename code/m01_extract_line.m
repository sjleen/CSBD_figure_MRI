clear

cd('../rawdata/');
file_list = dir('*.nii');

data = niftiread(file_list(1).name);
data = data == min(min(min(data)));
line = data;

for i = 2:length(file_list)
    data = niftiread(file_list(i).name);
    data = data == min(min(min(data)));
    line = line & data;
end

cd('../code');

save("../mat/line_extracted.mat", "line");

clear