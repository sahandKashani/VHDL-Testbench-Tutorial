-- #############################################################################
-- adder_combinatorial.vhd
-- =======================
-- Simple combinatorial ripple-carry adder.
--
-- Author        : Sahand Kashani-Akhavan [sahand.kashani-akhavan@epfl.ch]
-- Revision      : 1.0
-- Last modified : 2017.02.17
-- #############################################################################

library ieee;
use ieee.std_logic_1164.all;

entity adder_combinatorial is
    generic(
        N_BITS : positive range 2 to positive'right  -- Operand size in bits
    );
    port(
        OP1 : in  std_logic_vector(N_BITS - 1 downto 0);  -- N-bit input.
        OP2 : in  std_logic_vector(N_BITS - 1 downto 0);  -- N-bit input.
        SUM : out std_logic_vector(N_BITS downto 0)  -- (N+1)-bit output.
    );
end entity adder_combinatorial;

architecture ripple_carry of adder_combinatorial is

    signal carry_in : std_logic_vector(N_BITS downto 0);

begin

    carry_in(0) <= '0';

    full_adder_generation : for i in 0 to N_BITS - 1 generate
        full_adder_X_inst : entity work.full_adder
        port map(
            OP1   => OP1(i),
            OP2   => OP2(i),
            C_IN  => carry_in(i),
            SUM   => SUM(i),
            C_OUT => carry_in(i + 1)
        );
    end generate full_adder_generation;

    SUM(N_BITS) <= carry_in(N_BITS);

end architecture ripple_carry;
