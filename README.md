# Image-Filtering-and-Hybrid-Images
## **General Description**
This repository presents is an image convolution function (image filtering) used it to create hybrid images. The technique was invented by Oliva, Torralba, and Schyns in 2006, and published in a paper at SIGGRAPH. High frequency image content tends to dominate perception but, at a distance, only low frequency (smooth) content is perceived. By blending high and low frequency content, we can create a hybrid image that is perceived differently at different distances. This project is in a computer vision course. 

## **Folders Description**
**1- The matlab scripts is the folder contains:**
1. my_imfilter = Function that does filtering through convolution.    
2. proj1_test_filtering = Test cases with same applied filters.     
3. gen_hybrid_image= The written function for the hybrid images.    
4. vis_hybrid_image= Function for visualizing the output of hybrid images in different scales.    
5. Proj1 = The script that outputs the hybrid images (low or high frequencies, the hybrid image, and the different scales).   

**2- The attached images with the projects is in a folder called raw_data**  

**3- The outputs folder contains the following**    
1. The output of the dog photo when it was input to the proj1_test_filtering Code.    
2. The output of the hybrid photos.      
 
    
## **Algorithm**

**1. Filtering by Convolution**
  1. Get the sizes of the original image and the filter.    
  2. If the filter is even, return an error message.    
  3. Find the central pixel.  
  4. Find the number of columns and rows to be padded to the image (by subtracting one from the central row and column).    
  5. Padding rows and columns to the image with zeros or with mirroring the borders.    
  6. Iterate through every pixel and do as follows  
    1. Start with the central pixel of the kernel over the first pixel in the original image (without the padded ones).    
    2. Multiply every element of the kernel by its corresponding ones in the padded image.   
    3. Add all the elements in the kernel.   
    4. Store the new element in a new image without the padded pixels.   
		
**2. Hybrid images**
  1. Find the low frequencies in the first image using the coded filter in step 1. The filter is Gaussian filter with Gaussian filter with variable cutoff frequencies.  
  2. Find the high frequencies in the second image by subtracting the low frequencies image (blurred) from the original image using the same filter with the same threshold.   
	3. Add the two images.  
