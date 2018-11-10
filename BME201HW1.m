% Charles Harris
% BME 201
% Homework 1 - Measuring Cardiac Output

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Q = D / Integral(Concentration)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Helpful Matlab Commands:

% Files: read, load, importdata, save
% Matrix: size, length, sum, max
% Plotting and labeling: figure, plot, subplot, hold on, hold off, xlabel,
% ylabel, title
% User Input: Input

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Commenting Logic

% A: Read data from file named DyeData.txt
load('DyeData.txt');
dyeAmount = input('Please enter the initial amount of dye in milligrams: ')

%Isolate time
timeColumn = DyeData(2:end,1);

% Calculate Q

% Rectangular Approximation

% Creating h
rectIntegratingConstant = DyeData(3,1) - DyeData(2,1);

% Calculate integral and evaluate from 1 to n-1

%Assuming right point method for rectangular approximation:
Area1 = rectIntegratingConstant * (sum(DyeData(2:end,2)) - DyeData(length(DyeData),2));
              %width                   %length

% Present area

disp('The approximation for the integral of concentration using the rectangular approximation is (in mg*sec/L): ')
disp(Area1)

% Calculate cardiac output
cardiacOutput1 = dyeAmount/Area1;

%Convert cardiac output to proper units
cardiacOutput1 = cardiacOutput1 * 60;

% Present cardiac output
disp('The cardiac output as approximated by the rectangular method is in (L/min): ')
disp(cardiacOutput1)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Trapezoidal Approximation

% Calculate area
trapIntegratingConstant = rectIntegratingConstant/2;
Area2 = trapIntegratingConstant*(DyeData(2,2)+DyeData(length(DyeData),2)) + rectIntegratingConstant*sum(DyeData(3:end,2)) - DyeData(length(DyeData),2);

% Presenting area
disp('The approximation for the integral of concentration using the trapezoidal approximation is (in mg*sec/L): ')
disp(Area2)

% Calculate cardiac output
cardiacOutput2 = dyeAmount/Area2;

%Converting cardiac output to proper units
cardiacOutput2 = cardiacOutput2 * 60;

% Present cardiac output
disp('The cardiac output as approximated by the trapezoidal method is ( in L/min): ')
disp(cardiacOutput2)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Simpson's approximation

% Calculate area

if mod(length(DyeData),2)==0
    addedTrapezoid = trapIntegratingConstant*(DataDye(length(DataDye),2)+DataDye(length(DataDye)-1,2));
    length(DataDye) = length(DataDye)-1;
else
    addedTrapezoid = 0;
end

simpsonsConstant = rectIntegratingConstant/3;
firstElement = DyeData(2,2);
lastElement = DyeData(length(DyeData),2);

inBetweenEvens = DyeData(4:2:length(DyeData)-1,2);
inBetweenOdds = DyeData(3:2:length(DyeData)-2,2);

Area3 = simpsonsConstant * (firstElement + 4 * sum(inBetweenOdds) + 2 * sum(inBetweenEvens)+ lastElement) + addedTrapezoid;

% Present area
disp('The approximation for the integral of concentration using simpsons approximation is (in mg*sec/L): ')
disp(Area3)

% Calculate cardiac output
cardiacOutput3 = dyeAmount/Area3;

% Converting cardiac output to proper units
cardiacOutput3 = cardiacOutput3 * 60;

% Present cardiac output
disp('The cardiac output as approximated by simpsons rule is (in L/min): ')
disp(cardiacOutput3)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Plot of Concentration (mg/L) vs Time (s)

x = DyeData(2:end,1);
y = DyeData(2:end,2);

plot(x,y,'o')
hold on
xlabel('Time (s)')
ylabel('Concentration of Dye (mg/L)')
ylim([0 15])
xlim([0 40])
title('Concentration of Dye (mg/L) vs Time (s)')


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% End Part 1




