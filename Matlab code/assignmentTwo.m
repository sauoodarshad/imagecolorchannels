img = imread('rgbone.tif');
[rows, columns, numberOfColorChannels] = size(img);
if numberOfColorChannels ~= 1
    fRed = img(:, :, 1);	
    fGreen = img(:, :, 2);
    fBlue = img(:, :, 3);
    answer = isequal(fRed,fGreen);
    maximum = max(fRed(:));
    if answer==1 && maximum > 2
    disp('Gray Scale Image');
    end
    if  maximum < 2
         disp('Black and white');
    end
    if answer==0
        disp('RGB Image');
    end
else
maximum = max(img(:));
end

if numberOfColorChannels == 1
    maximum = max(img(:));
    if  maximum < 2
         disp('Black and white');
    end
    
    if maximum > 2
        disp('grayscale');
    end
end
    




