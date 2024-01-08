dataset1 = xlsread('Highercollisions-phenylvinoxydecomp-updated -14Sep.xlsx','BZFstarting','A89:F95')   %Name of excel file and their sheet. 
 
           T=dataset1(:,1);                                                %Temperature input from the excel sheet
           Kinput=dataset1(:,3);                                           %Rate coefficients input from the excel sheet
           
kunit=input('Enter the unit, type 1 for molecules or 0 if its in moles :'); %Unit of k whether in moles or molecules
if kunit == 1                                                               %If the k values are in molecules
    Kfinal = Kinput*6.023e23;                                               %multiplying it with Avo number to convert it to moles
elseif kunit == 0                                                           %If the k values are in moles
    Kfinal = Kinput;                                                        %Take the input as it is
end
    %All the input should be in moles and not in molecules.
           
             inputvalues=[5.01e+12      0.29       9.27];                   % Initial values of the 3 Arrehenius parameters
             [x]=fminsearch(@ash, inputvalues, options,T,Kfinal)            %The function ash takes in the input values, fits the Arrehenius parameters
                    

fun=@(T)x(1).*T.^x(2).*(exp(-x(3)./(1.9872036*10.^-3 *T)));                  %With the x value(Arrehenius paramaeters), calculating k value
fplot(fun,[1000 3000])                                                       %plotting the k vs T 
disp(fun(T))
hold on
set(gca,'YScale','log')                                                       %Plotting Y axis in log scale
semilogy(T, Kfinal,'o') 
xlabel('Temperature (K)')
ylabel('Rate coefficients (k)')
hold off
