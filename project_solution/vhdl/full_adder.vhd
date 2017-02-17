-- #############################################################################
-- full_adder.vhd
-- ==============
-- Combinatorial full adder.
--
-- Author        : Sahand Kashani-Akhavan [sahand.kashani-akhavan@epfl.ch]
-- Revision      : 1.0
-- Last modified : 2017.02.15
-- #############################################################################

library ieee;
use ieee.std_logic_1164.all;

entity full_adder is
    port(
        OP1   : in  std_logic;          -- 1-bit input.
        OP2   : in  std_logic;          -- 1-bit input.
        C_IN  : in  std_logic;          -- 1-bit input carry.
        SUM   : out std_logic;          -- 1-bit sum.
        C_OUT : out std_logic           -- 1-bit output carry.
    );
end entity full_adder;

architecture rtl of full_adder is
begin
    SUM   <= OP1 xor OP2 xor C_IN;
    C_OUT <= (OP1 and OP2) or (C_IN and OP1) or (C_IN and OP2);
end architecture rtl;
