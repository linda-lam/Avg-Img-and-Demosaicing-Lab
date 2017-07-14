avgImg = 0.0;

filelist = dir('set2/*.jpg');

for i=1:length(filelist)
    imname = ['set2/' filelist(i).name];
    nextim = im2double(imread(imname));
                   
    avgImg = avgImg + nextim; 
    % convert nextim to double and add it to your running average 
end

newImg = avgImg/length(filelist);
imwrite(newImg, 'newImg3.jpg');
imshow(newImg);