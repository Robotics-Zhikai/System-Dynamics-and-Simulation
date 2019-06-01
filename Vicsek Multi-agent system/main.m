%由于在visualstudio C++实现效果不好，故在matlab中实现
% int main()
% {
% 	init_paint();
% 	init_Set_industry(&Set);
% 
% 	//srand(GetTickCount());
% 	while (1)
% 	{
% 		//Set.print_Set();
% 		Set.calculate_next_state();  //计算下一时刻粒子集合状态
% 		Set.update(/*Set.Set_address*/);  //更新粒子位置角度的状态值
% 		Set.print_Set(); //打印当前时刻粒子集合
% 		
% 		//ClearWind(hdcMem, SCREEN_WIDTH, SCREEN_HEIGHT);//清屏
% 		//Sleep(10);
% 	}
clear
Set=Set1;
Set=init_Set_industry(Set);
flag=1;
  
while 1
    figure(1)
    Set=Set.calculate_next_state();
    Set=Set.update();
    Set.print_Set();
    
end





function Set_out=init_Set_industry(Set_in)
    init=particle;
    Set_out=Set_in.init_Set_basic_num();
    Set_out=Set_out.init_Set_particles(init);
end
