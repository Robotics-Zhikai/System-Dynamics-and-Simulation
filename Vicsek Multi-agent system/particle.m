% class particle
% {
% 	int ID; 
% 	float position_x_current;
% 	float position_y_current;
% 	float position_x_next;
% 	float position_y_next;
% 	float angle_current;
% 	float angle_next;
% 	float absolute_velocity;
% 	int particle_printsize;
% 	float This_detect_radius;
% 	void calculate_next_position();
% 	void calculate_next_angle(particle * p); 
% 	void print();
% 	void init_particle();
% 
% };

classdef particle
    properties
        ID int32 ;
        position_x_current;
        position_y_current;
        position_x_next ;
        position_y_next ;
        angle_current  ;
        angle_next  ;
        absolute_velocity ;
        particle_printsize int32 ;
        This_detect_radius ;
    end
    methods
        function particle=calculate_next_position(particle,Set1)
            particle.position_x_next = particle.position_x_current + particle.absolute_velocity*cos(particle.angle_current)*Set1.dertaT;
            particle.position_y_next = particle.position_y_current + particle.absolute_velocity*sin(particle.angle_current)*Set1.dertaT;
       
            if particle.position_x_next>Set1.L
%                 particle.angle_current=particle.angle_current+pi;
%                 flag=1;
                particle.position_x_next=unifrnd(0,Set1.L);
                particle.angle_current=unifrnd(0,2*pi);
            end
            if particle.position_x_next<0
%                 particle.angle_current=particle.angle_current-pi;
%                 flag=1;
                particle.position_x_next=unifrnd(0,Set1.L);
                particle.angle_current=unifrnd(0,2*pi);
            end
            if particle.position_y_next>Set1.L
%                 particle.angle_current=particle.angle_current+pi;
%                 flag=1;
                particle.position_y_next=unifrnd(0,Set1.L);
                particle.angle_current=unifrnd(0,2*pi);
            end
            if particle.position_y_next<0
%                 particle.angle_current=particle.angle_current-pi;
%                 flag=1;
                particle.position_y_next=unifrnd(0,Set1.L);
                particle.angle_current=unifrnd(0,2*pi);
            end
        end
        
        function particle=calculate_next_angle(particle,Set1)
            angle=0;
            num=0;
           % ID_D=particle.ID;
            for i=1:Set1.num_of_particles
                if ((Set1.Set_of_particles(i).position_x_current-particle.position_x_current)^2+(Set1.Set_of_particles(i).position_y_current-particle.position_y_current)^2<=Set1.detect_radius^2)
                    angle=angle+Set1.Set_of_particles(i).angle_current;
                    num=num+1;
                end
            end
            angle_average = angle / num;
            particle.angle_next=angle_average+unifrnd(-Set1.yita/2,Set1.yita/2);
        end
    
        %print(particle); 暂时还不知道怎么写
        function print(particle)
            plot(particle.position_x_current,particle.position_y_current,'.');
            hold on
            line([particle.position_x_current,particle.position_x_current+0.1*cos(particle.angle_current)],[particle.position_y_current,particle.position_y_current+0.1*sin(particle.angle_current)]);
            hold on 
        end
        function particle=init_particle(particle,Set1)
            particle.absolute_velocity=Set1.Velocity;
            particle.This_detect_radius = Set1.detect_radius;
            particle.position_x_current=unifrnd(0,Set1.L);
            particle.position_y_current=unifrnd(0,Set1.L);
            particle.angle_current=unifrnd(0,2*pi);
            particle.particle_printsize=5;
        end
    end
end






