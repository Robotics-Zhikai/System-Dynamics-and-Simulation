function simulation_parameters=Two_stars_collide(simulation_parameters,celestial_body) %��������ײģ��
simulation_parameters.celestial_body_number=2 ;
           % simulation_parameters.G=6.67e-11;
            simulation_parameters.G=666.7;
            for i=1:simulation_parameters.celestial_body_number
                simulation_parameters.celestial_body_Set(i)=celestial_body;
                simulation_parameters.celestial_body_Set(i).ID=i;
                simulation_parameters.celestial_body_Set(i).radius=100; %����뾶
            end
            
             simulation_parameters.celestial_body_Set(1).position=[0,0,0]; %���ó�ʼλ��
             simulation_parameters.celestial_body_Set(1).velocity=[0,0,0]; %���ó�ʼ�ٶ�
            % simulation_parameters.celestial_body_Set(1).velocity=[0,0,0];
             simulation_parameters.celestial_body_Set(1).mass=30; %̫��������
             
            simulation_parameters.celestial_body_Set(2).position=[3000,0,0];
             simulation_parameters.celestial_body_Set(2).velocity=[0,0,0];  
          %   simulation_parameters.celestial_body_Set(2).velocity=[0,0,0];  
             simulation_parameters.celestial_body_Set(2).mass=30; %̫��������
end
