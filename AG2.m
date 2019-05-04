
g = 50;
r = 10;

medmelhorgeral = zeros(3,g);
medmediageral = zeros(3,g);
medpiorgeral = zeros(3,g);

tx = 0.75;
popula=zeros(3,100,57);

for k=1:3
    Pop = IniciaPop();
    popula(k,:,:)=Pop;
%     Pop = zeros(100,57);
%     Pop = squeeze(popula(k,:,:));
    
    melhor=zeros(r,g);
    media=zeros(r,g);
    pior=zeros(r,g);
    
    medmelhor=zeros(1,g);
    medmedia=zeros(1,g);
    medpior=zeros(1,g);
    for i=1:r
        for geracao=1:g
            Pop = Avaliafitness(Pop);
            Pop = CruzamentoByRank(Pop,tx);
            Pop = Mutacao(Pop);
            melhor(i,geracao)=Pop(1,57);
            pior(i,geracao)=Pop(100,57);
            media(i,geracao)=median(Pop(:,57));
        end
    end
    
    for j=1:g
        medmelhor(j)=median(melhor(:,j));
        medmedia(j)=median(media(:,j));
        medpior(j)=median(pior(:,j));
    end
    medmelhorgeral(k,:) = medmelhor;
    medmediageral(k,:) = medmedia;
    medpiorgeral(k,:) = medpior;

end
for q=1:g
    medmelhor(q)=median(medmelhorgeral(:,q));
    medmedia(q)=median(medmediageral(:,q));
    medpior(q)=median(medpiorgeral(:,q));
end

figure();

plot(1:g,medmelhor);
hold on
plot(1:g,medmedia);
hold on
plot(1:g,medpior);
xlabel("Gerações");
ylabel("Fitness");
hold off


