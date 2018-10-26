%% HW8
% This is Carina Vallefuoco's Homework 8.
%% Problem 1 
% Below we have an image of the covariance matrix and the correlation
% matrix based on movie data. The data looks symmetric because if two
% movies are highly related to each other then the that comparison is
% going to be the same correlation and covariance which ever way you 
% look at it. That is why the there is symmetry from each midpoint of 
% where each movie relation meets.
%
% We can see the largest covariance is between new love and found love. We
% can also see that the largest correlation is between new love and found
% love as well.

Mat=importdata('movData.csv',',',1); %imports the data
A=Mat.data(:,:);%takes off the headers
Cov=covVall(A); %calls the covarience function
Cor=corVall(A); %calls the correlation function
subplot(1,2,1),imagesc(Cov),title('Covariance'); %displays the covariance image
colormap jet %displays the image in jet colors
colorbar %displays a color scale
subplot(1,2,2),imagesc(Cor),title('Correlation'); %displays the correlation image
colormap jet %displays the image in jet colors
colorbar %displays a color scale

fprintf('The top 10 largest non-diagonal entries in the covariance matrix are:%s\n')
fprintf('\n')
nonDiagCov=Cov-diag(diag(Cov));%takes the diagonal out of the matrix
[S2,I2]=sort(nonDiagCov(:),'descend'); %sorts (high to low)
for i=1:2:20 %goes through every other, otherwise it would repeat
    elementNum=S2(i);%covariance number
    [row,col]=ind2sub(size(Cov),I2(i)); %determines the equivalent subscript values
    %corresponding to a given single index into an array
    fprintf('%s and %s: %.2f\n',Mat.colheaders{1,row},Mat.colheaders{1,col},elementNum);
    %displays the 2 movies being compared and their covariance number
end
fprintf('\n')
fprintf('The top 10 largest non-diagonal entries in the correlation matrix are:%s')
fprintf('\n')
nonDiagCor=Cor-diag(diag(Cor)); %takes the diagonal out of the matrix
[S2,I2]=sort(nonDiagCor(:),'descend'); %sorts (high to low)
for i=1:2:20 %goes through every other, otherwise it would repeat
    elementNum=S2(i); %covariance number
    [row,col]=ind2sub(size(Cor),I2(i)); %determines the equivalent subscript values
    fprintf('%s and %s: %.2f\n',Mat.colheaders{1,row},Mat.colheaders{1,col},elementNum);
    %displays the 2 movies being compared and their correlation number
end

%% Problem 2
% Below are images of the principal component analysis of the covariance 
% and correltation matrices of the movie data.
%
[V1,D]=eigs(Cov,1); % creates the PCA with the covarience
[V2,D]=eigs(Cor,1); % creates the PCA with the correlation
subplot(1,2,1),imagesc(V1),title('Covariance PCA'); %displays the covariance PCA
colorbar %displays a color scale
subplot(1,2,2),imagesc(V2),title('Correlation PCA'); %displays the correlation PCA
colorbar %displays a color scale

fprintf('The top 10 largest non-diagonal entries in the covariance PCA matrix are:\n')
fprintf('\n')
[S1,I1]=sort(V1(:),'descend'); %sorts the PCA covariance vector, holds size and index
for i=1:10 %goes through the first 10 elements
    genreIndex1=ind2sub(S1,I1(i)); %gets the index of the genre
    elementNum=S1(i); %corresponding covariance PCA
    fprintf('%s: %.3f\n',Mat.colheaders{1,genreIndex1},elementNum)
    %prints the movie genre and corresponding entry
end
fprintf('\n')
fprintf('The top 10 largest non-diagonal entries in the correlation PCA matrix are:\n')
fprintf('\n')
[S2,I2]=sort(V2(:),'descend'); %sorts the PCA correlation vector, holds size and index
for i=1:10 %goes through the first 10 elements
    genreIndex2=ind2sub(S2,I2(i)); %gets the index of the genre
    elementNum=S2(i); %corresponding correlation PCA   
    fprintf('%s: %.3f\n',Mat.colheaders{1,genreIndex2},elementNum);
    %prints the movie genre and corresponding entry
end
%% Link to this website and m-file
%
% * <http://studentpersonalpages.loyola.edu/cnvallefuoco/www/loy1703936/MA302/html/hw8Vall.html hw8Vall.html>
% * <http://studentpersonalpages.loyola.edu/cnvallefuoco/www/loy1703936/MA302/hw8Vall.m hw8Vall.m>
% * <http://studentpersonalpages.loyola.edu/cnvallefuoco/www/loy1703936/MA302/covVall.m covVall.m>
% * <http://studentpersonalpages.loyola.edu/cnvallefuoco/www/loy1703936/MA302/corVall.m corVall.m>
%
