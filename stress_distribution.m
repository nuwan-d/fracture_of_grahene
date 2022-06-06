%% M.A.N. Dewapriya
%% 2022/06/01
%% This code extracts data from the LAMMPS output file containing atomic stresses and plot the stress distribution.

close all;
clear all;
clc

%% Getting data from dump file

sum_num = 1;

for time_step = 55000:5000:60000

[fid] = fopen(['dump.stress.',num2str(time_step)]);
 
    junk_1 = fscanf(fid,'%s ',2) ;
    ts = fscanf(fid,'%d ',1) ;
    junk_2 = fscanf(fid,'%s ',4);
    atom = fscanf(fid,'%d ',1) ;
    junk_3 = fscanf(fid,'%s ',6);
    [s] = fscanf(fid, ' %f %f ',[2,3])
    s=s';
    junk_4 = fscanf(fid,'%s ',9)

    [A,count] = fscanf(fid, '%d %d %f %f %*f %*f %f ',[5,inf]);%% etract only x,y and z

    A = A';

fclose(fid);

%% Converting the calculated stress to GPa
       
  ini_vol = 8.6; % representative vol of C atom in garphene with t=3.4 A
  ConvoFac = 10^-4; % Lammps gives in stress in bar;  multiply by (10^5*10^-9) to convert it to GPa

  A(:,5) = ConvoFac/ini_vol*A(:,5); % Stress_yy in GPa      
  A = sortrows(A,1);    
  sigma_yy(:,sum_num) = A(:,5);
  sum_num = sum_num + 1;

end


%% Computing average stresses

A(:,5) = mean(sigma_yy,2);

%% Plotting stress in selected area

num = 1;

for i=1:size(A,1)
     x = A(i,3);
     y = A(i,4);
    
    if (((x > -100 && x < 400) && (y > -100)) && (y < 400))
        coord(num,:) = A(i,3:5);
        num = num + 1;
  
    end
end

%% Plotting stress distribution
figure
plot3(coord(:,1), coord(:,2), coord(:,3), 'o', 'MarkerSize', 3, 'MarkerEdgeColor', 'k', 'LineWidth', 1) % change this in an appropriate way for zig-zag and arm chair
view(0,90)
axis equal


figure
h = scatter(coord(:,1), coord(:,2), 6, coord(:,3),'fill');
colormap('jet')
axis equal  
axis off

caxis([-10 45])

c = colorbar('southoutside');

%% adusting width of color bar

ax = gca;
axpos = ax.Position;
cpos = c.Position;
cpos(4) = 0.5*cpos(4);
c.Position = cpos;
ax.Position = axpos;

%% Printing
paperWidth = 4.15; 
paperHeight = paperWidth;
set(gcf, 'paperunits', 'inches');
set(gcf, 'papersize', [paperWidth paperHeight]);
set(gcf, 'PaperPosition', [0    0   paperWidth paperHeight]);
print(gcf, '-dpng', 'stress-crack-hole'); % Colour