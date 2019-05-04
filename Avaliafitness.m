function fit = Avaliafitness(pop)
    format long;
    x1 = pop(:,1:28);
    y1 = pop(:,29:56);
    xint = bi2de(x1);
    yint = bi2de(y1);
    x2 = (xint*(200/((2^28)-1)))-100;
    y2 = (yint*(200/((2^28)-1)))-100;
    pop(:,57) = 0.5-((((sin(sqrt((x2.^(2))+(y2.^(2))) ) ).^(2))-0.5)./((1+0.001.*((x2.^2)+(y2.^2))).^(2)));
    pop = sortrows(pop,57,'descend');
    fit = pop;
end