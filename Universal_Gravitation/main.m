clear 
close all
%运动模式参照clss/simulation_parameters.m中指示修改
body=celestial_body;
universe=simulation_parameters;
universe=universe.init(body); %以body初始化小宇宙
[topo,topomap1,Sphere_x,Sphere_y,Sphere_z]=init_plot_sphere; %初始化绘图
plot_position=[0,0,0];
plot_range=3500;
for j=1:100000
    plot_position=universe.celestial_body_Set(1).position;
    for i=1:universe.celestial_body_number
        universe=universe.collision_test();
        universe.celestial_body_Set(i)=universe.celestial_body_Set(i).get_external_force(universe);
        universe.celestial_body_Set(i)=universe.celestial_body_Set(i).calculate_pos_velo();
       % plot3(universe.celestial_body_Set(i).position(1),universe.celestial_body_Set(i).position(2),universe.celestial_body_Set(i).position(3),'.');
        plot_sphere(universe.celestial_body_Set(i).position(1),universe.celestial_body_Set(i).position(2),universe.celestial_body_Set(i).position(3),universe.celestial_body_Set(i).radius,Sphere_x,Sphere_y,Sphere_z,topo);
    end
distance(j)=norm(universe.celestial_body_Set(1).position-universe.celestial_body_Set(2).position,2);
axis([plot_position(1)-plot_range plot_position(1)+plot_range plot_position(2)-plot_range plot_position(2)+plot_range plot_position(3)-plot_range plot_position(3)+plot_range]);
   % axis([ -2500 5000 -1000 1000 -4000 4000])
view(3);
view(0,0)
drawnow;
clear_figure
    
end
