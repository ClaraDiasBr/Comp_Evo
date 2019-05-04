clear all; clc;

tx = 0.75;
popula=zeros(3,100,57);
for k=1:3
Pop = IniciaPop();
popula(k,:,:)=Pop;
g=80;
melhor=zeros(10,g);
media=zeros(10,g);
pior=zeros(10,g);

medmelhor=zeros(1,g);
medmedia=zeros(1,g);
medpior=zeros(1,g);
for i=1:10
    for geracao=1:g
        Pop = Avaliafitness(Pop);
        Pop = Cruzamento(Pop,tx);
        Pop=  Mutacao(Pop);
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

figure();    
plot(1:g,medmelhor, 'g');
hold on
plot(1:g,medmedia);
hold on
plot(1:g,medpior);
xlabel('Geração') ;
ylabel('Fitness') ;
hold off

end




%[X,Y] = meshgrid(-100:0.4:100);
%z = 0.5-((( ( sin( sqrt( (X.^(2)) +(Y.^(2)) ) ) ).^(2))-0.5)./((1+0.001.*((X.^2) + (Y.^2))).^(2)));
%surf(X,Y,z,'FaceColor','interp','EdgeColor','none','FaceLighting','gouraud');
%daspect([50 50 1]);
%hold on;
%plot3(X,Y,z,'.');