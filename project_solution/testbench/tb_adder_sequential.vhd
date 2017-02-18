library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_adder_sequential is
end tb_adder_sequential;

architecture test of tb_adder_sequential is

    constant CLK_PERIOD : time := 100 ns;

    -- Signal used to end simulator when we finished submitting our test cases
    signal sim_finished : boolean := false;

    -- adder_sequential GENERICS
    constant N_BITS : positive range 2 to positive'right := 4;

    -- adder_sequential PORTS
    signal CLK   : std_logic;
    signal RST   : std_logic;
    signal START : std_logic;
    signal OP1   : std_logic_vector(N_BITS - 1 downto 0);
    signal OP2   : std_logic_vector(N_BITS - 1 downto 0);
    signal SUM   : std_logic_vector(N_BITS downto 0);
    signal DONE  : std_logic;

begin

    -- Instantiate DUT
    dut : entity work.adder_sequential
    generic map(N_BITS => N_BITS)
    port map(CLK   => CLK,
             RST   => RST,
             START => START,
             OP1   => OP1,
             OP2   => OP2,
             SUM   => SUM,
             DONE  => DONE);

    -- Generate CLK signal
    clk_generation : process
    begin
        if not sim_finished then
            clk <= '1';
            wait for CLK_PERIOD / 2;
            clk <= '0';
            wait for CLK_PERIOD / 2;
        else
            wait;
        end if;
    end process clk_generation;

    -- Test adder_sequential
    simulation : process

        procedure async_reset is
        begin
            wait until rising_edge(CLK);
            wait for CLK_PERIOD / 4;
            RST <= '1';

            wait for CLK_PERIOD / 2;
            RST <= '0';
        end procedure async_reset;

        procedure check_add(constant in1 : in natural; constant in2 : in natural; constant res_expected : in natural) is
            variable res : natural;
        begin
            -- Our circuit is sensitive to the rising edge of the CLK, so we
            -- need to be sure to assign signal values such that they are stable
            -- at the next rising edge of the CLK.
            wait until rising_edge(CLK);

            -- Assign values to circuit inputs.
            OP1   <= std_logic_vector(to_unsigned(in1, OP1'length));
            OP2   <= std_logic_vector(to_unsigned(in2, OP2'length));
            START <= '1';

            -- OP1, OP2 and START are NOT yet assigned. We have to wait for some
            -- time for the simulator to "propagate" their values. Any
            -- infinitesimal period would work for the simulator to "propagate"
            -- the values. However, our circuit is a sequential circuit
            -- sensitive to the rising edge of CLK, so we need to hold our
            -- signal assignments until the next rising edge of CLK so the
            -- circuit can see them.
            wait until rising_edge(CLK);

            -- Remove values from circuit inputs. The circuit works with a PULSE
            -- on its START input, which means that data on the inputs only
            -- needs to be valid when START is high.
            OP1   <= (others => '0');
            OP2   <= (others => '0');
            START <= '0';

            -- The circuit informs us it has finished by asserting DONE, so we
            -- can wait until we receive the signal before proceeding. DONE is
            -- asserted at the rising edge of CLK, so we (the test system) can
            -- sample the data and check its correctness.
            wait until DONE = '1';

            -- Check output against expected result.
            res := to_integer(unsigned(SUM));
            assert res = res_expected
            report "Unexpected result: " &
                   "OP1 = " & integer'image(in1) & "; " &
                   "OP2 = " & integer'image(in2) & "; " &
                   "SUM = " & integer'image(res) & "; " &
                   "SUM_expected = " & integer'image(res_expected)
            severity error;

            -- Wait for the circuit to go back into the IDLE state.
            wait until DONE = '0';
        end procedure check_add;

    begin

        -- Default values
        OP1   <= (others => '0');
        OP2   <= (others => '0');
        RST   <= '0';
        START <= '0';
        wait for CLK_PERIOD;

        -- Reset the circuit.
        async_reset;

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

        -- Instruct "clk_generation" process to halt execution.
        sim_finished <= true;

        -- Make this process wait indefinitely (it will never re-execute from
        -- its beginning again).
        wait;
    end process simulation;

end architecture test;
