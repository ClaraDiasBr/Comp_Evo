
g = 80;
r = 10;
Elitismo = true;

medmelhorgeral = zeros(3,g);
medmediageral = zeros(3,g);
medpiorgeral = zeros(3,g);

if Elitismo == true
    medmelhorgeralElitismo = zeros(3,g);
    medmediageralElitismo = zeros(3,g);
    medpiorgeralElitismo = zeros(3,g);
end

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
    
     if Elitismo == true
        melhorElitismo=zeros(r,g);
        mediaElitismo=zeros(r,g);
        piorElitismo=zeros(r,g);
    
        medmelhorElitismo=zeros(1,g);
        medmediaElitismo=zeros(1,g);
        medpiorElitismo=zeros(1,g);
     end
    
    for i=1:r
        for geracao=1:g
            Pop = Avaliafitness(Pop);
            best_old = Pop(1,:);
            Pop = Cruzamento(Pop,tx);
            Pop = Mutacao(Pop);
            PopNew = Pop;
            pior_new = Pop(100,:);
            if Elitismo == true
                if best_old(1,57) >= pior_new(1,57)
                PopNew(100,:)= best_old;
                PopNew = sortrows(PopNew,57,'descend');
                end
            end
            
            
            melhor(i,geracao)=Pop(1,57);
            pior(i,geracao)=Pop(100,57);
            media(i,geracao)=median(Pop(:,57));
            
            melhorElitismo(i,geracao)=PopNew(1,57);
            piorElitismo(i,geracao)=PopNew(100,57);
            mediaElitismo(i,geracao)=median(PopNew(:,57));

        end
    end
    
    for j=1:g
        medmelhor(j)=median(melhor(:,j));
        medmedia(j)=median(media(:,j));
        medpior(j)=median(pior(:,j));
        
        if Elitismo == true
            medmelhorElitismo(j)=median(melhorElitismo(:,j));
            medmediaElitismo(j)=median(mediaElitismo(:,j));
            medpiorElitismo(j)=median(piorElitismo(:,j));
        end
    end
    medmelhorgeral(k,:) = medmelhor;
    medmediageral(k,:) = medmedia;
    medpiorgeral(k,:) = medpior;
    
    if Elitismo == true
        medmelhorgeralElitismo(k,:) = medmelhorElitismo;
        medmediageralElitismo(k,:) = medmediaElitismo;
        medpiorgeralElitismo(k,:) = medpiorElitismo;
    end


end
for q=1:g
    medmelhor(q)=median(medmelhorgeral(:,q));
    medmedia(q)=median(medmediageral(:,q));
    medpior(q)=median(medpiorgeral(:,q));
    
    if Elitismo == true
        medmelhorElitismo(q)=median(medmelhorgeralElitismo(:,q));
        medmediaElitismo(q)=median(medmediageralElitismo(:,q));
        medpiorElitismo(q)=median(medpiorgeralElitismo(:,q));
    end
end

figure();

plot(1:g,medmelhor,'b');
hold on
plot(1:g,medmedia,'g');
hold on
plot(1:g,medpior,'r');
xlabel("Gerações");
ylabel("Fitness");
hold off

if Elitismo == true
    figure();
    
    plot(1:g,medmelhorElitismo,'b');
    hold on
    plot(1:g,medmediaElitismo,'g');
    hold on
    plot(1:g,medpiorElitismo,'r');
    xlabel("Gerações");
    ylabel("Fitness");
    title('Com Elitismo');
    hold off
end


