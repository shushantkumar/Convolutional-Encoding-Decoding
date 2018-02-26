function res = threebit(dw)
% function to introduce 3 bit error in codeword

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
    for j = i+1:b
        temp2= temp;
        if(temp(j)==0)
        temp2(j)=1;
        elseif(temp(j)==1 )
        temp2(j)=0;
        end
      
% third error generated              
    for p = j+1:b
        k= temp2;
        if(temp2(p)==0)
        k(p)=1;
        res(t,:)=k;
        t=t+1;
        elseif(temp2(p)==1)
        k(p)=0;
        res(t,:)=k;
        t=t+1;
        end
    end
    
    end
end

