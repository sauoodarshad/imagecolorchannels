img = imread('shape.png');
figure;imshow(img);

fRed = img(:, :, 1);	
fGreen = img(:, :, 2);
fBlue = img(:, :, 3);

figure;histogram(img);
[counts,binLocations] = imhist(fRed);

valLeft = sum(counts(1:85)) ;
valMiddle =sum(counts(86:171));
valRight = sum(counts(171:255));

if valLeft>valMiddle
    if valLeft>valRight
        disp('LeftSke')
        disp('overdark')
        fRed=im2double(fRed); 
        r = 2*log(1+fRed);
        fGreen=im2double(fGreen);
        g = 2*log(1+fGreen);
        fBlue=im2double(fBlue);
        b = 2*log(1+fBlue);
        newImg = cat(3,r,g,b);
        figure;histogram(newImg);
        figure;imshow(newImg)
 
    end
end

if valRight>valMiddle
    if valRight>valLeft
        
        disp('RightSke')
        disp('OverBright')
        r = histeq(fRed);
        g = histeq(fGreen);
        b = histeq(fBlue);
        newImg = cat(3,r,g,b);
        figure;histogram(newImg);
        figure;imshow(newImg)

    end
end

if valMiddle>valLeft
    if valMiddle>valRight
        disp('MiddleSke')
        disp('LowContrast')
        r = imadjust(fRed);
        g = imadjust(fGreen);
        b = imadjust(fBlue);
        figure;histogram(newImg);
        newImg = cat(3,r,g,b);
        figure;imshow(newImg)
        
    end
end





