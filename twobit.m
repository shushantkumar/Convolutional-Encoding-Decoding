function res = twobit(dw)
% function to introduce 2 bit error in codeword

[a b]=size(dw);
t=1;

% first error generated
for i = 1:b
    temp = dw;
    if(dw(i)==0)
        temp(i)=1;
    else
        temp(i)=0;
    end 
    
% second error generated
    for j = i:b
        k= temp;
        if(temp(j)==0 & i~=j)
        k(j)=1;
        res(t,:)=k;
        t=t+1;
        elseif(temp(j)==1 & i~=j)
        k(j)=0;
        res(t,:)=k;
        t=t+1;
    end
              
    end
end
