function Popmutacao = Mutacao(Pop)
    for i=1:100
        for j=1:56
            if rand <= 0.01 

                Pop(i,j) =~ Pop(i,j);
                Pop(i,:) = Avaliafitness(Pop(i,:));
            end
        end
    end
    Pop = sortrows(Pop,57,'descend');
    Popmutacao = Pop;
end