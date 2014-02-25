function net = create_pr_net(inputs,targets)
%CREATE_PR_NET Creates and trains a pattern recognition neural network.
%
%  NET = CREATE_PR_NET1(INPUTS,TARGETS) takes these arguments:
%    INPUTS - RxQ matrix of Q R-element input samples
%    TARGETS - SxQ matrix of Q S-element associated target samples, where
%      each column contains a single 1, with all other elements set to 0.
%  and returns these results:
%    NET - The trained neural network
%
%  For example, to solve the Iris dataset problem with this function:
%
%    load iris_dataset
%    net = create_pr_net(irisInputs,irisTargets);
%    irisOutputs = sim(net,irisInputs);
%
%  To reproduce the results you obtained in NPRTOOL:
%
%    net = create_pr_net(glassInputs',glassTargets');

% Create Network
numHiddenNeurons = 20;  % Adjust as desired
net = newpr(inputs,targets,numHiddenNeurons);
net.divideParam.trainRatio = 70/100;  % Adjust as desired
net.divideParam.valRatio = 15/100;  % Adjust as desired
net.divideParam.testRatio = 15/100;  % Adjust as desired

% Train and Apply Network
[net,tr] = train(net,inputs,targets);
[net,tr] = train(net,inputs,targets);
[net,tr] = train(net,inputs,targets);
[net,tr] = train(net,inputs,targets);
[net,tr] = train(net,inputs,targets);
outputs = sim(net,inputs);

