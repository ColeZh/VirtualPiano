---------------------------------------------------------------------------------
---------------------------------------------------------------------------------
--用来保存各种常数的package
---------------------------------------------------------------------------------
---------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
-------------------------------------------------------------------------
-------------------------------------------------------------------------
package constants is
	-------------------------
	--Audio_Controller
	-------------------------
	constant notes_data_width : integer := 24;    --识别后输出到Audio_Controller的音符数据宽度，24个音符，每个分配一位
	--25种可能的音符（未按下+24个键)，便于调用时比较
	constant note_0 : std_logic_vector(notes_data_width - 1 downto 0) := (others => '0');
	constant note_1 : std_logic_vector(notes_data_width - 1 downto 0) := (23 => '1', others => '0');
	constant note_2 : std_logic_vector(notes_data_width - 1 downto 0) := (22 => '1', others => '0');
	constant note_3 : std_logic_vector(notes_data_width - 1 downto 0) := (21 => '1', others => '0');
	constant note_4 : std_logic_vector(notes_data_width - 1 downto 0) := (20 => '1', others => '0');
	constant note_5 : std_logic_vector(notes_data_width - 1 downto 0) := (19 => '1', others => '0');
	constant note_6 : std_logic_vector(notes_data_width - 1 downto 0) := (18 => '1', others => '0');
	constant note_7 : std_logic_vector(notes_data_width - 1 downto 0) := (17 => '1', others => '0');
	constant note_8 : std_logic_vector(notes_data_width - 1 downto 0) := (16 => '1', others => '0');
	constant note_9 : std_logic_vector(notes_data_width - 1 downto 0) := (15 => '1', others => '0');
	constant note_10 : std_logic_vector(notes_data_width - 1 downto 0) := (14 => '1', others => '0');
	constant note_11 : std_logic_vector(notes_data_width - 1 downto 0) := (13 => '1', others => '0');
	constant note_12 : std_logic_vector(notes_data_width - 1 downto 0) := (12 => '1', others => '0');
	constant note_13 : std_logic_vector(notes_data_width - 1 downto 0) := (11 => '1', others => '0');
	constant note_14 : std_logic_vector(notes_data_width - 1 downto 0) := (10 => '1', others => '0');
	constant note_15 : std_logic_vector(notes_data_width - 1 downto 0) := (9 => '1', others => '0');
	constant note_16 : std_logic_vector(notes_data_width - 1 downto 0) := (8 => '1', others => '0');
	constant note_17 : std_logic_vector(notes_data_width - 1 downto 0) := (7 => '1', others => '0');
	constant note_18 : std_logic_vector(notes_data_width - 1 downto 0) := (6 => '1', others => '0');
	constant note_19 : std_logic_vector(notes_data_width - 1 downto 0) := (5 => '1', others => '0');
	constant note_20 : std_logic_vector(notes_data_width - 1 downto 0) := (4 => '1', others => '0');
	constant note_21 : std_logic_vector(notes_data_width - 1 downto 0) := (3 => '1', others => '0');
	constant note_22 : std_logic_vector(notes_data_width - 1 downto 0) := (2 => '1', others => '0');
	constant note_23 : std_logic_vector(notes_data_width - 1 downto 0) := (1 => '1', others => '0');
	constant note_24 : std_logic_vector(notes_data_width - 1 downto 0) := (0 => '1', others => '0');
	
	--将识别模块输出的24位信号进行转化，只保留第一个1，其余位全部置为0
	function rawnote2note(ndata : std_logic_vector(notes_data_width - 1 downto 0)) return std_logic_vector;
	
	-------------------------
	--NCO
	-------------------------
	constant NCO_phase_width : integer := 25;        --输入到 NCO 的相位step参数
	constant NCO_wave_width : integer := 12 ;        --NCO 输出波形的位宽
	--对应的25个NCO phase step
	constant phase_note_0: std_logic_vector(NCO_phase_width - 1 downto 0) := (others => '0');
	constant phase_note_1: std_logic_vector(NCO_phase_width - 1 downto 0) := "0000000101010110111010110";
	constant phase_note_2: std_logic_vector(NCO_phase_width - 1 downto 0) := "0000000101101011010011110";
	constant phase_note_3: std_logic_vector(NCO_phase_width - 1 downto 0) := "0000000110000000111010011";
	constant phase_note_4: std_logic_vector(NCO_phase_width - 1 downto 0) := "0000000110010111110011010";
	constant phase_note_5: std_logic_vector(NCO_phase_width - 1 downto 0) := "0000000110110000000011010";
	constant phase_note_6: std_logic_vector(NCO_phase_width - 1 downto 0) := "0000000111001001101111011";
	constant phase_note_7: std_logic_vector(NCO_phase_width - 1 downto 0) := "0000000111100100111101011";
	constant phase_note_8: std_logic_vector(NCO_phase_width - 1 downto 0) := "0000001000000001110010111";
	constant phase_note_9: std_logic_vector(NCO_phase_width - 1 downto 0) := "0000001000100000010110010";
	constant phase_note_10: std_logic_vector(NCO_phase_width - 1 downto 0) := "0000001001000000101101111";
	constant phase_note_11: std_logic_vector(NCO_phase_width - 1 downto 0) := "0000001001100011000000101";
	constant phase_note_12: std_logic_vector(NCO_phase_width - 1 downto 0) := "0000001010000111010101111";
	constant phase_note_13: std_logic_vector(NCO_phase_width - 1 downto 0) := "0000001010101101110101100";
	constant phase_note_14: std_logic_vector(NCO_phase_width - 1 downto 0) := "0000001011010110100111100";
	constant phase_note_15: std_logic_vector(NCO_phase_width - 1 downto 0) := "0000001100000001110100110";
	constant phase_note_16: std_logic_vector(NCO_phase_width - 1 downto 0) := "0000001100101111100110100";
	constant phase_note_17: std_logic_vector(NCO_phase_width - 1 downto 0) := "0000001101100000000110011";
	constant phase_note_18: std_logic_vector(NCO_phase_width - 1 downto 0) := "0000001110010011011110110";
	constant phase_note_19: std_logic_vector(NCO_phase_width - 1 downto 0) := "0000001111001001111010110";
	constant phase_note_20: std_logic_vector(NCO_phase_width - 1 downto 0) := "0000010000000011100101111";
	constant phase_note_21: std_logic_vector(NCO_phase_width - 1 downto 0) := "0000010001000000101100100";
	constant phase_note_22: std_logic_vector(NCO_phase_width - 1 downto 0) := "0000010010000001011011110";
	constant phase_note_23: std_logic_vector(NCO_phase_width - 1 downto 0) := "0000010011000110000001011";
	constant phase_note_24: std_logic_vector(NCO_phase_width - 1 downto 0) := "0000010100001110101011111";
	
	--将音符信号转化为对应的NCO phase_step，用以控制NCO输出频率，暂未实现
	procedure note2phase_step(signal ndata : in std_logic_vector(notes_data_width - 1 downto 0);
		                       signal x : out std_logic_vector(NCO_phase_width - 1 downto 0));
									  

	
	-------------------------
	--ADSR
	-------------------------
	constant ADSR_note_out_width : integer := 24;                      --板载24位音频模块，ASDR输出结果24位

	
	
	
	-------------------------
	--WM8731 Audio Codec
	-------------------------
	--I2C对WM8731进行寄存器配置，8731从器件地址+寄存器地址+寄存器数据构成24位数据，每个寄存器进行一次I2C传输。
	
	-------------wm8731器件地址,最后一位指示读写r/w'------------
	constant wm8731_device_address : std_logic_vector(7 downto 0) := "00110100";
	constant wm8731_reg_dwidth : integer := 24;
	constant wm8731_reg_num : integer := 9;
	--以下为各配置寄存器的地址及数据，拼接为两个字节。由于只需要输出,部分寄存器无需配置保存默认值即可。
	
	-------------------耳机输出---------------------
	constant wm8731_left_headphone_config : std_logic_vector(wm8731_reg_dwidth - 1 downto 0) := wm8731_device_address & "0000010" & "011111001";
	constant wm8731_right_headphone_config : std_logic_vector(wm8731_reg_dwidth - 1 downto 0) := wm8731_device_address & "0000011" & "011111001";
	
	--------------模拟音频路径控制寄存器------------------
	constant wm8731_analogue_path_config : std_logic_vector(wm8731_reg_dwidth - 1 downto 0) := wm8731_device_address & "0000100" & "000010000"; 
	
	--------------数字音频路径控制寄存器------------------
	constant wm8731_digital_path_config : std_logic_vector(wm8731_reg_dwidth - 1 downto 0) := wm8731_device_address & "0000101" & "000000000"; 
	
	--------------power down控制寄存器-------------------
	constant wm8731_power_down_config : std_logic_vector(wm8731_reg_dwidth - 1 downto 0) := wm8731_device_address & "0000110" & "001100111"; 
	
	--------------数字音频接口格式控制寄存器-------------------
	--采用left justified进行传输
	constant wm8731_digital_interface_config : std_logic_vector(wm8731_reg_dwidth - 1 downto 0) := wm8731_device_address & "0000111" & "000001001"; 
	
	--------------采样控制寄存器-------------------
	--dac采样率96khz, mclk需要12.288mhz
	constant wm8731_sampling_config : std_logic_vector(wm8731_reg_dwidth - 1 downto 0) := wm8731_device_address & "0001000" & "000011100";
	
	--------------激活控制寄存器-------------------
	--写入该寄存器则芯片开始工作,因此该寄存器最后写入
	constant wm8731_active_config : std_logic_vector(wm8731_reg_dwidth - 1 downto 0) := wm8731_device_address & "0001001" & "000000001";
	
	--------------复位控制寄存器-------------------
	constant wm8731_reset_config : std_logic_vector(wm8731_reg_dwidth - 1 downto 0) := wm8731_device_address & "0001111" & "000000000";
	
	--在wm8731初始化时, 将寄存器计数值转化为对应的寄存器数据
	procedure codec_regcount2data(signal num : in integer range 0 to wm8731_reg_num; 
								         signal x : out std_logic_vector(wm8731_reg_dwidth - 1 downto 0));
	
	
	--若帧率相关有问题就去复制application note的值过来
	-------------------------
	--OV7670
	-------------------------
	--利用i2c对OV7670进行配置, 7670器件7bits地址 + 1bit读写指示
	constant ov7670_device_address : std_logic_vector(7 downto 0) := x"42";  --7670写地址x42
	--寄存器宽度及需要配置的寄存器个数
	constant ov7670_reg_dwidth : integer := 24;
	constant ov7670_reg_num : integer := 19 + 32;
	--ov7670输出Y数据为8位
	constant ov7670_output_width : integer := 8;
	--图像分辨率
	constant ov7670_image_width : integer := 320;
	constant ov7670_image_height : integer := 240;
	
	--以下为i2c写入数据. 器件地址 & 寄存器地址 & 寄存器值
	--------------复位及输出选择寄存器-------------------
	--暂不使用软件复位, 配置为RGB格式输出, QVGA. rgb+qvga为x"14", yuv+qvag为x"10"
	constant ov7670_reset_config : std_logic_vector(ov7670_reg_dwidth - 1 downto 0) := ov7670_device_address & x"12" & x"80";
	constant ov7670_reset_config_qvga : std_logic_vector(ov7670_reg_dwidth - 1 downto 0) := ov7670_device_address & x"12" & x"14";
	--------------时钟设置寄存器-------------------
	--输入时钟经过pll后的分频控制
	constant ov7670_clkreg_config : std_logic_vector(ov7670_reg_dwidth - 1 downto 0) := ov7670_device_address & x"11" & x"01";
	
	--------------PLL设置寄存器-------------------
	--pll设置. 此处将输出时钟乘4, 得到100mhz. 再经过上面的分频除以4, 得到25mhz, 作为摄像头内部工作时钟
	constant ov7670_pll_config : std_logic_vector(ov7670_reg_dwidth - 1 downto 0) := ov7670_device_address & x"6b" & x"4a";
	
	--------------PCLK及拉伸-------------------
	--normal PLCK, 不拉伸
	constant ov7670_pclk_config : std_logic_vector(ov7670_reg_dwidth - 1 downto 0) := ov7670_device_address & x"3e" & x"00";
	
	--------------输出范围设置-------------------
	--设置输出范围. 同时可以设置RGB输出格式. 此处设为rgb565, 输出范围00-ff
	constant ov7670_range_config : std_logic_vector(ov7670_reg_dwidth - 1 downto 0) := ov7670_device_address & x"40" & x"d0";
	
	--------------TLSB设置-------------------
	--正常YUV模式, 此寄存器第4位与x"3d"寄存器最低位共通选择YUV输出顺序
	--此外, 地址为3d的寄存器还可以管理gamma校正. 此处打开gamma,并且tlsb[3]=1 3d[0]=0, 输出顺序为UYVY, 低字节为Y值
	constant ov7670_tlsb_config : std_logic_vector(ov7670_reg_dwidth - 1 downto 0) := ov7670_device_address & x"3a" & x"00";
	constant ov7670_3d_config : std_logic_vector(ov7670_reg_dwidth - 1 downto 0) := ov7670_device_address & x"3d" & x"c0";
	
	--输出窗口相关设置, START和STOP应该就是帧/场同步信号的起始和结束计数值,设置320*640窗口
	--------------HREF设置-------------------
	constant ov7670_href_config : std_logic_vector(ov7670_reg_dwidth - 1 downto 0) := ov7670_device_address & x"32" & x"80";--80
	
	--------------VREF设置-------------------
	constant ov7670_vref_config : std_logic_vector(ov7670_reg_dwidth - 1 downto 0) := ov7670_device_address & x"03" & x"0a";--0a
	
	--------------HSTART设置-------------------
	constant ov7670_hstart_config : std_logic_vector(ov7670_reg_dwidth - 1 downto 0) := ov7670_device_address & x"17" & x"16";--16
	
	--------------HSTOP设置-------------------
	constant ov7670_hstop_config : std_logic_vector(ov7670_reg_dwidth - 1 downto 0) := ov7670_device_address & x"18" & x"04";--04
	
	--------------VSTART设置-------------------
	constant ov7670_vstart_config : std_logic_vector(ov7670_reg_dwidth - 1 downto 0) := ov7670_device_address & x"19" & x"02";--02
	
	--------------VSTOP设置-------------------
	constant ov7670_vstop_config : std_logic_vector(ov7670_reg_dwidth - 1 downto 0) := ov7670_device_address & x"1a" & x"7a";--7a
	
	--条纹滤波器配置
	--enable滤波器, 启自动增益补偿AGC, 自动白平衡AWB
	constant ov7670_filteren_config : std_logic_vector(ov7670_reg_dwidth - 1 downto 0) := ov7670_device_address & x"13" & x"e1";
	--50hz 设置
	constant ov7670_50hz1_config : std_logic_vector(ov7670_reg_dwidth - 1 downto 0) := ov7670_device_address & x"9d" & x"4c";
	constant ov7670_50hz2_config : std_logic_vector(ov7670_reg_dwidth - 1 downto 0) := ov7670_device_address & x"a5" & x"05";
	--选择50hz 的滤波器
	constant ov7670_filtersel_config : std_logic_vector(ov7670_reg_dwidth - 1 downto 0) := ov7670_device_address & x"3b" & x"0a";
	
	--白平衡增益使能, 同时管理自动de-noise功能
	constant ov7670_awbgain_config : std_logic_vector(ov7670_reg_dwidth - 1 downto 0) := ov7670_device_address & x"41" & x"08";
	
	--在ov7670初始化时, 将寄存器计数值转化为对应的寄存器数据
	procedure camera_regcount2data(signal num : in integer range 0 to ov7670_reg_num; 
								         signal x : out std_logic_vector(ov7670_reg_dwidth - 1 downto 0));

