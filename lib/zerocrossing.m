function [] = zerocrossing(A)
   mark = zeros(size(A,1),size(A,2));
   for px = 2:(size(A,1)-1)
        for py = 2:(size(A,2)-1)
            tmp=A(px-1:px+1,py-1:py+1);
            if((sum(tmp,"all")~= 0)&&(sum(tmp,"all")~= 9))
                mark(px,py) = 1;
            end
        end
   end        
end

