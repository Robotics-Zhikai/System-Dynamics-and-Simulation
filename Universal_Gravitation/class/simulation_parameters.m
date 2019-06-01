classdef simulation_parameters
    properties
        celestial_body_number;
        celestial_body_Set celestial_body;
        G;
    end
    methods
        function simulation_parameters=init(simulation_parameters,celestial_body)
            
            % ����demo����۲��ĸ�demo��ȡ��ע���ĸ�������demo���ɼ�����ӣ���ӷ����ɲ����±ߵķ�����demo�п��Լ��������в���
           simulation_parameters=three_body(simulation_parameters,celestial_body);
           %ģ�������˶�
          
           %simulation_parameters=Two_stars_collide(simulation_parameters,celestial_body);
           % ģ�⶯���غ㣬��������ײ
           
           %simulation_parameters=Earth_around_the_Sun(simulation_parameters,celestial_body);
           %ģ�������̫��ת
           
        end
        function simulation_parameters=collision_test(simulation_parameters)  %��������֮��ľ���С��һ������ֵʱ�����ж�Ϊ��ײ���������٣��������������������Ϊ����֮��,������ѭ�����غ�
            for i=1:simulation_parameters.celestial_body_number-1
                for j=i+1:simulation_parameters.celestial_body_number
                    if norm((simulation_parameters.celestial_body_Set(i).position-simulation_parameters.celestial_body_Set(j).position),2)<(simulation_parameters.celestial_body_Set(i).radius+simulation_parameters.celestial_body_Set(j).radius)%������ײ
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