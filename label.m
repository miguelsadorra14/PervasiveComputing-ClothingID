%makes imagestore of the whole folder including subfolders 
%makes label array one cell filled with the name of the folder an image is
%in. in alphabetical order
imds = imageDatastore ('data_set_grayscale', 'includeSubfolders',1,'LabelSource', 'foldernames')

%counts the number of item in each folder
NPerFolder = countEachLabel (imds)

%total number of items in dataset
TotalN = length (imds.Files)

