function correct = ex(p)
% This is the main function which takes number of bits in dataword as input
% and returns the percentage of errors detected and corrected

% z = Total possible p-bits numbers for the dataword (4-bit here)
z = 2^p;

% mat = generating all possible words of p-bits (4-bit here)
mat = fliplr(de2bi((0:z-1)'));
[a b]=size(mat);

% ret = encoding each dataword 
% the ret stores z * 20 matrix with each 
for i = 1:a
    ret (i,:)=encode(mat(i,1:b));
end

% loop to calculate the percentage of error detection
for i = 1:z
    %generating all 1 bit error 
    temp = onebit(ret(i,:));        
    [m n]=size(temp);
    %percentage detecting all 1 bit errors
    detect(i,1)= ((detection(temp))./m)*100;
    %percentage correcting all 1 bit errors
    correct(i,1)=(decoding(temp,mat(i,:),p)./m)*100;
    
    %generating all 2 bit error 
    temp = twobit(ret(i,:));
    [m n]=size(temp);
    %percentage detecting all 2 bit errors
    detect(i,2)= ((detection(temp))./m)*100;
    %percentage correcting all 2 bit errors
    correct(i,2)=(decoding(temp,mat(i,:),p)./m)*100;
    
    %generating all 3 bit error 
    temp = threebit(ret(i,:));
    [m n]=size(temp);
    %percentage detecting all 3 bit errors
    detect(i,3)= ((detection(temp))./m)*100;
    %percentage correcting all 3 bit errors
    correct(i,3)=(decoding(temp,mat(i,:),p)./m)*100;
    
    %generating all 4 bit error 
    temp = fourbit(ret(i,:));
    [m n]=size(temp);
    %percentage detecting all 4 bit errors
    detect(i,4)= ((detection(temp))./m)*100;
    %percentage correcting all 4 bit errors
    correct(i,4)=(decoding(temp,mat(i,:),p)./m)*100;
    
    %generating all 5 bit error 
    temp = fivebit(ret(i,:));
    [m n]=size(temp);
    %percentage detecting all 5 bit errors
    detect(i,5)= ((detection(temp))./m)*100;
    %percentage correcting all 5 bit errors
    correct(i,5)=(decoding(temp,mat(i,:),p)./m)*100;
end



% printing the error detection percentage for each possible p-bit dataword (4-bit here)
detect

% printing the error correction percentage for each possible p-bit dataword (4-bit here)
correct

% calculating the average detection for p-bit dataword (4-bit here)
detect_aver = sum(detect)./16

% calculating the average correction for p-bit dataword (4-bit here)
correction = sum(correct)./16

[x y] = size(correction);

% combining both percentage detection and correction for plotting the graph
for  i = 1:y
    plotter(i,1) = detect_aver(i);
    plotter(i,2) = correction(i);
end

% plotting a bar graph for the required data
bar(plotter,0.8)

% uncomment below statement to get a 3D bar graph for all possible
% combinations separately for p-bit dataword
% bar3 = ([1 2 3 4 5],detect)
% bar3 = ([1 2 3 4 5],correct)

    
    
    
    
    
    
    
    
    
    