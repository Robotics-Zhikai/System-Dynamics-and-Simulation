classdef celestial_body
    properties
        ID;
        mass ;
        radius ;
        density ;
        position; %是一个一行三列的数组
        velocity; %是一个一行三列的数组
        external_force;
    end
    methods 
        function celestial_body=get_external_force(celestial_body,simulation_parameters) %因为获取外界作用力需要与外界相互作用，故需要添加此
            number=simulation_parameters.celestial_body_number;
            thisposition=celestial_body.position;
            external_force_sub=0;
            G=simulation_parameters.G;
            thismass=celestial_body.mass;
            for i=1:number
                if i~=celestial_body.ID
                    thatposition=simulation_parameters.celestial_body_Set(i).position;
                    thatmass=simulation_parameters.celestial_body_Set(i).mass;
                    thisposition2thatposition=[thatposition(1),thatposition(2),thatposition(3)]-[thisposition(1),thisposition(2),thisposition(3)];
                    thisposition2thatposition=thisposition2thatposition/norm(thisposition2thatposition,2);
                    external_force_sub=external_force_sub+((G*thatmass*thismass)/((norm(thisposition2thatposition,2))^2))*thisposition2thatposition;
                end
            end
            celestial_body.external_force=external_force_sub;
        end
        function celestial_body=calculate_pos_velo(celestial_body) %计算星体的位置和速度
            dt=0.005;%计算间隔，决定仿真精度
            dv=(dt*celestial_body.external_force)/celestial_body.mass;
            celestial_body.velocity=celestial_body.velocity+dv;
            celestial_body.position=celestial_body.position+celestial_body.velocity*dt;
        end
    end
end