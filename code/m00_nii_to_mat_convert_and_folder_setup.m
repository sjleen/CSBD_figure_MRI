clear

% EDIT %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

data_wt_m = niftiread('../rawdata/WTM-CBF(ml-100g-min).nii');
data_ht_m = niftiread('../rawdata/HTM-CBF(ml-100g-min).nii');
data_ko_m = niftiread('../rawdata/KTM-CBF(ml-100g-min).nii');
data_wt_f = niftiread('../rawdata/WTF-CBF(ml-100g-min).nii');
data_ht_f = niftiread('../rawdata/HTF-CBF(ml-100g-min).nii');
data_ko_f = niftiread('../rawdata/KTF-CBF(ml-100g-min).nii');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

disp("complete: data loading")

data_wt_m(data_wt_m == data_wt_m(5,5,5)) = NaN;
data_ht_m(data_ht_m == data_ht_m(5,5,5)) = NaN;
data_ko_m(data_ko_m == data_ko_m(5,5,5)) = NaN;
data_wt_f(data_wt_f == data_wt_f(5,5,5)) = NaN;
data_ht_f(data_ht_f == data_ht_f(5,5,5)) = NaN;
data_ko_f(data_ko_f == data_ko_f(5,5,5)) = NaN;

disp("complete: background to NaN")

data_wt_m(data_wt_m <= 0) = NaN;
data_ht_m(data_ht_m <= 0) = NaN;
data_ko_m(data_ko_m <= 0) = NaN;
data_wt_f(data_wt_f <= 0) = NaN;
data_ht_f(data_ht_f <= 0) = NaN;
data_ko_f(data_ko_f <= 0) = NaN;

disp("complete: negative values to NaN")

data_div_log2_ht_m_div_by_wt_m = log2(data_ht_m ./ data_wt_m);
data_div_log2_ko_m_div_by_wt_m = log2(data_ko_m ./ data_wt_m);
data_div_log2_ht_f_div_by_wt_f = log2(data_ht_f ./ data_wt_f);
data_div_log2_ko_f_div_by_wt_f = log2(data_ko_f ./ data_wt_f);
data_div_log2_wt_m_div_by_wt_f = log2(data_wt_m ./ data_wt_f);
data_div_log2_ht_m_div_by_ht_f = log2(data_ht_m ./ data_ht_f);
data_div_log2_ko_m_div_by_ko_f = log2(data_ko_m ./ data_ko_f);
data_div_log2_wt_f_div_by_wt_m = log2(data_wt_f ./ data_wt_m);
data_div_log2_ht_f_div_by_ht_m = log2(data_ht_f ./ data_ht_m);
data_div_log2_ko_f_div_by_ko_m = log2(data_ko_f ./ data_ko_m);

disp("complete: fold change calculation")

data(1).name = 'data_wt_m';
data(2).name = 'data_ht_m';
data(3).name = 'data_ko_m';
data(4).name = 'data_wt_f';
data(5).name = 'data_ht_f';
data(6).name = 'data_ko_f';
data(7).name = 'data_div_log2_ht_m_div_by_wt_m';
data(8).name = 'data_div_log2_ko_m_div_by_wt_m';
data(9).name = 'data_div_log2_ht_f_div_by_wt_f';
data(10).name = 'data_div_log2_ko_f_div_by_wt_f';
data(11).name = 'data_div_log2_wt_m_div_by_wt_f';
data(12).name = 'data_div_log2_ht_m_div_by_ht_f';
data(13).name = 'data_div_log2_ko_m_div_by_ko_f';
data(14).name = 'data_div_log2_wt_f_div_by_wt_m';
data(15).name = 'data_div_log2_ht_f_div_by_ht_m';
data(16).name = 'data_div_log2_ko_f_div_by_ko_m';

data(1).experimental_value = 'data_wt_m';
data(2).experimental_value = 'data_ht_m';
data(3).experimental_value = 'data_ko_m';
data(4).experimental_value = 'data_wt_f';
data(5).experimental_value = 'data_ht_f';
data(6).experimental_value = 'data_ko_f';
data(7).experimental_value = 'data_ht_m';
data(8).experimental_value = 'data_ko_m';
data(9).experimental_value = 'data_ht_f';
data(10).experimental_value = 'data_ko_f';
data(11).experimental_value = 'data_wt_m';
data(12).experimental_value = 'data_ht_m';
data(13).experimental_value = 'data_ko_m';
data(14).experimental_value = 'data_wt_f';
data(15).experimental_value = 'data_ht_f';
data(16).experimental_value = 'data_ko_f';

data(1).control_value = '.';
data(2).control_value = '.';
data(3).control_value = '.';
data(4).control_value = '.';
data(5).control_value = '.';
data(6).control_value = '.';
data(7).control_value = 'data_wt_m';
data(8).control_value = 'data_wt_m';
data(9).control_value = 'data_wt_f';
data(10).control_value = 'data_wt_f';
data(11).control_value = 'data_wt_f';
data(12).control_value = 'data_ht_f';
data(13).control_value = 'data_ko_f';
data(14).control_value = 'data_wt_m';
data(15).control_value = 'data_ht_m';
data(16).control_value = 'data_ko_m';

data(1).normalization_method = '.';
data(2).normalization_method = '.';
data(3).normalization_method = '.';
data(4).normalization_method = '.';
data(5).normalization_method = '.';
data(6).normalization_method = '.';
data(7).normalization_method = 'div_log2';
data(8).normalization_method = 'div_log2';
data(9).normalization_method = 'div_log2';
data(10).normalization_method = 'div_log2';
data(11).normalization_method = 'div_log2';
data(12).normalization_method = 'div_log2';
data(13).normalization_method = 'div_log2';
data(14).normalization_method = 'div_log2';
data(15).normalization_method = 'div_log2';
data(16).normalization_method = 'div_log2';

disp("complete: data structure labeling")

data(1).value = data_wt_m;
data(2).value = data_ht_m;
data(3).value = data_ko_m;
data(4).value = data_wt_f;
data(5).value = data_ht_f;
data(6).value = data_ko_f;
data(7).value = data_div_log2_ht_m_div_by_wt_m;
data(8).value = data_div_log2_ko_m_div_by_wt_m;
data(9).value = data_div_log2_ht_f_div_by_wt_f;
data(10).value = data_div_log2_ko_f_div_by_wt_f;
data(11).value = data_div_log2_wt_m_div_by_wt_f;
data(12).value = data_div_log2_ht_m_div_by_ht_f;
data(13).value = data_div_log2_ko_m_div_by_ko_f;
data(14).value = data_div_log2_wt_f_div_by_wt_m;
data(15).value = data_div_log2_ht_f_div_by_ht_m;
data(16).value = data_div_log2_ko_f_div_by_ko_m;

disp("complete: data structure making")

if(~exist("../mat", "dir"))
    mkdir("../mat");
end

if(~exist("../out", "dir"))
    mkdir("../out");
end

disp("complete: folder setup")

save("../mat/data_struct.mat", "data", '-v7.3');

disp("complete: data structure saving")

clear data;
save("../mat/data.mat", '-v7.3');

disp("complete: data matrix saving")

clear


disp("complete code.")
