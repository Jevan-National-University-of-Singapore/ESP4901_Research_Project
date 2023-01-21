%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%
%       POSTPROCESSING
%
%
% Validation with experiments for a simple case. Postprocessing does not 
% have to be a standalone file but can be embedded in any script.
%
% Export figures in three formats: fig, jpg and tif/eps. This will allow 
% for good documentation. The "eps" format is preferred if you use Latex
% and usually gives much sharper, crisper figures than tif.
%
% Do not use legends inside figures. That information belongs inside the
% figure caption.
%
% Created on June 30, 2020.
% Last edited on June 30, 2020. 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Clean up workspace and old figures and number format for display
clear 
close all
clc 
format shorteng
%format longeng

%% Load experimental data
% Place experimental data in the same folder as the script or in a
% subfolder so that you do not have to give the entire path (this does not 
% make for portability); use the load command to read in the mat, txt or dat file. 

x1_exp = linspace(0,2,6);
y1_exp = x1_exp;

x2_exp = linspace(0,2,6);
y2_exp = x2_exp+2;

x3_exp = linspace(0,2,6);
y3_exp = x3_exp+4;

%% Load simulation data 
% Place simulation data in the same folder as the script or in a
% subfolder so that you do not have to give the entire path (this does not 
% make for portability); use the load command to read in the mat, txt or dat file. 

x1 = linspace(0,2,1e3);
y1 = x1;

x2 = linspace(0,2,1e3);
y2 = x2+2;

x3 = linspace(0,2,1e3);
y3 = x3+4;

%% Load neural network data 
% Place neural-network data in the same folder as the script or in a
% subfolder so that you do not have to give the entire path (this does not 
% make for portability); use the load command to read in the mat, txt or dat file.  
% One can easily have the trained neural network here as well in order to avoid
% data files.

x1n = linspace(0,2,10);
y1n = x1n;

x2n = linspace(0,2,10);
y2n = x2n+2;

x3n = linspace(0,2,10);
y3n = x3n+4;

%% Figure 1
figure(1)
hold on

% Matlab RGB colors that are dark; can be coded in Latex/Word captions in 
% your scientific writing so that the colors match between figure captions
% and the actual figure. 

blue = [0.00 0.00 0.55];
red = [0.65 0.16 0.16];
green = [0.00 0.39 0.00];
pink = [1.00,0.00,1.00]; %fourth color

% Simulation
plot(x1,y1,'color',blue)
plot(x2,y2,'color',red)
plot(x3,y3,'color',green)
% Neural-network predictions
plot(x1n,y1n,'x','MarkerEdgeColor','k','MarkerFaceColor',blue,'MarkerSize',6)
plot(x2n,y2n,'x','MarkerEdgeColor','k','MarkerFaceColor',red,'MarkerSize',6)
plot(x3n,y3n,'x','MarkerEdgeColor','k','MarkerFaceColor',green,'MarkerSize',6)
% Experiments
plot(x1_exp,y1_exp,'^','MarkerEdgeColor','k','MarkerFaceColor',blue,'MarkerSize',6)
plot(x2_exp,y2_exp,'s','MarkerEdgeColor','k','MarkerFaceColor',red,'MarkerSize',6)
plot(x3_exp,y3_exp,'v','MarkerEdgeColor','k','MarkerFaceColor',green,'MarkerSize',6)
hold off

% Typesetting
% Use mathematical symbols as much as possible for axis labels for short
% and consistent notation between your mathematical formulation and the
% results. In the example below, one can state wave length and pressure
% drop in the figure caption.

v=get(1,'currentaxes');
%xlabel('-arg({\it{Z}})/{{\circ}}')
xlabel('\lambda/nm')
ylabel('\Delta{\itp}/Pa')
set(v,'fontsize',14,'fontname','Times New Roman') %font size can be reduced for single-column publications
axis([0 2 0 6])
box on

%% Figure 2 Subplots
% If the journal allows for centered placement of (a), (b) etc. or A, B,
% etc., the commands below can be simplified to just title without the
% extra alignment commands

figure(2)
pos = -0.25;

subplot(2,2,1)
plot(x1,y1,'color',blue)
t = title('(a)','fontsize',14,'fontname','Times New Roman','FontWeight','normal');
t.Units = 'Normalize'; 
t.Position(1) = pos; 
t.HorizontalAlignment = 'left'; 
t.VerticalAlignment = 'bottom'; 
xlabel('\lambda/nm')
ylabel('\Delta{\itp}/Pa')
set(gca,'fontsize',14,'fontname','Times New Roman') %font size can be reduced for single-column publications
axis([0 2 0 6])
box on

subplot(2,2,2)
plot(x1,y2,'color',blue)
t = title('(b)','fontsize',14,'fontname','Times New Roman','FontWeight','normal');
t.Units = 'Normalize'; 
t.Position(1) = pos; 
t.HorizontalAlignment = 'left'; 
t.VerticalAlignment = 'bottom'; 
xlabel('\lambda/nm')
ylabel('\Delta{\itp}/Pa')
set(gca,'fontsize',14,'fontname','Times New Roman') %font size can be reduced for single-column publications
axis([0 2 0 6])
box on

subplot(2,2,3)
plot(x1,y3,'color',blue)
t = title('(c)','fontsize',14,'fontname','Times New Roman','FontWeight','normal');
t.Units = 'Normalize'; 
t.Position(1) = pos; 
t.HorizontalAlignment = 'left'; 
t.VerticalAlignment = 'bottom'; 
xlabel('\lambda/nm')
ylabel('\Delta{\itp}/Pa')
set(gca,'fontsize',14,'fontname','Times New Roman') %font size can be reduced for single-column publications
axis([0 2 0 6])
box on