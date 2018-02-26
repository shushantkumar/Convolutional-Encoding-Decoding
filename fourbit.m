function ret = fourbit(dw)
% function to introduce 4 bit error in codeword

t=1;
[b a]=size(dw);

% first error generated
for i = 1:a
    temp = dw;
    if(dw(i)==0)
        temp(i)=1;
    else
        temp(i)=0;
    end 
    
% second error generated   
    for j = i+1:a
        temp2= temp;
        if(temp(j)==0)
        temp2(j)=1;
        elseif(temp(j)==1 )
        temp2(j)=0;
        end
        
     
% third error generated    
    for r = j+1:a
        temp3= temp2;
        if(temp2(r)==0)
        temp3(r)=1;
        elseif(temp2(r)==1 )
        temp3(r)=0;
        end
        
        
% fourth error generated
    for p = r+1:a
        k= temp3;
        if(temp3(p)==0)
        k(p)=1;
        ret(t,:)=k;
        t=t+1;
        elseif(temp3(p)==1)
        k(p)=0;
        ret(t,:)=k;
        t=t+1;
        end
    end
    end
    end
end
