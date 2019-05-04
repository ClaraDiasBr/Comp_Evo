function popFinal = Cruzamento(Pop,tx)
    
    popInversa = sortrows(Pop,57);
    soma = sum(popInversa(:,57));
    
    popPais = Pop(1:2,:);
    popFilhos = zeros(100,57);
    for z = 1:2:100
        for i = 1:2
            amostra = soma*rand;
            somaFitness = 0;
            for j = 1:100
                somaFitness = somaFitness + popInversa(j,57);
                if amostra <= somaFitness
                    popPais(i,:) = popInversa(j,:);
                    break;
                end
            end
            
            x = rand;
            if x <= tx
               [y1, y2] = SinglePointCrossover(popPais(1,1:56), popPais(2,1:56));
               popFilhos(z,1:56) = y1;
               popFilhos(z + 1,1:56) = y2;
            else
               popFilhos(z,1:56) = popPais(1,1:56);
               popFilhos(z + 1,1:56) = popPais(2,1:56);                
            end
        end
    end
    
    popFilhos = Avaliafitness(popFilhos);
    
    popFinal = popFilhos;
end
    
    
    
    
    
    

%end