% Charles Harris
% BME 210
% Homework 1 Part 2

load('HemodynamicData.txt');

% Time (in seconds)
X = HemodynamicData(:,2);

%Ventricular Pressure (in mmHg)
Y1 = HemodynamicData(:,3);

%Aortic Pressure (in mmHg)
Y2 = HemodynamicData(:,4);

%Left Ventrical Volume (in mL)
Y3 = HemodynamicData(:,5);

%Data Interval
XX = [0:.001:.808];

%Creating Curved Fit For Data
YY1 = spline(X,Y1,XX);
YY2 = spline(X,Y2,XX);
YY3 = spline(X,Y3,XX);
ZZ3 = YY3;

% original attempt at graph

%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%h = plot(X,Y1,'o',XX,YY1, '-b',X,Y2,'o',XX,YY2,':r',X,Y3,'sg',XX,YY3,'--g');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Plotting Ventricular Pressure Data vs Left Ventrical Volume Spline
[ax h1 h2]=plotyy(X,Y1,XX,YY3);
title('Aortic Pressure(mmHg) and Ventrical Volume (mL) vs Time(s)');
xlabel('Time(s)');
% Labeling left y-axis
ylabel(ax(1),'Pressure (mmHg)');
% Labeling right y-axis
ylabel(ax(2),'Ventricular Volume (mL)');
set(h1, 'Marker', 'o'); % Setting open circles
set(h1, 'LineStyle','none');
set(h2, 'LineStyle', '--', 'color', 'green'); % Setting Green Dashed Line
hold on

%Plotting Ventricular Spline vs Left Ventrical Volume Data
[ax h3 h4]=plotyy(XX,YY1,X,Y3);
set(h3, 'LineStyle', '-', 'color', 'blue'); % Setting blue solid line
set(h4, 'LineStyle', 'none');
set(h4, 'Marker','s', 'color', 'green'); % Setting green squares
hold on

%Plotting Aortic Pressure Data
h5=plot(X,Y2,'o');
set(h5, 'MarkerEdgeColor', 'r', 'MarkerFaceColor', 'r'); % Filling in circles with red 
hold on

% Plotting Aortic Pressure Spline
h6= plot(XX, YY2, ':r'); % Setting dotted red line
%Creating the legend
legend([h1 h3 h5 h6 h4 h2],'V P Data', 'V P Spline', 'A P Data', 'A P Spline', 'L V V Data', 'L V V Spline')
