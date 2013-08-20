function y = getCircle2(xCenter,yCenter,xRes,yRes,radius)
%GETCIRCLE2
%
%Outputs a binary image (although type double)
%of a circle of radius r and having center at (xCenter,yCenter)
%and resolution xRes x yRes
%
%Calling method: getCircle2(xCenter,yCenter,xRes,yRes,radius)
%
%see also: getCircle
%for different types of frequency filters check the
%filtes folder

%written by:
%Mohammad Tariul Islam
%ponir.bd @ hotmail.com

    y = ones(yRes,xRes);
    
    fi = round(check(yCenter-radius,yRes));
    ti = round(check(yCenter+radius,yRes));
    
    fj = round(check(xCenter-radius,xRes));
    tj = round(check(xCenter+radius,xRes));

    
    for i=fi:ti
        for j=fj:tj
            %gets the length from centre of the circle to the desires pixel
            z = sqrt((yCenter-i).^2 + (xCenter-j).^2);
            if z<=radius
                y(i,j) = 0;
            end
        end
    end
    
end


function z = check(f,max)
%checks whether the point f is within the limits
    if f<1
        z=1;
    elseif f>max
        z=max;
    else
        z=f;
    end
end