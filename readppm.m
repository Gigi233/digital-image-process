% Read jpg file
jpg = imread('greens.jpg', 'jpg');
image(jpg);

% Convert jpg to ppm
imwrite(jpg, 'green.ppm', 'ppm');
ppm = imread('green.ppm');
figure, imshow(ppm);

myppm = readppm('green.ppm');
figure, imshow(myppm);

% Read ppm file, according to imread function
function [X, map, alpha] = readppm(filename)
% Verify that the file exists.
fid = fopen(filename, 'r');
    if (fid == -1)
        % Couldn't open using the given filename; 
        if ~isempty(dir(filename))
            error(message('MATLAB:imagesci:imread:fileReadPermission', filename));
        else
            error(message('MATLAB:imagesci:imread:fileDoesNotExist', filename));
        end
    end   
p = fread(fid, 1);
six = fread(fid, 1);
if (p ~= 80 || six ~= 54)
    input('Wrong format, press any key to exit');
    quit;
end

% space
sp = fread(fid, 1);
% Get the width
a = fread(fid, 1);
b = fread(fid, 1);
c = fread(fid, 1);
width = (a - '0') * 100 + (b - '0') * 10 + (c - '0');
% space
sp = fread(fid, 1);
% Get the height
a = fread(fid, 1);
b = fread(fid, 1);
c = fread(fid, 1);
height = (a - '0') * 100 + (b - '0') * 10 + (c - '0');
% Get color max combination
sp = fread(fid, 1);
a = fread(fid, 1);
b = fread(fid, 1);
c = fread(fid, 1);
color = (a - '0') * 100 + (b - '0') * 10 + (c - '0');
sp = fread(fid, 1);
% Store image into array
channels = 3;
[x, count] = fread(fid, width * height * channels);
count = 1;
% Turn array into 3D array
for i = 1:height
    for j = 1:width
        for k = 1:channels
            x(i, j, k) = uint8(x(count));
            count = count + 1;
        end
    end
end

end
