%������visualstudio C++ʵ��Ч�����ã�����matlab��ʵ��
% int main()
% {
% 	init_paint();
% 	init_Set_industry(&Set);
% 
% 	//srand(GetTickCount());
% 	while (1)
% 	{
% 		//Set.print_Set();
% 		Set.calculate_next_state();  //������һʱ�����Ӽ���״̬
% 		Set.update(/*Set.Set_address*/);  //��������λ�ýǶȵ�״ֵ̬
% 		Set.print_Set(); //��ӡ��ǰʱ�����Ӽ���
% 		
% 		//ClearWind(hdcMem, SCREEN_WIDTH, SCREEN_HEIGHT);//����
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
