
function obj=ash(x,T,Kinput)

A=x(1);n=x(2);E=x(3);

K=A.*T.^n.*(exp(-E./(1.9872036*10.^-3 *T)));

obj=sum(( (K-Kinput)./Kinput).^2);