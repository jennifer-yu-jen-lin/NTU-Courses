% 5
clear;clc;
x = linspace(0,pi);
y1 = cos(x);
plot(x,y1 ,'DisplayName','cos(x)');
hold on
y2 = cos(2*x);
plot(x,y2,'DisplayName','cos(2x)')
y3 = cos(3*x);
plot(x,y3,'DisplayName','cos(3x)')
hold off
legend

% 6
clear;clc;
x = linspace(0,pi);
y1 = cos(x);
plot(x,y1)
hold on
y2 = cos(2*x);
plot(x,y2)
y3 = cos(3*x);
plot(x,y3)
hold off
legend('cos(x)','cos(2x)','cos(3x)')


% 7
clear;clc;
x = linspace(0,pi);
y1 = cos(x);
plot(x,y1)
hold on
y2 = cos(2*x);
plot(x,y2)
y3 = cos(3*x);
plot(x,y3)
hold off
legend({'cos(x)','cos(2x)','cos(3x)'})

% 8
clear;clc;
x = linspace(0,pi);
y1 = cos(x);
plot(x,y1)
hold on
y2 = cos(2*x);
plot(x,y2)
y3 = cos(3*x);
plot(x,y3)
hold off
legend({'cos(x)','cos(2x)','cos(3x)'},'Location','southwest')

% 9
clear;clc;
x = linspace(0,pi);
y1 = cos(x);
plot(x,y1)
hold on
y2 = cos(2*x);
plot(x,y2)
y3 = cos(3*x);
plot(x,y3)
hold off
legend({'cos(x)','cos(2x)','cos(3x)'},'Location','southwest','NumColumns',2)

% 10
clear;clc;
x = linspace(0,pi);
y1 = cos(x);
plot(x,y1)
hold on
y2 = cos(2*x);
plot(x,y2)
y3 = cos(3*x);
plot(x,y3)
hold off
legend({'cos(x)','cos(2x)','cos(3x)'},'Location','southwest','NumColumns',2,'FontSize',12,'TextColor','blue')

% 11
clear;clc;
x = linspace(0,pi);
y1 = cos(x);
plot(x,y1)
hold on
y2 = cos(2*x);
plot(x,y2)
y3 = cos(3*x);
plot(x,y3)
hold off
lgd = legend('cos(x)','cos(2x)','cos(3x)');
lgd
lgd.FontSize = 20;

% 12
clear;clc;
x = linspace(0,pi);
y1 = cos(x);
plot(x,y1)
hold on
y2 = cos(2*x);
plot(x,y2)
y3 = cos(3*x);
plot(x,y3)
hold off
lgd = legend('cos(x)','cos(2x)','cos(3x)');
title(lgd,'My Legend Title');

% 13
clear;clc;
x = linspace(0,pi);
y1 = cos(x);
p1 = plot(x,y1);
hold on
y2 = cos(2*x);
p2 = plot(x,y2);
y3 = cos(3*x);
p3 = plot(x,y3);
hold off
legend([p1 p3],{'cos(x)', 'cos(3x)'})

% 14
clear;clc;
x = linspace(0,pi);
y1 = cos(x);
p1 = plot(x,y1);
hold on
y2 = cos(2*x);
p2 = plot(x,y2);
y3 = cos(3*x);
p3 = plot(x,y3);
hold off
legend([p1 p3],{'cos(x)', 'cos(3x)'})
legend('boxoff')

% 15
clear;clc;
x = linspace(0,pi);
y1 = cos(x);
p1 = plot(x,y1);
hold on
y2 = cos(2*x);
p2 = plot(x,y2);
y3 = cos(3*x);
p3 = plot(x,y3);
hold off
legend([p1 p3],{'cos(x)', 'cos(3x)'})
legend('hide') %legend(vsbl) controls the visibility of the legend
legend('show')
legend('toggle')
legend('toggle')

% 16
clear;clc;
x = linspace(0,pi);
y1 = cos(x);
p1 = plot(x,y1);
hold on
y2 = cos(2*x);
p2 = plot(x,y2);
y3 = cos(3*x);
p3 = plot(x,y3);
hold off
legend([p1 p3],{'cos(x)', 'cos(3x)'})
legend('off') 

