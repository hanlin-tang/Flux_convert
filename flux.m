%%plot flux data using thickness data   thickness data in MLs

% x data in second 
a = 60; %multipy factor if per min, a = 60
%average over n points
n = 300;

[files,path] = uigetfile('*.txt');
[~,prefix]=fileparts(files);

% Get txt data
txtfilename = strcat(prefix,'.txt');
txtfile = importdata(fullfile(path,txtfilename));% save data

clf
x = txtfile(2:end,1);   % time
y = txtfile(2:end,2);   % thickness raw data

figure (1)
plot(x,y, 'b')
title('thickness[MLs]')

A = [0];
for i = 1:(length(x)-n)
    p = polyfit(x(i:i+n),y(i:i+n),1);   %linear fitting 
    A(end+1) = p(1);
end


p = polyfit(x,y,1);
slope = p(1);
intercept = p(2);

yfit = p(1)*x + p(2);
hold on;
plot (x, yfit, 'r-.')

%A = A';
xA = x(1:length(A));

figure (2)
title('flux','FontWeight','bold','FontSize',24)
hold on
plot(xA,A*a,'b.',xA,A*a,'g-')
xlabel('time','FontSize',18)
ylabel('flux (ML/cm^{2}min)','FontSize',18)
grid on
axis tight




