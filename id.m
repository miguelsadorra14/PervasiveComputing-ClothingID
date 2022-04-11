%take picture
vid = webcam;
pause(3);
img = vid.snapshot;
imshow(img);

%reformat picture to 1400 by 1400
img = imresize(img, [1400 1400]);

%id colour
%insert image from camera
imshow(img);
u = impixel(img,700, 700) %read pixel from certain point

a = u(1,1) %Red Layer of pixel
b = u(1,2) %Green Layer of pixel
c = u(1,3) %Blue Layer of pixel

%conditional statements for colors
%BLACK
if (a < 40 && b < 40 && c < 40)
   color = "Black";

%WHITE
elseif (a > 230 && b > 230 && c > 230)
   color = "White";

%RED
elseif (a > 90 && b < 95 && c < 90)
   color = "Red";

%PINK
elseif (a > 248 && b > 130 && b < 210  && c < 210 && c > 140)
   color = "Pink";

%ORANGE
elseif (a > 172 && b > 90 && b < 180 && c < 130)
   color = "Orange";

%GREEN
elseif (a < 160 && b > 80 && c < 140)
   color = "Green";

%YELLOW
elseif (a > 245 && b > 200 && c < 200)
   color = "Yellow";

%BLUE
elseif (a < 80 && b < 240 && c > 80)
   color = "Blue";

%VIOLET
elseif (a > 80 && a < 245 && b < 140 && c > 80)
   color = "Violet";
  
else
   system("say error");
end

%greyscale picture
img_grayscale = rgb2gray(img);

%id item
img_grayscale = double(img_grayscale); %makes all the values of the image doubles
test_img = reshape(img_grayscale,1,1960000); %reshape to one row and number of pixels in our image
test_img = test_img'; %switch x- and y-axis

test_output = net (test_img); %puts image into neural network

[max_value,item] = max(test_output); %sees what the item most probably is out of the 5

if item == 1
   category = "T-Shirt";
  
elseif item == 2
       category = "Tanktop";
      
elseif item == 3
       category = "Skirt";
      
elseif item == 4
       category = "Pants";
      
elseif item == 5
       category = "Long sleeves";

end

%speak results out loud

command = strcat('say' , {' '}, color, category);
msg = strcat(color, " ", category);
msgbox(msg);
system(command);

delete(vid); %delete image