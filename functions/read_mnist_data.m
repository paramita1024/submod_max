% Change the filenames if you've saved the files under different names
% On some platforms, the files might be saved as 
% train-images.idx3-ubyte / train-labels.idx1-ubyte
% tested.
images = loadMNISTImages('../data/t10k-images.idx3-ubyte');
labels = loadMNISTLabels('../data/t10k-labels.idx1-ubyte');
save test_mnist.mat images labels -v6;
 
% We are using display_network from the autoencoder code
%display_network(images(:,1:100)); % Show the first 100 images
%disp(labels(1:10));
% i=11;
% m=28;
% n=28;
% for i=1:30
%     im = images(:,i);
%     image_matrix= reshape(im,m,n);
%     image(floor(image_matrix*256));
%     pause(1)
% end