function y = xBS(im1,im2, val1,val2)
%XBS
%
%simple blue-Screen or chroma key function
%for greyscale images
%
%calling method: xBS(im1,im2,val1,val2)
%
%im1 and im2 are of same size,
%it cheks for the val1 value in im1
%and then replaces this value in im2 with val2
%
%Warning: It doesnot have through error checks
%
%See also: BS for a general approach, BS3 for
%RGB images

%Written by:
%Mohammad Tariqul Islam
%onir.bd @ hotmail.com
    s = size(im1);
    for i=1:s(1);
        for j=1:s(2)
            if im1(i,j)==val1
                im2(i,j)=val2;
            end
        end
    end
    
    y=im2;
end