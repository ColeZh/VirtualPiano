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
-- Generated on "05/08/2020 14:43:45"
                                                            
-- Vhdl Test Bench template for design  :  RGB2HSV
-- 
-- Simulation tool : ModelSim (VHDL)
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                
use ieee.std_logic_unsigned.all;

ENTITY RGB2HSV_vhd_tst IS
END RGB2HSV_vhd_tst;
ARCHITECTURE RGB2HSV_arch OF RGB2HSV_vhd_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL fsyn_in : STD_LOGIC;
SIGNAL fsyn_out : STD_LOGIC;
SIGNAL H : STD_LOGIC_VECTOR(8 DOWNTO 0);
SIGNAL pclk_in : STD_LOGIC := '0';
SIGNAL pclk_out : STD_LOGIC;
SIGNAL rgb_data : STD_LOGIC_VECTOR(15 DOWNTO 0) := x"b168";
SIGNAL rst_n : STD_LOGIC;
SIGNAL S : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL V : STD_LOGIC_VECTOR(7 DOWNTO 0);
COMPONENT RGB2HSV
	PORT (
	fsyn_in : IN STD_LOGIC;
	fsyn_out : OUT STD_LOGIC;
	H : OUT STD_LOGIC_VECTOR(8 DOWNTO 0);
	pclk_in : IN STD_LOGIC;
	pclk_out : OUT STD_LOGIC;
	rgb_data : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
	rst_n : IN STD_LOGIC;
	S : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	V : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END COMPONENT;
BEGIN
	i1 : RGB2HSV
	PORT MAP (
-- list connections between master ports and signals
	fsyn_in => fsyn_in,
	fsyn_out => fsyn_out,
	H => H,
	pclk_in => pclk_in,
	pclk_out => pclk_out,
	rgb_data => rgb_data,
	rst_n => rst_n,
	S => S,
	V => V
	);
init : PROCESS                                               
-- variable declarations                                     
BEGIN                                                        
rst_n <= '0';               
wait for 10 ns;
rst_n <= '1';
WAIT;                                              
END PROCESS init;                                           
always : PROCESS                                              
-- optional sensitivity list                                  
-- (        )                                                 
-- variable declarations                                      
BEGIN                                                         
wait for 40 ns;                                                     
END PROCESS always;                                          
END RGB2HSV_arch;
