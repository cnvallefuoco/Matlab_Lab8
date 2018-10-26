function Cov=covVall(A)
% function to compute a Covarience matrix
% input: Mat
% output:Cov
[m,n]=size(A); % saves the size 100x60
B=A-repmat(mean(A),m,1);
% creates a matrix of the mean of columns in A 
% then subtracts that from the original A
Cov=(B'*B)/(m-1); 
% multiplies the transpose of B by B the normalizes
% it by dividing my its rows minus 1
end