end package constants;

package body constants is
	--Audio_Controller
	--将输入音符信号转换成只其最低音信号。如识别出按下了40、41号键，则转换为只按下了40号键，方便前期系统搭建，后期可能会有所修改
	function rawnote2note(ndata : std_logic_vector(notes_data_width - 1 downto 0))
	return std_logic_vector is
		variable x : std_logic_vector(23 downto 0) := (others => '0');
		begin
			for i in 23 downto 0 loop
				if ndata(i) = '1' then
					x := (i => '1', others => '0');
					exit;
				else
					x(i) := '0';
				end if;
			end loop;
			return x;
	end function rawnote2note;
	
	--从音频信号得到NCO的phase_step用以控制频率
	procedure note2phase_step(signal ndata : in std_logic_vector(notes_data_width - 1 downto 0);
				                 signal x : out std_logic_vector(NCO_phase_width - 1 downto 0)) is
		begin
			case ndata is
			when note_1 => x <= phase_note_1;
			when note_2 => x <= phase_note_2;
			when note_3 => x <= phase_note_3;
			when note_4 => x <= phase_note_4;
			when note_5 => x <= phase_note_5;
			when note_6 => x <= phase_note_6;
			when note_7 => x <= phase_note_7;
			when note_8 => x <= phase_note_8;
			when note_9 => x <= phase_note_9;
			when note_10 => x <= phase_note_10;
			when note_11 => x <= phase_note_11;
			when note_12 => x <= phase_note_12;
			when note_13 => x <= phase_note_13;
			when note_14 => x <= phase_note_14;
			when note_15 => x <= phase_note_15;
			when note_16 => x <= phase_note_16;
			when note_17 => x <= phase_note_17;
			when note_18 => x <= phase_note_18;
			when note_19 => x <= phase_note_19;
			when note_20 => x <= phase_note_20;
			when note_21 => x <= phase_note_21;
			when note_22 => x <= phase_note_22;
			when note_23 => x <= phase_note_23;
			when note_24 => x <= phase_note_24;
			when others => x <= phase_note_0;
			end case;
	end procedure note2phase_step;
	
	--在wm8731初始化时, 将寄存器计数值转化为对应的寄存器数据
	procedure codec_regcount2data(signal num : in integer range 0 to wm8731_reg_num; 
								         signal x : out std_logic_vector(wm8731_reg_dwidth - 1 downto 0)) is
	begin
		case num is
		when 0 => x <= wm8731_reset_config;
		when 1 => x <= wm8731_left_headphone_config;
		when 2 => x <= wm8731_right_headphone_config;
		when 3 => x <= wm8731_analogue_path_config;
		when 4 => x <= wm8731_digital_path_config;
		when 5 => x <= wm8731_power_down_config;
		when 6 => x <= wm8731_digital_interface_config;
		when 7 => x <= wm8731_sampling_config;
		when 8 => x <= wm8731_active_config;
		when others => x <= (others => '0');
		end case;
	end procedure codec_regcount2data;

	--在摄像头初始化时, 将寄存器计数值转化为对应的寄存器数据
	procedure camera_regcount2data(signal num : in integer range 0 to ov7670_reg_num; 
								         signal x : out std_logic_vector(ov7670_reg_dwidth - 1 downto 0)) is
	begin
		case num is
		when 0 => x <= ov7670_reset_config;
		when 1 => x <= ov7670_reset_config_qvga;
		when 2 => x <= ov7670_clkreg_config; 
		when 3 => x <= ov7670_pll_config;
		when 4 => x <= ov7670_pclk_config;
		when 5 => x <= ov7670_range_config;
		when 6 => x <= ov7670_tlsb_config;
		when 7 => x <= ov7670_3d_config;
		when 8 => x <= ov7670_href_config;
		when 9 => x <= ov7670_vref_config;
		when 10 => x <= ov7670_hstart_config;
		when 11 => x <= ov7670_hstop_config;
		when 12 => x <= ov7670_vstart_config;
		when 13 => x <= ov7670_vstop_config;
		when 14 => x <= ov7670_filtersel_config;
		when 15 => x <= ov7670_50hz1_config;
		when 16 => x <= ov7670_50hz2_config;
		when 17 => x <= ov7670_filteren_config;
		when 18 => x <= ov7670_awbgain_config;
		--自动黑电平校正相关配置
		when 19 => x <= ov7670_device_address & x"b084";
		when 20 => x <= ov7670_device_address & x"b10c";
		when 21 => x <= ov7670_device_address & x"b20e";
		when 22 => x <= ov7670_device_address & x"b382";
		when 23 => x <= ov7670_device_address & x"b80a";
		--色彩矩阵
		when 24 => x <= ov7670_device_address & x"4f80";
		when 25 => x <= ov7670_device_address & x"5080";
		when 26 => x <= ov7670_device_address & x"5100";
		when 27 => x <= ov7670_device_address & x"5222";
		when 28 => x <= ov7670_device_address & x"535e";
		when 29 => x <= ov7670_device_address & x"5480";
		when 30 => x <= ov7670_device_address & x"589e";
		--gamma参数
		when 31 => x <= ov7670_device_address & x"7a20";
		when 32 => x <= ov7670_device_address & x"7b1c";
		when 33 => x <= ov7670_device_address & x"7c28";
		when 34 => x <= ov7670_device_address & x"7d3c";
		when 35 => x <= ov7670_device_address & x"7e55";
		when 36 => x <= ov7670_device_address & x"7f68";
		when 37 => x <= ov7670_device_address & x"8076";
		when 38 => x <= ov7670_device_address & x"8180";
		when 39 => x <= ov7670_device_address & x"8288";
		when 40 => x <= ov7670_device_address & x"838f";
		when 41 => x <= ov7670_device_address & x"8496";
		when 42 => x <= ov7670_device_address & x"85a3";
		when 43 => x <= ov7670_device_address & x"86af";
		when 44 => x <= ov7670_device_address & x"87c4";
		when 45 => x <= ov7670_device_address & x"88d7";
		when 46 => x <= ov7670_device_address & x"89e8";
		--设置蓝色, 红色增益, 绿色增益
		when 47 => x <= ov7670_device_address & x"0164";
		when 48 => x <= ov7670_device_address & x"024f";
		when 49 => x <= ov7670_device_address & x"6a40";
		--噪声抑制等级
		when 50 => x <= ov7670_device_address & x"4cff";
		--awb控制参数 magic
--		when 47 => x <= ov7670_device_address & x"4314";
--		when 48 => x <= ov7670_device_address & x"44f0";
--		when 49 => x <= ov7670_device_address & x"4534";
--		when 50 => x <= ov7670_device_address & x"4658";
--		when 51 => x <= ov7670_device_address & x"4728";
--		when 52 => x <= ov7670_device_address & x"483a";
--		when 53 => x <= ov7670_device_address & x"5988";
--		when 54 => x <= ov7670_device_address & x"5a88";
--		when 55 => x <= ov7670_device_address & x"5b44";
--		when 56 => x <= ov7670_device_address & x"5c67";
--		when 57 => x <= ov7670_device_address & x"5d49";
--		when 58 => x <= ov7670_device_address & x"5e0e";
		
		when others => x<= (others => '1');
		end case;
	end procedure camera_regcount2data;

end constants;




