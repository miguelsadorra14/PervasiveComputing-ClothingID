net = patternnet(10); %creates a neural network
view(net); %gives visual representation of our neural network


[net, tr] = train(net, dataset, targets); %trains our neural network with dataset
plotconfusion(Labels, Inputs); %plots the confusion matrix

[c,cm] = confusion(Labels,Inputs);

save net %saves neural network as net