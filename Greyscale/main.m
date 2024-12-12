% Define the paths for input images and output directories
input_images = ["C:\Users\hp\Desktop\CS663\Project Greyscale\caltech_greyscale\caltech_greyscale\C0001.bmp";
                "C:\Users\hp\Desktop\CS663\Project Greyscale\caltech_greyscale\caltech_greyscale\C0002.bmp";
                "C:\Users\hp\Desktop\CS663\Project Greyscale\caltech_greyscale\caltech_greyscale\C0003.bmp";
                "C:\Users\hp\Desktop\CS663\Project Greyscale\caltech_greyscale\caltech_greyscale\C0004.bmp";
                "C:\Users\hp\Desktop\CS663\Project Greyscale\caltech_greyscale\caltech_greyscale\C0005.bmp";
                "C:\Users\hp\Desktop\CS663\Project Greyscale\caltech_greyscale\caltech_greyscale\C0006.bmp";
                "C:\Users\hp\Desktop\CS663\Project Greyscale\caltech_greyscale\caltech_greyscale\C0007.bmp";
                "C:\Users\hp\Desktop\CS663\Project Greyscale\caltech_greyscale\caltech_greyscale\C0008.bmp";
                "C:\Users\hp\Desktop\CS663\Project Greyscale\caltech_greyscale\caltech_greyscale\C0009.bmp";
                "C:\Users\hp\Desktop\CS663\Project Greyscale\caltech_greyscale\caltech_greyscale\C0010.bmp";
                "C:\Users\hp\Desktop\CS663\Project Greyscale\caltech_greyscale\caltech_greyscale\C0011.bmp";
                "C:\Users\hp\Desktop\CS663\Project Greyscale\caltech_greyscale\caltech_greyscale\C0012.bmp";
                "C:\Users\hp\Desktop\CS663\Project Greyscale\caltech_greyscale\caltech_greyscale\C0013.bmp";
                "C:\Users\hp\Desktop\CS663\Project Greyscale\caltech_greyscale\caltech_greyscale\C0014.bmp";
                "C:\Users\hp\Desktop\CS663\Project Greyscale\caltech_greyscale\caltech_greyscale\C0015.bmp";
                "C:\Users\hp\Desktop\CS663\Project Greyscale\caltech_greyscale\caltech_greyscale\C0016.bmp";
                "C:\Users\hp\Desktop\CS663\Project Greyscale\caltech_greyscale\caltech_greyscale\C0017.bmp";
                "C:\Users\hp\Desktop\CS663\Project Greyscale\caltech_greyscale\caltech_greyscale\C0018.bmp";
                "C:\Users\hp\Desktop\CS663\Project Greyscale\caltech_greyscale\caltech_greyscale\C0019.bmp";
                "C:\Users\hp\Desktop\CS663\Project Greyscale\caltech_greyscale\caltech_greyscale\C0020.bmp"];

metrics_dir = "metrics_matlab";
compressed_images_dir = "compressed_images";

% Ensure the output directories exist
if ~exist(metrics_dir, 'dir')
    mkdir(metrics_dir);
end
if ~exist(compressed_images_dir, 'dir')
    mkdir(compressed_images_dir);
end

% Loop through each image
for i = 1:length(input_images)
    image_path = input_images(i);
    metrics_filename = fullfile(metrics_dir, sprintf("metrics_%d.txt", i));
    compressed_dir = fullfile(compressed_images_dir, sprintf("image_%d", i));
    
    % Ensure subdirectory for compressed images exists
    if ~exist(compressed_dir, 'dir')
        mkdir(compressed_dir);
    end

    % Call the function
    process_and_compress(image_path, metrics_filename, compressed_dir);
end