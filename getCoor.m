function [y, f] = getCoor()
%GETCOOR
%gets the co-ordinates of the coins
%
%Read at your own risk.
%I myself get lost in it
%
%Written By:
%Mohammad Tariqul Islam
%ponir.bd @ hotmail.com

%constants and variables
    %centre of the first coin
    XC = 610;
    YC = 950;
    %difference between two lines
    IN = 700;
    %diameter of a coin
    D = 200;
    
    %variables
    xc = XC;
    yc = YC;
    
    %keppeing track of index of x and y for easy insertion
    indexy = 1;
    indexf = 1;
    
    %inserts a co-ordinates of a coin in the array
    function indexyin()
        y(indexy,:) = [xc, yc, indexf*5];
        indexy=indexy+1;        
    end
    
    %inserts an array of co-ordinates in coin
    %all the coins are in a line
    function do1(x)
        for i=1:x
            indexyin();
            yc = yc - D;
        end
    end

    %inserts two lines of coins
    function dox1(x,cut)
        xc = XC;
        yc = YC-cut;
        do1(x);

        xc = XC+IN;
        yc = YC-cut;
        do1(x);
    end
    
    %inserts a layer no in the f array
    function indexfin()
        f(indexf) = indexy;
        indexf = indexf+1;
    end
    
    %inserts two layes consisting of lines only
    function do2(x)
       dox1(x,0); 
       indexfin();
       dox1(x,D/2);
       indexfin();
    end

    %inserts one layer of coins and another one
    %at a certain symmetric co-ordinates
    function do3(x,cut,df,mf,add, cut2)
        if nargin == 5
            cut2=cut;
        end
        dox1(x,cut2);
        xc = XC+D/df;
        yc = YC-cut-mf*D+add;
        indexyin();
        xc = XC+IN-D/df;
        yc = YC-cut-mf*D+add;
        indexyin();
        
    end
    
    %assigns two coins at a certain symmetric co-or
    function do4(df,mf,add)
        xc=XC+D*df;
        yc = YC - mf*D+add;
        indexyin();
        xc=XC+IN-D*df;
        yc = YC - mf*D+add;
        indexyin();
    end

    %combines do3 and do4 for higher layers
    function do5(x,cut)
        if nargin==1
            cut=0;
        end
        do3(x,0,6,3,2,cut);
        do4(3/4,4,38);
    end

    %same as do5
    function do6(x,cut)
        if nargin==1
            cut = D/2;
        end
        do3(x,D/2,4,3,8,cut);
        do4(1.25,4,38);
    end

    %inserts one coin at the middle
    function do7()
        xc = XC+IN/2;
        yc = YC-4*D+38;
        indexyin(); 
    end

    %building the co-ordinates using the
    %building blocks written above
    
    %layer 1-2
    do2(3);
    %layer3-4
    do2(3);
    
    %layer 5
    do3(3,0,6,3,2);
    indexfin();
    %layer 6
    do3(3,D/2,2,3,25);
    indexfin();
    
    %layer 7
    do5(3);
    indexfin();
    
    %layer 8
    do6(3);
    indexfin();
    
    %layer 9
    do5(3);
    do7();
    indexfin();
    
    %layer 10
    do6(3);
    indexfin();
    
    %layer 11
    do5(2,D);
    do7();
    indexfin();
    
    %layer 12
    do3(2,D/2,4,3,8,D+D/2);
    indexfin();
    
    %layer 13
    do3(1,0,6,3,2,2*D);
    indexfin();
    
    %layer 14
    dox1(1,2*D+D/2);
    indexfin();
end