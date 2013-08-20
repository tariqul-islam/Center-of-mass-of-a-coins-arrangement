function y = dimIt(im,fac)
%DIMIT
%takes a greyscale image of double type
%and dims it by appropriate factor.
%
%calling method: dimIt(im,fac)
%
% im : Image matrix, type double
% fac : a factor by whch the image is dimmed
%       defaults to 0.5
%
% see also: halfIt, BS and its companion functions,

%written by
%Mohammad Tariqul Islam
%ponir.bd @ hotmail.com

    if nargin ==1 
        fac = 0.5;
    end
    y = 1-(1-im).*fac;
end