 dataset1 = xlsread('Highercollisions-phenylvinoxydecomp-updated -14Sep.xlsx','BZFstarting','A89:F95')

             
           T=dataset1(:,1);
           Kinput=dataset1(:,3);
             inputvalues=[5.01e+12      0.29       9.27];  
             [x]=fminsearch(@ash, inputvalues, options,T,Kinput)
                    

fun=@(T)x(1).*T.^x(2).*(exp(-x(3)./(1.9872036*10.^-3 *T)));
fplot(fun,[1000 3000])
disp(fun(T))
hold on
set(gca,'YScale','log')
semilogy(T, Kinput,'o')
hold off
