%% Simultaneous surface plotter for curvature and intensity of fluorescent-tagged GUVs. 
%% by: R. Chairil, University of Southern California 2022
% Used in conjunction with Kappa curvature analysis in ImageJ/Fiji: https://github.com/fiji/Kappa
% First, import an Excel file containing X coordinates (um), Y coordinates
% (um), normalized intensity I, and normalized curvature K.
% Create individual vectors for X, Y, I, and K.
% Plot the surface plots of Curvature vs. X and Y; the color scale reports intensity.
scatter3(X,Y,K,100,I,'filled')
hold on
grid on

% enable LaTeX for axes
set(0,'defaultTextInterpreter','latex');
set(gca,'TickLabelInterpreter','latex');
    
% Data labels
xlabel('x-coordinate (um)')
ylabel('y-coordinate (um)')
zlabel('Normalized Curvature')

cb = colorbar;
cb.Label.String = 'Normalized Intensity';
set(cb,'TickLabelInterpreter','latex');
cb.Label.Interpreter = 'latex';