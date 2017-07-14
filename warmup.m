% PART 4
grayImg = imread('hydroflask.jpg'); % read image and save into grayImg var

image(grayImg); % display image on screen

grayImg = im2double(grayImg); % convert from uint8 to double

%an array A that contains the pixels in a 100x100 sub-region of your image 
A = grayImg((1:100),(1:100));

% 4a
x = sort(A,2);
x = reshape(A,[1,10000]);
figure, plot(sort(x));

% 4b.
figure, hist(A, 32);

% 4c.
newImg = A > 0.5;

% 4d.
newImg = newImg - mean(mean(A));
newImg(newImg<0)=0;
imshow(newImg);

% 4e. 
y = [1:6];
z = reshape(y, [3,2]);

% 4f.
x = find(A == min(min(A)), 1); % x is min value in A
r = find(min(A,[],2) == min(min(A)), 1); % r is row it occurs in
c = find(min(A) == min(min(A)), 1); % c is column it occurs in

% 4g.
v = [1 8 8 2 1 3 9 8];
uniqueNum = size(unique(v),2);

