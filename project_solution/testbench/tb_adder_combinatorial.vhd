library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_adder_combinatorial is
end tb_adder_combinatorial;

architecture test of tb_adder_combinatorial is

    -- "Time" that will elapse between test vectors we submit to the component.
    constant TIME_DELTA : time := 100 ns;

    -- adder_combinatorial GENERICS
    constant N_BITS : positive range 2 to positive'right := 4;

    -- adder_combinatorial PORTS
    signal OP1 : std_logic_vector(N_BITS - 1 downto 0);
    signal OP2 : std_logic_vector(N_BITS - 1 downto 0);
    signal SUM : std_logic_vector(N_BITS downto 0);

begin

    -- Instantiate DUT
    dut : entity work.adder_combinatorial
    generic map(N_BITS => N_BITS)
    port map(OP1 => OP1,
             OP2 => OP2,
             SUM => SUM);

    -- Test adder_combinatorial
    simulation : process

        procedure check_add(constant in1 : in natural; constant in2 : in natural; constant res_expected : in natural) is
            variable res : natural;
        begin
            -- Assign values to circuit inputs.
            OP1 <= std_logic_vector(to_unsigned(in1, OP1'length));
            OP2 <= std_logic_vector(to_unsigned(in2, OP2'length));

            -- OP1 and OP2 are NOT yet assigned. We have to wait for some time
            -- for the simulator to "propagate" their values. Any infinitesimal
            -- period would work here since we are testing a combinatorial
            -- circuit.
            wait for TIME_DELTA;

            -- Check output against expected result.
            res := to_integer(unsigned(SUM));
            assert res = res_expected
            report "Unexpected result: " &
                   "OP1 = " & integer'image(in1) & "; " &
                   "OP2 = " & integer'image(in2) & "; " &
                   "SUM = " & integer'image(res) & "; " &
                   "SUM_expected = " & integer'image(res_expected)
            severity error;
        end procedure check_add;

    begin

        -- Check test vectors against expected outputs
        check_add(12, 8, 20);
        check_add(10, 6, 16);
        check_add(4, 1, 5);
        check_add(11, 7, 18);
        check_add(10, 13, 23);
        check_add(8, 7, 15);
        check_add(1, 9, 10);
        check_add(7, 3, 10);
        check_add(1, 4, 5);
        check_add(8, 0, 8);

        -- Make this process wait indefinitely (it will never re-execute from
        -- its beginning again).
        wait;
    end process simulation;

end architecture test;
