classdef simulation_parameters
    properties
        celestial_body_number;
        celestial_body_Set celestial_body;
        G;
    end
    methods
        function simulation_parameters=init(simulation_parameters,celestial_body)
            
            % 以下demo，想观察哪个demo就取消注释哪个函数，demo还可继续添加，添加方法可参照下边的方法。demo中可自己创建运行参数
           simulation_parameters=three_body(simulation_parameters,celestial_body);
           %模拟三体运动
          
           %simulation_parameters=Two_stars_collide(simulation_parameters,celestial_body);
           % 模拟动量守恒，两星体相撞
           
           %simulation_parameters=Earth_around_the_Sun(simulation_parameters,celestial_body);
           %模拟地球绕太阳转
           
        end
        function simulation_parameters=collision_test(simulation_parameters)  %当两星体之间的距离小于一定的阈值时，则判定为相撞，数量减少，星体质量增大，体积增大，为二者之和,并且遵循动量守恒
            for i=1:simulation_parameters.celestial_body_number-1
                for j=i+1:simulation_parameters.celestial_body_number
                    if norm((simulation_parameters.celestial_body_Set(i).position-simulation_parameters.celestial_body_Set(j).position),2)<(simulation_parameters.celestial_body_Set(i).radius+simulation_parameters.celestial_body_Set(j).radius)%表明相撞
                        simulation_parameters.celestial_body_Set(i).radius=((simulation_parameters.celestial_body_Set(i).radius)^3+(simulation_parameters.celestial_body_Set(j).radius)^3)^(1/3);
                        p1=(simulation_parameters.celestial_body_Set(i).mass)*(simulation_parameters.celestial_body_Set(i).velocity);
                        p2=(simulation_parameters.celestial_body_Set(j).mass)*(simulation_parameters.celestial_body_Set(j).velocity);
                        simulation_parameters.celestial_body_Set(i).mass=(simulation_parameters.celestial_body_Set(i).mass+simulation_parameters.celestial_body_Set(j).mass);                  
                        simulation_parameters.celestial_body_Set(i).velocity=(p1+p2)/simulation_parameters.celestial_body_Set(i).mass;
                        simulation_parameters.celestial_body_number=simulation_parameters.celestial_body_number-1;
                        for k=j:simulation_parameters.celestial_body_number-1
                            simulation_parameters.celestial_body_Set(k)=simulation_parameters.celestial_body_Set(k+1);
                            simulation_parameters.celestial_body_Set(k).ID=simulation_parameters.celestial_body_Set(k).ID-1;
                        end
                        return;
                    end
                end
            end
        end
    end
end