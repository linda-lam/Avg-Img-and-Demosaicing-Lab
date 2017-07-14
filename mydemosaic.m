function demosaic

I = im2double(imread('IMG_1308.pgm'));
figure(1); clf; imshow(I(1:500,1:500));
J = mydemosaic(I(1:500,1:500));
figure(2); clf; imshow(J);
imwrite(J, 'newimg.jpg');

function [J] = mydemosaic(image)
    input = im2double(image);
    A = size(input);   
    H = A(1);
    W = A(2);

    r=input.*repmat([1 0; 0 0], H/2, W/2);  
    g=input.*repmat([0 1; 1 0], H/2, W/2);  
    b=input.*repmat([0 0; 0 1], H/2, W/2);  
    gFilter = [0 1 0; 1 0 1; 0 1 0]/4;
    rbFilter = [1 0 1; 0 0 0; 1 0 1]/4;

    r = r + imfilter(r,rbFilter); 
    b = b + imfilter(b,rbFilter);
    r = r + imfilter(r,gFilter);
    g = g + imfilter(g,gFilter);
    b = b + imfilter(b,gFilter);
    
    J(:,:,1)=r; 
    J(:,:,2)=g; 
    J(:,:,3)=b; 
end
 
end
