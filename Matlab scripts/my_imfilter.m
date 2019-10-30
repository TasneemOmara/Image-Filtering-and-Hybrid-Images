function output = my_imfilter(image, filter)
% This function is intended to behave like the built in function imfilter()
% when operating in convolution mode. See 'help imfilter'. 
% While "correlation" and "convolution" are both called filtering, 
% there is a difference. From 'help filter2':
%    2-D correlation is related to 2-D convolution by a 180 degree rotation
%    of the filter matrix.

% Your function should meet the requirements laid out on the project webpage.

% Boundary handling can be tricky as the filter can't be centered on pixels
% at the image boundary without parts of the filter being out of bounds. If
% we look at 'help imfilter', we see that there are several options to deal 
% with boundaries. 
% Please recreate the default behavior of imfilter:
% to pad the input image with zeros, and return a filtered image which matches 
% the input image resolution. 
% A better approach is to mirror or reflect the image content in the padding.

% Uncomment to call imfilter to see the desired behavior.
% output = imfilter(image, filter, 'conv');

%%%%%%%%%%%%%%%%
% Your code here
%%%%%%%%%%%%%%%%

%%

%Getting the sizes of the image and the filter
[ri,ci,di]=size(image);
[r,c]= size(filter);

%the error message if the filter is even
if rem((r*c),2)==0
    fprintf('ERROR! The filter size is even, the output is undefined')
else
    
%Finding the central pixel of the filter
Cr = ceil(r/2); Cc= ceil(c/2);

%Finding the number of rows and columns need to be padded
pr=Cr-1; pc=Cc-1;

%padding the image with zeros, the rows and the columns are equal
% to the rows over the center pixel and the columns left to the center
% pixel 
%image=padarray(image,[pr,pc],0,'both');

%Padding the image with mirroring the borders, uncomment to try
image=padarray(image,[pr,pc],'symmetric','both');

%Iterating for every pixel in 3D starting, the image is padded with either
%zero pixels or mirrior to the borders. The indices starts from the first
%pixel in the image itself on the padded image
for i=1:1:ri
    for k=1:1:ci
        for j=1:1:di
        % summing the whole matrix after the elementwise multiplication
        % with the filter 
        output(i,k,j)= sum(reshape((filter .* image(i:r+i-1,k:c+k-1,j)),[1,r*c]));
        end 
    end 
end
end 
end





