-- Copyright (C) 1991-2013 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- ***************************************************************************
-- This file contains a Vhdl test bench template that is freely editable to   
-- suit user's needs .Comments are provided in each section to help the user  
-- fill out necessary details.                                                
-- ***************************************************************************
-- Generated on "05/04/2020 19:57:59"
                                                            
-- Vhdl Test Bench template for design  :  ram_wr_ctler
-- 
-- Simulation tool : ModelSim (VHDL)
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                
use ieee.std_logic_unsigned.all;

ENTITY ram_wr_ctler_vhd_tst IS
END ram_wr_ctler_vhd_tst;
ARCHITECTURE ram_wr_ctler_arch OF ram_wr_ctler_vhd_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL fsyn : STD_LOGIC;
SIGNAL pclk : STD_LOGIC := '0';
SIGNAL pixel_data : STD_LOGIC_VECTOR(15 DOWNTO 0) := (others => '0');
SIGNAL ram_address : STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL ram_data : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL ram_wrclk : STD_LOGIC;
SIGNAL ram_wren : STD_LOGIC;
SIGNAL rst_n : STD_LOGIC;
COMPONENT ram_wr_ctler
	PORT (
	fsyn : IN STD_LOGIC;
	pclk : IN STD_LOGIC;
	pixel_data : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
	ram_address : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
	ram_data : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
	ram_wrclk : OUT STD_LOGIC;
	ram_wren : OUT STD_LOGIC;
	rst_n : IN STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : ram_wr_ctler
	PORT MAP (
-- list connections between master ports and signals
	fsyn => fsyn,
	pclk => pclk,
	pixel_data => pixel_data,
	ram_address => ram_address,
	ram_data => ram_data,
	ram_wrclk => ram_wrclk,
	ram_wren => ram_wren,
	rst_n => rst_n
	);
init : PROCESS                                               
-- variable declarations                                     
BEGIN                                                        
fsyn <= '0';
rst_n <= '0';
wait for 20 ns;
rst_n <= '1';
wait for 60 ns;
fsyn <= '1';                 
WAIT;                                                       
END PROCESS init;                                           
always : PROCESS                                              
-- optional sensitivity list                                  
-- (        )                                                 
-- variable declarations                                      
BEGIN                                                         
wait for 40 ns;
pclk <= not pclk;
pixel_data <= pixel_data + 1;                                                       
END PROCESS always;                                          
END ram_wr_ctler_arch;
