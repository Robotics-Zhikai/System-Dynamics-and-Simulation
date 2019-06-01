function [topo,topomap1,Sphere_x,Sphere_y,Sphere_z]=init_plot_sphere
    figure
    load topo topo topomap1    % load data
    whos('topo','topomap1')
    [Sphere_x,Sphere_y,Sphere_z] = sphere(50);          % create a sphere 
    light('Position',[-1 0 1])
    light('Position',[-1 0 1])

    %using this function's output:Sphere_x,Sphere_y,Sphere_z,topo
end