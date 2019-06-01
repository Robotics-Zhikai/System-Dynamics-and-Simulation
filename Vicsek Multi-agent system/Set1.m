% class Set1
% {
% public:
% 	//Set1();
% 	float dertaT;
% 	float Velocity;
% 	float detect_radius;
% 	int num_of_particles;
% 	float yita = YITA;
% 	int L;
% 	particle * Set_address;
% 	void update(/*particle * Set_address*/);
% 	particle * creat_Set(); //创建粒子集合，返回首个粒子的地址
% 	void init_Set();//初始化集合的相关参数和集合中粒子的初始取值
% 	void print_Set();
% 	void calculate_next_state();
% }Set;

classdef Set1
    properties
        dertaT ;
        Velocity ;
        detect_radius ;
        num_of_particles int32 ;
        yita ;
        L ; %粒子分布的范围 ;;
        %particle * Set_address;
        Set_of_particles  particle;%存放所有particle;
    end
    methods
        function Set1=update(Set1)
            for i=1:Set1.num_of_particles
                Set1.Set_of_particles(i).angle_current=Set1.Set_of_particles(i).angle_next;
                Set1.Set_of_particles(i).position_x_current=Set1.Set_of_particles(i).position_x_next;
                Set1.Set_of_particles(i).position_y_current=Set1.Set_of_particles(i).position_y_next;
            end
        end
        
        function Set1=init_Set_basic_num(Set1)
            Set1.dertaT=1;
            Set1.Velocity=0.03;
            Set1.detect_radius=0.4;
            Set1.num_of_particles=50;
            Set1.yita=0;
            Set1.L=2.5; 
        end
        function Set1=init_Set_particles(Set1,particle)
             for i=1:Set1.num_of_particles
                Set1.Set_of_particles(i)=particle;
                Set1.Set_of_particles(i)=Set1.Set_of_particles(i).init_particle(Set1);
                Set1.Set_of_particles(i).ID=i;
            end
        end
        
       % print_Set(Set1);
       function  print_Set(Set1)
           
           for i=1:Set1.num_of_particles
               Set1.Set_of_particles(i).print();
                axis([0 Set1.L 0 Set1.L]);
           end
           hold off
       end
       
       function Set1=calculate_next_state(Set1)
           for i=1:Set1.num_of_particles
               Set1.Set_of_particles(i)=Set1.Set_of_particles(i).calculate_next_position(Set1);
               Set1.Set_of_particles(i)=Set1.Set_of_particles(i).calculate_next_angle(Set1);                  
           end
       end
    end
end








