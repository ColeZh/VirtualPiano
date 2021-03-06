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
-- Generated on "04/30/2020 10:00:05"
                                                            
-- Vhdl Test Bench template for design  :  VirtualPiano
-- 
-- Simulation tool : ModelSim (VHDL)
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY VirtualPiano_vhd_tst IS
END VirtualPiano_vhd_tst;
ARCHITECTURE VirtualPiano_arch OF VirtualPiano_vhd_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL clk_50m : STD_LOGIC;
SIGNAL href : STD_LOGIC;
SIGNAL i2c_scl : STD_LOGIC;
SIGNAL i2c_sda : STD_LOGIC;
SIGNAL pclk : STD_LOGIC;
SIGNAL pixel_data : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL rst_n : STD_LOGIC;
SIGNAL VGA_B : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL VGA_BLANK_N : STD_LOGIC;
SIGNAL VGA_CLK : STD_LOGIC;
SIGNAL VGA_G : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL VGA_HS : STD_LOGIC;
SIGNAL VGA_R : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL VGA_SYNC_N : STD_LOGIC;
SIGNAL VGA_VS : STD_LOGIC;
SIGNAL vsyn : STD_LOGIC;
SIGNAL xclk_25m : STD_LOGIC;
COMPONENT VirtualPiano
	PORT (
	clk_50m : IN STD_LOGIC;
	href : IN STD_LOGIC;
	i2c_scl : OUT STD_LOGIC;
	i2c_sda : OUT STD_LOGIC;
	pclk : IN STD_LOGIC;
	pixel_data : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
	rst_n : IN STD_LOGIC;
	VGA_B : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	VGA_BLANK_N : OUT STD_LOGIC;
	VGA_CLK : OUT STD_LOGIC;
	VGA_G : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	VGA_HS : OUT STD_LOGIC;
	VGA_R : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	VGA_SYNC_N : OUT STD_LOGIC;
	VGA_VS : OUT STD_LOGIC;
	vsyn : IN STD_LOGIC;
	xclk_25m : OUT STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : VirtualPiano
	PORT MAP (
-- list connections between master ports and signals
	clk_50m => clk_50m,
	href => href,
	i2c_scl => i2c_scl,
	i2c_sda => i2c_sda,
	pclk => pclk,
	pixel_data => pixel_data,
	rst_n => rst_n,
	VGA_B => VGA_B,
	VGA_BLANK_N => VGA_BLANK_N,
	VGA_CLK => VGA_CLK,
	VGA_G => VGA_G,
	VGA_HS => VGA_HS,
	VGA_R => VGA_R,
	VGA_SYNC_N => VGA_SYNC_N,
	VGA_VS => VGA_VS,
	vsyn => vsyn,
	xclk_25m => xclk_25m
	);
init : PROCESS                                               
-- variable declarations                                     
BEGIN                                                        
        -- code that executes only once                      
WAIT;                                                       
END PROCESS init;                                           
always : PROCESS                                              
-- optional sensitivity list                                  
-- (        )                                                 
-- variable declarations                                      
BEGIN                                                         
        -- code executes for every event on sensitivity list  
WAIT;                                                        
END PROCESS always;                                          
END VirtualPiano_arch;
