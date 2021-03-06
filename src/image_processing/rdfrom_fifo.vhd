---------------------------------------------------------------------------------
---------------------------------------------------------------------------------
--rdfrom_fifo
--
-- 功能: 监测到camera_ctler的frame_ready信号后, 开始读取一帧数据, 同时向输出数据以及
--       data_valid供后续模块使用. 
--
-- 描述: 由简单状态机控制. idle态监测到frame_ready信号后, 先拉高rd_req电平, 然后
--       进行数据读取. 50mhz读取fifo数据太快了, 因此分频成25mhz读取
---------------------------------------------------------------------------------
---------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use work.constants.all;
-------------------------------------------------------
-------------------------------------------------------
entity rdfrom_fifo is
generic(
	pixel_data_width : integer := ov7670_output_width;
	image_width : integer := ov7670_image_width;
	image_height : integer := ov7670_image_height
);
port(
	--输入
	rst_n : in std_logic;
	clk_50m : in std_logic;
	
	--输出data_valid信号, 输出x个字节则该信号就置位x+1个时钟周期
	data_valid : out std_logic;
	
	--输出像素数据, 与fifo数据相同
	output_data : out std_logic_vector(pixel_data_width - 1 downto 0);
	
	--输出像素同步时钟
	clk_pixel : out std_logic;
	
	--与fifo交互
	pixel_data : in std_logic_vector(pixel_data_width - 1 downto 0);   --fifo输出数据
	rd_empty : in std_logic;          --读空信号. 若时序控制正确则此信号应在计数器最大时才有效
	rd_clk : out std_logic;           --读时钟
	rd_req : out std_logic;           --读请求
	
	--camera_controller输入的帧可读取信号
	frame_ready : in std_logic        --帧可读取信号
);
end entity rdfrom_fifo;
-------------------------------------------------------
-------------------------------------------------------
architecture bhv of rdfrom_fifo is
	--像素点总数及读取计数信号. 因为一个像素点由两个字节数据, 因此此处乘2
	constant pixel_num : integer := image_width * image_height * 2;
	signal pixel_count : integer range 0 to pixel_num := 0;
	signal pixel_count_en : std_logic := '0';

	--定义状态
	type state is (idle, set_req, read_data);
	signal cur_state : state := idle;
	signal next_state : state := idle;
	
	--25mhz时钟
	signal clk_25m : std_logic := '0';
	
begin
	--输出赋值
	clk_pixel <= clk_25m;
	rd_clk <= clk_25m;
	output_data <= pixel_data;
	
	--25mhz时钟产生
	process(rst_n, clk_50m)
	begin
		if(rst_n = '0') then
			clk_25m <= '0';
		elsif(clk_50m'event and clk_50m = '1') then
			clk_25m <= not clk_25m;
		end if;
	end process;
	
	--像素读取计数器
	process(rst_n, clk_25m)
	begin
		if(rst_n = '0') then
			pixel_count <= 0;
		elsif(clk_25m'event and clk_25m = '1') then
			if(pixel_count_en = '0' or pixel_count = pixel_num) then
				pixel_count <= 0;
			else
				pixel_count <= pixel_count + 1;
			end if;
		end if;
	end process;
	
	--状态转移进程
	process(rst_n, clk_25m)
	begin
		if(rst_n = '0') then
			cur_state <= idle;
		elsif(clk_25m'event and clk_25m = '1') then
			cur_state <= next_state;
		end if;
	end process;
	
	--次态控制进程
	process(cur_state, pixel_count, frame_ready, rd_empty)
	begin
		next_state <= cur_state;
		
		case cur_state is
		when idle =>
			if(frame_ready = '1') then
				next_state <= set_req;
			else
				next_state <= idle;
			end if;
		
		when set_req =>
			if(rd_empty = '1') then
				next_state <= idle;
			else
				next_state <= read_data;
			end if;
		
		when read_data =>
			if(rd_empty = '1' or pixel_count = pixel_num) then
				next_state <= idle;
			else
				next_state <= read_data;
			end if;
		
		when others => null;
		end case;
	end process;
	
	--相关信号输出控制
	process(cur_state)
	begin
		case cur_state is
		when idle =>
			pixel_count_en <= '0';
			data_valid <= '0';
			rd_req <= '0';
			
		when set_req =>
			pixel_count_en <= '1';
			data_valid <= '1';
			rd_req <= '1';
		
		when read_data =>
			pixel_count_en <= '1';
			data_valid <= '1';
			rd_req <= '1';
		
		when others => null;
		end case;
	end process;


end architecture bhv;













