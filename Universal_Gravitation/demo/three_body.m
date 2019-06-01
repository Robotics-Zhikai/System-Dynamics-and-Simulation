function simulation_parameters=three_body(simulation_parameters,celestial_body) %三体运动模拟,在function simulation_parameters=init(simulation_parameters,celestial_body)函数中使用
            simulation_parameters.celestial_body_number=3 ;
           % simulation_parameters.G=6.67e-11;
            simulation_parameters.G=666.7;
            for i=1:simulation_parameters.celestial_body_number
                simulation_parameters.celestial_body_Set(i)=celestial_body;
                simulation_parameters.celestial_body_Set(i).ID=i;
                simulation_parameters.celestial_body_Set(i).radius=100; %星体半径
            end
            
             simulation_parameters.celestial_body_Set(1).position=[0,0,0];
             simulation_parameters.celestial_body_Set(1).velocity=[0,0,0];
            % simulation_parameters.celestial_body_Set(1).velocity=[0,0,0];
             simulation_parameters.celestial_body_Set(1).mass=30; %太阳的质量
             
            simulation_parameters.celestial_body_Set(2).position=[3000,0,0];
             simulation_parameters.celestial_body_Set(2).velocity=[0,0,8500];  
          %   simulation_parameters.celestial_body_Set(2).velocity=[0,0,0];  
             simulation_parameters.celestial_body_Set(2).mass=30; %太阳的质量
    %        simulation_parameters.celestial_body_Set(1).position=[unifrnd(0,1500),unifrnd(0,100),unifrnd(0,0)];
      %       simulation_parameters.celestial_body_Set(1).velocity=[unifrnd(0,200),unifrnd(0,300),unifrnd(0,0)];
      
      simulation_parameters.celestial_body_Set(3).position=[1500,0,0];
             simulation_parameters.celestial_body_Set(3).velocity=[0,0,-8500];    
             simulation_parameters.celestial_body_Set(3).mass=30; %太阳的质量
%              
%              simulation_parameters.celestial_body_Set(4).position=[-1500,0,0];
%              simulation_parameters.celestial_body_Set(4).velocity=[0,0,0];    
%              simulation_parameters.celestial_body_Set(4).mass=30; %太阳的质量
end