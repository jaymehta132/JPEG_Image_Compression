# JPEG and ML-Based Image Compression

This repository contains the implementation of JPEG image compression algorithms for grayscale and color images, as well as an autoencoder-based image compression approach. The project was carried out as part of the **CS663 - Digital Image Processing** course under the guidance of Prof. Ajit Rajwade.

---

## Overview

### JPEG Compression
We implemented the JPEG compression algorithm for both grayscale and color images and compared the results with inbuilt implementations in MATLAB, OpenCV, and PIL. Key components of our implementation include:
- Discrete Cosine Transform (DCT)
- Quantization
- Huffman Encoding/Decoding

Metrics for comparison:
- **PSNR (Peak Signal-to-Noise Ratio)**
- **SSIM (Structural Similarity Index)**
- **MSE (Mean Squared Error)**
- **RMSE vs. BPP (Root Mean Squared Error vs. Bits Per Pixel)**

### ML-Based Compression
We also implemented an autoencoder to compress and reconstruct images from the MNIST Fashion dataset. Metrics like PSNR, SSIM, and MSE were used to evaluate the quality of compression for varying latent vector sizes.

---

## Dataset

The following datasets were used:
1. **CALTECH-BMP** - 1500 images of birds for JPEG compression.
2. **MNIST Fashion Dataset** - Used for autoencoder-based image compression.

---

## Results

### Grayscale JPEG Compression
- RMSE vs. BPP for 20 images.
- Comparison of inbuilt JPEG implementations (MATLAB, OpenCV, PIL).
- Analysis of SSIM and PSNR for high and low contrast images.

### Color JPEG Compression
- Implementation of JPEG for color images using YCbCr color space.
- Downsampling of chrominance channels and comparison of metrics.

### ML-Based Compression
- Autoencoder architecture for compression.
- Evaluation of image reconstruction with different latent vector sizes.

---

## Repository Structure

```plaintext                
├── AutoEncoders/                   
│   ├── AutoEncoders.ipynb      # Source code for Auto-Encoders
├── Colour/                   
│   ├── ColourJPEG.ipynb        # Source code for Colour JPEG Compression         
│   ├── README.txt              # Description of files            
│   ├── main.m
│   ├── process_and_compress.m
├── Greyscale/                   
│   ├── GreyScaleJPEG.ipynb     # Source code for Greyscale JPEG Compression    
│   ├── README.txt              # Description of files
│   ├── main.m
│   ├── process_and_compress.m
├── Report/                # Detailed project report (PDF)
│   ├── report.pdf
└── README.md              # Project description and instructions
```

## How to Run
1. Clone the repository
   ```bash
   git clone https://github.com/jaymehta132/JPEG_Image_Compression.git
   cd JPEG_Image_Compression
   ```
2. Run the JPEG Compression files

## Contributions
- **Adit Srivastava**: Autoencoder implementation, debugging, and evaluation.
- **Jay Mehta**: Huffman encoding and decoding for JPEG, debugging, and evaluation.
- **Tanay Bhat**: DCT and quantization for JPEG, debugging, and evaluation.

## Acknowledgements
We would like to thank Prof. Ajit Rajwade and Suyash for their guidance throughout the course.
