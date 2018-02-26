function count = detection(dw)
% function to calculate number of cases where error can be detected

% dw is rows of codeword that this function receives

% matr gets all the states possible at any transition from function tabl
matr = tabl();

% storing initial state of shift registers
state = [0 0 0 0 0 0];

% count stores the number of times error is detected
count = 0;

[m, n]= size(dw);
n = n/2;

% j iterates through all the possible codewords as it receives
for j = 1 : m
% i iterates from 1 to n (n = 10 for 4bit dataword) transitions between atates through the trellis diagram
for i = 1: n
    % iter points to the specific row in the matr table for the current
    % state
    iter = bi2de(fliplr(state))+1;
    
    k1 = (2*i)-1;
    k2 = (2*i);
    
    % checking whether transition by taking path of input bit 0 
    if(matr(iter,1)==dw(j,k1) && matr(iter,2)==dw(j,k2))
        state(2:end)=state(1:end-1);
        state(1)=0;
        
    % checking whether transition by taking path of input bit 0 
    elseif(matr(iter,3)==dw(j,k1) && matr(iter,4)==dw(j,k2))
        state(2:end)=state(1:end-1);
        state(1)=1;
        
    % else since it does not have a path there is an error so increment
    % count
    else count = count + 1;
        break;
    end
end
end