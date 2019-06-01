function simulation_parameters=Earth_around_the_Sun(simulation_parameters,celestial_body)
simulation_parameters.celestial_body_number=2 ;
           % simulation_parameters.G=6.67e-11;
            simulation_parameters.G=66.7;
            for i=1:simulation_parameters.celestial_body_number
                simulation_parameters.celestial_body_Set(i)=celestial_body;
                simulation_parameters.celestial_body_Set(i).ID=i;
                
            end
            simulation_parameters.celestial_body_Set(1).radius=600; %星体半径
             simulation_parameters.celestial_body_Set(2).radius=100; %星体半径
             simulation_parameters.celestial_body_Set(1).position=[0,0,0];
             simulation_parameters.celestial_body_Set(1).velocity=[0,0,0];
            % simulation_parameters.celestial_body_Set(1).velocity=[0,0,0];
             simulation_parameters.celestial_body_Set(1).mass=30000; %太阳的质量
             
            simulation_parameters.celestial_body_Set(2).position=[3000,0,0];
             simulation_parameters.celestial_body_Set(2).velocity=[0,0,68500];  
          %   simulation_parameters.celestial_body_Set(2).velocity=[0,0,0];  
             simulation_parameters.celestial_body_Set(2).mass=30; %太阳的质量
end
