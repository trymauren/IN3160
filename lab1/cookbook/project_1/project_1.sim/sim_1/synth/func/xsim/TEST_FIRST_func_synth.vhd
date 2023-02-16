-- Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2020.2 (lin64) Build 3064766 Wed Nov 18 09:12:47 MST 2020
-- Date        : Wed Feb  1 14:54:12 2023
-- Host        : louth.ifi.uio.no running 64-bit Red Hat Enterprise Linux release 8.7 (Ootpa)
-- Command     : write_vhdl -mode funcsim -nolib -force -file
--               /uio/hume/student-u06/tsauren/Documents/IN3160/lab1/cookbook/project_1/project_1.sim/sim_1/synth/func/xsim/TEST_FIRST_func_synth.vhd
-- Design      : FIRST
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7z020clg484-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity FIRST is
  port (
    clk : in STD_LOGIC;
    reset : in STD_LOGIC;
    load : in STD_LOGIC;
    inp : in STD_LOGIC_VECTOR ( 3 downto 0 );
    count : out STD_LOGIC_VECTOR ( 3 downto 0 );
    max_count : out STD_LOGIC;
    min_count : out STD_LOGIC;
    up : in STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of FIRST : entity is true;
end FIRST;

architecture STRUCTURE of FIRST is
  signal clk_IBUF : STD_LOGIC;
  signal clk_IBUF_BUFG : STD_LOGIC;
  signal \count[3]_i_2_n_0\ : STD_LOGIC;
  signal \count[3]_i_3_n_0\ : STD_LOGIC;
  signal count_OBUF : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal count_i : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal inp_IBUF : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal load_IBUF : STD_LOGIC;
  signal max_count_OBUF : STD_LOGIC;
  signal min_count_OBUF : STD_LOGIC;
  signal reset_IBUF : STD_LOGIC;
  signal up_IBUF : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of max_count_OBUF_inst_i_1 : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of min_count_OBUF_inst_i_1 : label is "soft_lutpair0";
begin
clk_IBUF_BUFG_inst: unisim.vcomponents.BUFG
     port map (
      I => clk_IBUF,
      O => clk_IBUF_BUFG
    );
clk_IBUF_inst: unisim.vcomponents.IBUF
     port map (
      I => clk,
      O => clk_IBUF
    );
\count[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"8B"
    )
        port map (
      I0 => inp_IBUF(0),
      I1 => load_IBUF,
      I2 => count_OBUF(0),
      O => count_i(0)
    );
\count[1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"C5CACAC5"
    )
        port map (
      I0 => up_IBUF,
      I1 => inp_IBUF(1),
      I2 => load_IBUF,
      I3 => count_OBUF(1),
      I4 => count_OBUF(0),
      O => count_i(1)
    );
\count[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"C5CFCFCACAC0C0C5"
    )
        port map (
      I0 => up_IBUF,
      I1 => inp_IBUF(2),
      I2 => load_IBUF,
      I3 => count_OBUF(1),
      I4 => count_OBUF(0),
      I5 => count_OBUF(2),
      O => count_i(2)
    );
\count[3]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BBBBBBB88888888B"
    )
        port map (
      I0 => inp_IBUF(3),
      I1 => load_IBUF,
      I2 => count_OBUF(2),
      I3 => count_OBUF(0),
      I4 => count_OBUF(1),
      I5 => count_OBUF(3),
      O => \count[3]_i_2_n_0\
    );
\count[3]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8BBBBBBBB8888888"
    )
        port map (
      I0 => inp_IBUF(3),
      I1 => load_IBUF,
      I2 => count_OBUF(0),
      I3 => count_OBUF(1),
      I4 => count_OBUF(2),
      I5 => count_OBUF(3),
      O => \count[3]_i_3_n_0\
    );
\count_OBUF[0]_inst\: unisim.vcomponents.OBUF
     port map (
      I => count_OBUF(0),
      O => count(0)
    );
\count_OBUF[1]_inst\: unisim.vcomponents.OBUF
     port map (
      I => count_OBUF(1),
      O => count(1)
    );
\count_OBUF[2]_inst\: unisim.vcomponents.OBUF
     port map (
      I => count_OBUF(2),
      O => count(2)
    );
\count_OBUF[3]_inst\: unisim.vcomponents.OBUF
     port map (
      I => count_OBUF(3),
      O => count(3)
    );
\count_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      CLR => reset_IBUF,
      D => count_i(0),
      Q => count_OBUF(0)
    );
\count_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      CLR => reset_IBUF,
      D => count_i(1),
      Q => count_OBUF(1)
    );
\count_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      CLR => reset_IBUF,
      D => count_i(2),
      Q => count_OBUF(2)
    );
\count_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      CLR => reset_IBUF,
      D => count_i(3),
      Q => count_OBUF(3)
    );
\count_reg[3]_i_1\: unisim.vcomponents.MUXF7
     port map (
      I0 => \count[3]_i_2_n_0\,
      I1 => \count[3]_i_3_n_0\,
      O => count_i(3),
      S => up_IBUF
    );
\inp_IBUF[0]_inst\: unisim.vcomponents.IBUF
     port map (
      I => inp(0),
      O => inp_IBUF(0)
    );
\inp_IBUF[1]_inst\: unisim.vcomponents.IBUF
     port map (
      I => inp(1),
      O => inp_IBUF(1)
    );
\inp_IBUF[2]_inst\: unisim.vcomponents.IBUF
     port map (
      I => inp(2),
      O => inp_IBUF(2)
    );
\inp_IBUF[3]_inst\: unisim.vcomponents.IBUF
     port map (
      I => inp(3),
      O => inp_IBUF(3)
    );
load_IBUF_inst: unisim.vcomponents.IBUF
     port map (
      I => load,
      O => load_IBUF
    );
max_count_OBUF_inst: unisim.vcomponents.OBUF
     port map (
      I => max_count_OBUF,
      O => max_count
    );
max_count_OBUF_inst_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8000"
    )
        port map (
      I0 => count_OBUF(1),
      I1 => count_OBUF(0),
      I2 => count_OBUF(2),
      I3 => count_OBUF(3),
      O => max_count_OBUF
    );
min_count_OBUF_inst: unisim.vcomponents.OBUF
     port map (
      I => min_count_OBUF,
      O => min_count
    );
min_count_OBUF_inst_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => count_OBUF(2),
      I1 => count_OBUF(3),
      I2 => count_OBUF(1),
      I3 => count_OBUF(0),
      O => min_count_OBUF
    );
reset_IBUF_inst: unisim.vcomponents.IBUF
     port map (
      I => reset,
      O => reset_IBUF
    );
up_IBUF_inst: unisim.vcomponents.IBUF
     port map (
      I => up,
      O => up_IBUF
    );
end STRUCTURE;
