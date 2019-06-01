 function plot_sphere(x,y,z,radius,Sphere_x,Sphere_y,Sphere_z,topo)  % Sphere=sphere(50 or other number)
% Sphere_x,Sphere_y,Sphere_z,topo 这三个值都是用的是init文件里的值
 %actually,we dont need to define Sphere_x,Sphere_y,Sphere_z,topo,just use itself ,but have
 %to treat x y z as input 

S_x=radius*Sphere_x;
S_y=radius*Sphere_y;
S_z=radius*Sphere_z;

s = surface(S_x+x,S_y+y,S_z+z);            % plot spherical surface
s.CData = topo;                % set color data to topographic data
s.FaceColor = 'texturemap';    % use texture mapping
s.EdgeColor = 'none';          % remove edges
s.FaceLighting = 'gouraud';    % preferred lighting for curved surfaces
s.SpecularStrength = 0.4;      % change the strength of the reflected light

%axis square off                % set axis to square and remove axis
view([-30,30])                 % set the viewing angle
% 
% hold on 
% x2=105;
% y2=205;
% z2=305;
% 
% s2 = surface(x+x2,y+y2,z+z2);            % plot spherical surface
% s2.CData = topo;                % set color data to topographic data
% s2.FaceColor = 'texturemap';    % use texture mapping
% s2.EdgeColor = 'none';          % remove edges
% s2.FaceLighting = 'gouraud';    % preferred lighting for curved surfaces
% s2.SpecularStrength = 0.4;      % change the strength of the reflected light
% light('Position',[-1 0 1])     % add a light
% axis square off                % set axis to square and remove axis
% view([-30,30])                 % set the viewing angle
% 
%  end
% figure
% 
% for i=1:2
%      [S_x,S_y,S_z]=sphere(20);
%     S_x=S_x+x;
%     S_y=S_y+y;
%     S_z=S_z+z;
%     Spher=surface(S_x,S_y,S_z);
%     x=105;
%     y=205;
%     z=305;
%     hold on
% end
% light('Position',[x+40 y+40 z+40])     % add a light
% axis([x-10 x+10 y-10 y+10 z-10 z+10])
% axis square off   %去掉坐标轴
% i=0;
% while (1)
%     i=i+1;
% %     i=mod(i,180);
% %     view(i,-45);
%     drawnow;
 end

