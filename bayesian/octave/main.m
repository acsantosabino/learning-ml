%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                             Bayesian - Arthur Santos                         %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Read Dataset
file = "../../data/iris.csv";

x = readdataset(file, 6)(2:end,:);
x = x(randperm(length(x)),:);
y = x(2:end,6);
y(cellfun(@(x) isequal(x, "Iris-setosa"), y))=1;
y(cellfun(@(x) isequal(x, "Iris-versicolor"), y))=2;
y(cellfun(@(x) isequal(x, "Iris-virginica"), y))=3;
x = str2double(x(2:end,2:5));
y = cell2mat(y);

%% calc probs
model = bayesian(x(:,[2,3]),y);
pred = predict(model,x(121:end,[2,3]))