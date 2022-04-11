
%loop for number of item in folder times
for i = 1:50 
    folder = 'Long Sleeves'; %folder name
    filename = strcat('long',num2str(i));%name of image plus a rising number 
    
    clear data;
    
    %makes the path to the file
    Img3 = strcat('/Users/joelylin/Dropbox/Mac/Documents/MATLAB/data_set_grayscale/',folder, '/',filename,'.jpg');
    
    %reads the file into matlab
    Img=imread(Img3);
    
    %%makes all the values of the image doubles
    Img2 = double(Img);
    

    %reshape to one row and number of pixels in our image
    data = reshape(Img2,1,1960000);
    
    %vertically concatenates to the rest of the dataset
    dataset = [dataset;data];
end
