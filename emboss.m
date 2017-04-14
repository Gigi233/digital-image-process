img = imread('Lena.jpg');
size_info = size(img);
height = size_info(1);
width = size_info(2);
imshow(img);

% vertical
imgv = zeros(height, width, 3);
for i=2:height-1
    for j=2:width-1
        imgv(i,j,:) = double(img(i-1,j-1,:))-double(img(i-1,j+1,:))+4*double(img(i,j-1,:))-4*double(img(i,j+1,:))+double(img(i+1,j-1,:))-double(img(i+1, j+1,:))+128;
    end
end

figure('name', 'vertical: rgb','numbertitle','off');
imshow(imgv);
vgray = rgb2gray(imgv);
figure('name', 'vertical: gray','numbertitle','off');
imshow(vgray);

% horizontal
imgh = zeros(height, width, 3);
for i=2:height-1
    for j=2:width-1
        imgh(i,j,:) = -double(img(i-1,j-1,:))-4*double(img(i-1,j,:))-double(img(i-1,j+1,:))+double(img(i+1,j-1,:))+4*double(img(i+1,j,:))+double(img(i+1,j+1,:))+128;
    end
end
figure('name', 'horizontal: rgb','numbertitle','off');
imshow(imgh);
hgray = rgb2gray(imgh);
figure('name', 'horizontal: gray','numbertitle','off');
imshow(hgray);

% 45 degree
img45 = zeros(height, width, 3);
for i=2:height-1
    for j=2:width-1
        img45(i,j,:)=4*double(img(i+1,j-1,:))+double(img(i,j-1,:))+double(img(i+1,j,:))-double(img(i-1,j,:))-double(img(i,j+1,:))-4*double(img(i-1,j+1,:))+128;
    end
end
figure('name', '45 degree: rgb','numbertitle','off');
imshow(img45);
gray45 = rgb2gray(img45);
figure('name', '45 degree: gray','numbertitle','off');
imshow(gray45);

% 135 degree
img135 = zeros(height, width, 3);
for i=2:height-1
    for j=2:width-1
        img135(i,j,:)=4*double(img(i-1,j-1,:))+double(img(i-1,j,:))+double(img(i,j-1,:))-double(img(i,j+1,:))-double(img(i+1,j,:))-4*double(img(i+1,j+1,:))+128;
    end
end
figure('name', '135 degree: rgb','numbertitle','off');
imshow(img135);
gray = rgb2gray(img135);
figure('name', '135 degree: gray','numbertitle','off');
imshow(gray);
