%% M.A.N. Dewapriya
%% 2022/06/01
%% This code extracts data from the LAMMPS output file stress-strain and plot the stress-strain curve.

close all;
clear all;
clc

%% Getting data from dump file



[fid] = fopen('stress_strain');
 
junk_1 = fscanf(fid,'%s ', 7)

[A,count] = fscanf(fid, '%f %*f %f %*f %f ',[3,inf]);%% etract only x,y and z
stress_strain = A';




%% stress strain
figure
plot(stress_strain(:,1), stress_strain(:,2),'-ro','MarkerSize',2,'MarkerFaceColor','r','MarkerEdgeColor','r')
hold on
plot(stress_strain(:,1), stress_strain(:,3),'-bo','MarkerSize',2,'MarkerFaceColor','b','MarkerEdgeColor','b')
% hold on
% plot(stress_strain(:,2), stress_strain(:,5),'-ko','MarkerSize',2,'MarkerFaceColor','k','MarkerEdgeColor','k')
%legend('all atoms', 'far field','Times New Roman','fontsize',12,'fontweight','b','Location','northwest','Orientation','vertical')
xlabel('Strain','FontName','Times New Roman','fontsize',12,'fontweight','b')
ylabel('Stress (GPa)','FontName','Times New Roman','fontsize',12,'fontweight','b')
grid on
axis('square')
set(gca,'LineWidth',1,'Fontsize',12)
set(gca,'FontName','Times New Roman')
%axis([0 0.05 -10 35])

% paperWidth = 4.15;
% paperHeight = paperWidth;
% set(gcf, 'paperunits', 'inches');
% set(gcf, 'papersize', [paperWidth paperHeight]);
% set(gcf, 'PaperPosition', [0    0   paperWidth paperHeight]);
% print(gcf, '-djpeg', 'stress-strain'); % Colour