function [mark] = zerocrossing(A)
% This function returns the image marked with pixel values 1 where a
% zero-crossing is detected
%Inputs : 
%    A : image matrix
%Outputs :
%    mark : output matrix of same size as image
   
   a = padarray(A,[1,1],0);
   b = padarray(A,[1,1],1);
   mark = zeros(size(a,1),size(a,2));

   I1 = conv2(a,[0,1,0;1,1,1;0,1,0],'same');
   I2 = conv2(b,[0,1,0;1,1,1;0,1,0],'same');
  
   mark(I1~=0 & I2~=5) = 1;
   mark = mark(2:size(mark)-1,2:size(mark)-1);

end

