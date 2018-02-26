function ctr = decoding(dw,cw,p)
% function to calculate number of cases where error can be corrected

% dw is rows of codeword that this function receives
% cw is the dataword that this function receives
% p is the number of bits of dataword

% matr gets all the states possible at any transition from function tabl
matr = tabl();

% setting initial state 
state = [0 0 0 0 0 0];

% threshold value
thresh=5;

% count to keep check that number of guesses do not cross threshold
count = 1;

[m, n]= size(dw);
n = n/2;

% iterator indexing ret which stores the decoded dataword
j=0;

% iterator 'i' iterates from 1 to n (n = 10 for 4bit dataword) transitions between atates through the trellis diagram
i = 1;

% ctr is a counter that keeps track of number of times the decoded dataword is correct 
ctr=0;

% a iterates through all the possible codewords as it receives
for a = 1:m
    % setting state as [0 0 0 0 0 0] at for every new codeword
    state = [0 0 0 0 0 0];
    
    % z is a flag that is:-
    % 0 if at that ith layer there was no guess
    % 1 if at that ith layer there was a guess and the 0 input bit path is taken
    % 2 if at that ith layer there was a guess and the 1 input bit path is
    % taken
    z = zeros(1,n);
    
    % count to keep check that number of guesses do not cross threshold 
    count = 1;
    
    % iterator indexing ret which stores the decoded dataword
    j = 0;
    
    % iterator 'i' iterates from 1 to n (n = 10 for 4bit dataword) transitions between atates through the trellis diagram
    i = 1;
    
while i <=n
    % iter points to the specific row in the matr table  for the current
    % state
    iter = bi2de(fliplr(state(i,:)))+1;
    
    k1 = (2*i)-1;
    k2 = (2*i);
    
    % checking whether transition by taking path of input bit 0  
    % if possible then taking that path
    if(matr(iter,1)==dw(a,k1) && matr(iter,2)==dw(a,k2) && count <=thresh)
        
        % generating next state
        state(i+1,2:end)=state(i,1:end-1);
        state(i+1,1)=0;
        
        j = j +1;
        % updating the decoded dataword
        ret(j) = 0;
        
    % checking whether transition by taking path of input bit 0  
    % if possible then taking that path
    elseif(matr(iter,3)==dw(a,k1) && matr(iter,4)==dw(a,k2) && count<=thresh)
        
        % generating next state
        state(i+1,2:end)=state(i,1:end-1);
        state(i+1,1)=1;
        
        j = j +1;
        % updating the decoded dataword
        ret(j) = 1;
        
    % if above two condition fail then we need to take guess
    % this else statement is for guess sitiuaton
    else 
       
        % if count is less than threshold and ith layer flag is 0 then it
        % can take the guess to path 0 
        if count<=thresh && z(i)== 0
            
            % generating next state
            state(i+1,2:end)=state(i,1:end-1);
            state(i+1,1)=0;
            
            j = j + 1;
            % updating the decoded dataword
            ret(j)=0;
            z(i)=1;
            count = count + 1;
            
        % if count is more than thresh and still there is available path it
        % needs to backtrack 
        elseif count>thresh && z(i)==0
            i = i-2;        % changing state to previous
            j=j-1;          % changing decoded dataword to previous state 
            
        % if flag of ith layer is 1 that means it was a guess before which
        % took path 0, so now it needs to take path 1
        elseif z(i)==1
            
            % generating next state
            state(i+1,2:end)=state(i,1:end-1);
            state(i+1,1)=1; 
            
            j=j+1;
            ret(j)=1;
            % updating the decoded dataword
            z(i)=2;
            count = count - 1;
            
        % if flag of ith layer is 2 that means both the path are exhausted
        % and it needs to backtrack 
        elseif z(i)==2
            i = i-2;        % changing state to previous
            j=j-1;          % changing decoded dataword to previous state 
        end
    end
    i= i+1;

end

 % check flag to check any differences in actual and decoded dataword
 check=0;
 for k = 1:p
    if(cw(k)~=ret(k))
        check=1;
    end  
 end  
 if(check == 0)
     % if they match then increase ctr counter
     ctr= ctr+1;
 end
end


