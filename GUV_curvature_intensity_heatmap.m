%% 'Heatmap' plotter for normalized curvature and intensity of fluorescent-tagged GUVs. 
%% by: R. Chairil, University of Southern California 2022
% Used in conjunction with Kappa curvature analysis in ImageJ/Fiji: https://github.com/fiji/Kappa
% First, import an Excel file (e.g. KI_XXX.mat) containing normalized (value/max value per
% vesicle) curvature and normalized intensity.
% KI_QD = KI plot for CsPbBr3
% KI_ATTO = KI plot for ATTO/control
% KI_CdSe = KI plot for CdSe
% Plot the bivariate histogram/heatmap of normalized intensity (Y) vs. normalized curvature; the color scale reports
% frequency of occurrence for each ordered pair bin on K = [0:1], I = [0:1]

[fig1,P1] = KI_heatmap(KI_QD);
set(gcf,'Name', 'Curvature Preference of CsPbBr3')
set(gcf,'NumberTitle','off')

[fig2,P2] = KI_heatmap(KI_ATTO);
set(gcf,'Name', 'Curvature Preference of ATTO-488')
set(gcf,'NumberTitle','off')

[fig3,P3] = KI_heatmap(KI_CdSe);
set(gcf,'Name', 'Curvature Preference of CdSe')
set(gcf,'NumberTitle','off')

% define the KI plotter function
% input: 2-column matrix containing normalized KI data
% outputs: f = bivariate histogram as a figure, P = tabulated heatmap
function [f,P] = KI_heatmap(KI)    
    % define bin boundaries of the histogram
    % NOTE: due to peculiarity of hist3, the last bin will go from [.999...,1] i.e.
    % will likely be of different width when compared to the "main bins"
    % to solve this, extend the last bin by a tiny amount (say 0.0001). 
    edges = {0:1/15:1 0:1/15:1};
    EndX = edges{1}(end)+0.0001; 
    EndY = edges{2}(end)+0.0001;
    edges{1}(end) = EndX;
    edges{2}(end) = EndY;
    
    P = hist3(KI,'Edges',edges,'CDataMode','auto');
    f = figure;
    hist3(KI,'Edges',edges,'CDataMode','auto');
    
    % enable LaTeX for axes
    set(0,'defaultTextInterpreter','latex');
    set(gca,'TickLabelInterpreter','latex');
    
    xlabel('Normalized Curvature, $\bar{\kappa_{i,j}}$','interpreter','latex')
    ylabel('Normalized Intensity, $\bar{I}_{i,j}$', 'interpreter', 'latex')
    colormap('hot')
    c = colorbar;
    
    % enable LaTeX for colorbar
    set(c,'TickLabelInterpreter','latex');
    c.Label.Interpreter = 'latex';
    c.Label.String = 'frequency';
    
    % 2D projection only
    view(2);

% add these to constrain both axes to [0 1]
    xlim([0 1])
    ylim([0 1])
    
end