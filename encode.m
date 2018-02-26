function res = encode(dw)
% function to encode input bit with the generating functions

% number of bits taken for calculating the codeword
k = 7;

% generating  functions (last bit assumed to be 0)
g1 = [1 1 0 1 0 1 0];   
g2 = [1 1 1 0 1 1 0];   

% shift register with input bit initial states
shiftreg = [0 0 0 0 0 0 0];

% iterator for codeword
j=1;

% travelling through the dataword
for i = dw
    
   % taking the input from dataword
   shiftreg(2:end) = shiftreg(1:end-1);
   shiftreg(1)=i;
   
   % loop for calculating the shiftreg * generating function
   for iter = 1:7
       w1(iter) = shiftreg(iter)*g1(iter);
       w2(iter) = shiftreg(iter)*g2(iter);
   end
   
    % calculating XOR of the elements after multiplying shiftreg and generating function
    temp1 =mod(sum(w1),2);
    temp2 =mod(sum(w2),2);
    
    % storing  the codeword generated
    res(j)=temp1;
    res(j+1)=temp2;
    j=j+2;
end

% this loop is for flushing the shift registers
for i = [0 0 0 0 0 0]
    
   % taking input from a empty vector
   shiftreg(2:end) = shiftreg(1:end-1);
   shiftreg(1)=i;
   
   % loop for calculating the shiftreg * generating function
   for iter = 1:7
       w1(iter) = shiftreg(iter)*g1(iter);
       w2(iter) = shiftreg(iter)*g2(iter);
 
   end
   
    % calculating XOR of the elements after multiplying shiftreg and generating function
    temp1 =mod(sum(w1),2);
    temp2 =mod(sum(w2),2);
    res(j)=temp1;
    
    % storing  the codeword generated
    res(j+1)=temp2;
    j=j+2;
end

