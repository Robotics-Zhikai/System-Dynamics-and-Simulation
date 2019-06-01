classdef celestial_body
    properties
        ID;
        mass ;
        radius ;
        density ;
        position; %��һ��һ�����е�����
        velocity; %��һ��һ�����е�����
        external_force;
    end
    methods 
        function celestial_body=get_external_force(celestial_body,simulation_parameters) %��Ϊ��ȡ�����������Ҫ������໥���ã�����Ҫ��Ӵ�
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
        function celestial_body=calculate_pos_velo(celestial_body) %���������λ�ú��ٶ�
            dt=0.005;%���������������澫��
            dv=(dt*celestial_body.external_force)/celestial_body.mass;
            celestial_body.velocity=celestial_body.velocity+dv;
            celestial_body.position=celestial_body.position+celestial_body.velocity*dt;
        end
    end
end