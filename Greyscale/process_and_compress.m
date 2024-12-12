function process_and_compress(image_path, metrics_filename, compressed_dir)
    % Read the original image
    original_image = imread(image_path);
    if size(original_image, 3) == 3
        original_image = rgb2gray(original_image); % Convert to grayscale
    end

    % Quality levels to test
    start_val = 1; 
    end_val = 100;
    step = 1;
    quality_levels = start_val:step:end_val;

    % Get image size and pixel count
    [height, width] = size(original_image);
    total_pixels = height * width;

    % Initialize arrays to store results
    ssim_values = zeros(size(quality_levels));
    mse_values = zeros(size(quality_levels));
    rmse_values = zeros(size(quality_levels));
    psnr_values = zeros(size(quality_levels));
    compression_ratios = zeros(size(quality_levels));
    bpp_values = zeros(size(quality_levels));

    % Loop through each quality level
    for i = 1:length(quality_levels)
        quality = quality_levels(i);

        % Compress image with specified quality
        compressed_filename = fullfile(compressed_dir, sprintf("quality_%d.jpg", quality));
        imwrite(original_image, compressed_filename, 'jpg', 'Quality', quality);

        % Read the compressed image
        compressed_image = imread(compressed_filename);
        if size(compressed_image, 3) == 3
            compressed_image = rgb2gray(compressed_image); % Ensure grayscale
        end

        % Calculate SSIM
        ssim_values(i) = ssim(compressed_image, original_image);

        % Calculate MSE and RMSE
        mse_values(i) = immse(compressed_image, original_image);
        rmse_values(i) = sqrt(mse_values(i));

        % Calculate PSNR
        psnr_values(i) = psnr(compressed_image, original_image);

        % Calculate compression ratio
        original_size = numel(original_image); % in bytes
        compressed_info = dir(compressed_filename);
        compressed_size = compressed_info.bytes;
        compression_ratios(i) = original_size / compressed_size;

        % Calculate BPP (bits per pixel)
        bpp_values(i) = (compressed_size * 8) / total_pixels;
    end

    % Store results in a table
    results_table = table(quality_levels', ssim_values', mse_values', rmse_values', psnr_values', compression_ratios', bpp_values', ...
        'VariableNames', {'Quality', 'SSIM', 'MSE', 'RMSE', 'PSNR', 'CompressionRatio', 'BPP'});

    % Write data to file
    fileID = fopen(metrics_filename, 'w');
    fprintf(fileID, '%s\t%s\t%s\t%s\t%s\t%s\t%s\n', 'Quality', 'SSIM', 'MSE', 'RMSE', 'PSNR', 'CompressionRatio', 'BPP');
    for i = 1:100
        row_data = table2array(results_table(i, :));
        fprintf(fileID, '%d\t%.4f\t%.4f\t%.4f\t%.4f\t%.4f\t%.4f\n', row_data);
    end
    fclose(fileID);

    disp(['Metrics saved to ', metrics_filename]);
end
