function Cor=corVall(A)
% function to compute a Correlation matrix
% input: Mat
% output:Cor
[m,n]=size(A); %saves the size 100x60
B=A-repmat(mean(A),m,1);
% creates a matrix of the mean of columns in A 
% then subtracts that from the original A
Cor=1/(m-1)*(B*diag(1./std(B)))'*(B*diag(1./std(B))); %creates the correlation matrix
end
