
function image = myResize(filename,scale,method)
I = imread(filename);
imshow(I);
figure;

[m,n,p] = size(I);

mnew = double(m*scale);
nnew = double(n*scale);

if strcmp(method,'nearest')
    % nearest method
 
for i = 1:mnew
    for j = 1:nnew
        for k = 1:p
            if i>scale
                tempi = floor(i/scale);
            else
                tempi = ceil (i/scale);
            end

            if j>scale
                tempj = floor(j/scale);
            else
                tempj = ceil(j/scale);
            end
       
            Inew(i,j,k) = I(tempi,tempj,k);
        end
    end
end

else   
    % bilinear method
        

tempI = I;
tempI = [I zeros(m,1,p)];
tempI = [tempI;zeros(1,n+1,p)];

for i = 1:mnew
    for j = 1:nnew
        for k = 1:p      

            tempi = floor(i/scale);
            tempj = floor(j/scale);
            u = 0;
            v = 0;
            
            if i>scale
                u = (i/scale) - floor(i/scale);
            else
                u = 0;
                tempi = 1;
            end

            if j>scale
                v = (j/scale) - floor(j/scale);
            else
                v = 0;
                tempj = 1;
            end

    % f(i+u,j+v) = (1-u)(1-v)f(i,j) + (1-u)vf(i,j+1) + u(1-v)f(i+1,j) + uvf(i+1,j+1)
           Inew(i,j,k) = (1-u)*(1-v) * tempI(tempi,tempj,k) + (1-u)*v * tempI(tempi,tempj+1,k) +u*(1-v) * tempI(tempi+1,tempj,k) + u*v * tempI(tempi+1,tempj+1,k);       
        end
    end
end
end

imshow(Inew);
