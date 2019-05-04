function [y1, y2] = SinglePointCrossover(x1,x2)
    nVar=numel(x1);%pega o numero de elementos que tem em x1
    
    c=randi([1 nVar-1]);% Considerando que x1 tem 56 genes, C armazena 55
    
    y1=[x1(1:c) x2(c+1:end)]; %faz a permutacao com o pai x2
    y2=[x2(1:c) x1(c+1:end)]; %faz a permutacao com o pai x1
end