-- #############################################################################
-- adder_sequential.vhd
-- ====================
-- Simple sequential ripple-carry adder.
--
-- Author        : Sahand Kashani-Akhavan [sahand.kashani-akhavan@epfl.ch]
-- Revision      : 1.0
-- Last modified : 2017.02.17
-- #############################################################################

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity adder_sequential is
    generic(
        N_BITS : positive range 2 to positive'right     -- Operand size in bits
    );
    port(
        CLK   : in  std_logic;
        RST   : in  std_logic;
        START : in  std_logic;          -- Start pulse
        OP1   : in  std_logic_vector(N_BITS - 1 downto 0);  -- N-bit input.
        OP2   : in  std_logic_vector(N_BITS - 1 downto 0);  -- N-bit input.
        SUM   : out std_logic_vector(N_BITS downto 0);  -- (N+1)-bit output.
        DONE  : out std_logic           -- Done pulse
    );
end entity adder_sequential;

architecture rtl of adder_sequential is

    -- Operand registers (extended to same size as SUM register)
    signal reg_op1, reg_op2 : std_logic_vector(N_BITS downto 0);
    signal operand_load     : std_logic;
    signal operand_shift    : std_logic;

    -- Carry_in register
    signal reg_carry_in : std_logic;
    signal carry_in_en  : std_logic;
    signal carry_in_clr : std_logic;

    -- Sum register
    signal reg_sum : std_logic_vector(N_BITS downto 0);

    -- Sum register enable register (the enable signal is a register)
    signal reg_sum_en   : std_logic_vector(N_BITS downto 0);
    signal sum_en_load  : std_logic;
    signal sum_en_shift : std_logic;

    -- State register
    type state_type is (STATE_IDLE, STATE_ADD_BIT_X, STATE_DONE);
    signal reg_state, next_reg_state : state_type;

    -- Full Adder outputs
    signal fa_SUM   : std_logic;
    signal fa_C_OUT : std_logic;

begin

    -- Operand registers
    process(RST, CLK)
    begin
        if RST = '1' then
            reg_op1 <= (others => '0');
            reg_op2 <= (others => '0');
        elsif rising_edge(CLK) then
            if operand_load = '1' then
                -- preprend '0' bit to make registers same size as SUM
                reg_op1 <= '0' & OP1;
                reg_op2 <= '0' & OP2;
            elsif operand_shift = '1' then
                -- right-shift
                reg_op1 <= '0' & reg_op1(N_BITS downto 1);
                reg_op2 <= '0' & reg_op2(N_BITS downto 1);
            end if;
        end if;
    end process;

    -- Carry_in register
    process(RST, CLK)
    begin
        if RST = '1' then
            reg_carry_in <= '0';
        elsif rising_edge(CLK) then
            if carry_in_clr = '1' then
                reg_carry_in <= '0';
            elsif carry_in_en = '1' then
                reg_carry_in <= fa_C_OUT;
            end if;
        end if;
    end process;

    -- Sum register
    process(RST, CLK)
    begin
        if RST = '1' then
            reg_sum <= (others => '0');
        elsif rising_edge(CLK) then
            for i in 0 to N_BITS loop
                if reg_sum_en(i) = '1' then
                    reg_sum(i) <= fa_SUM;
                end if;
            end loop;
        end if;
    end process;

    -- Sum register enable register
    process(RST, CLK)
    begin
        if RST = '1' then
            reg_sum_en <= (others => '0');
        elsif rising_edge(CLK) then
            if sum_en_load = '1' then
                -- load initial value of sum register enable signal
                reg_sum_en <= (N_BITS - 1 downto 0 => '0') & '1';
            elsif sum_en_shift = '1' then
                -- left-shift
                reg_sum_en <= reg_sum_en(N_BITS - 1 downto 0) & '0';
            end if;
        end if;
    end process;

    -- State register
    process(RST, CLK)
    begin
        if RST = '1' then
            reg_state <= STATE_IDLE;
        elsif rising_edge(CLK) then
            reg_state <= next_reg_state;
        end if;
    end process;

    -- State machine
    process(reg_state, START, reg_sum_en)
    begin
        operand_load   <= '0';
        operand_shift  <= '0';
        carry_in_en    <= '0';
        carry_in_clr   <= '0';
        sum_en_load    <= '0';
        sum_en_shift   <= '0';
        next_reg_state <= reg_state;
        DONE           <= '0';

        case reg_state is
            when STATE_IDLE =>
                operand_load <= '1';
                sum_en_load  <= '1';
                carry_in_clr <= '1';

                if START = '1' then
                    next_reg_state <= STATE_ADD_BIT_X;
                end if;

            when STATE_ADD_BIT_X =>
                operand_shift <= '1';
                sum_en_shift  <= '1';
                carry_in_en   <= '1';

                if reg_sum_en(N_BITS) = '1' then
                    next_reg_state <= STATE_DONE;
                end if;

            when STATE_DONE =>
                DONE           <= '1';
                next_reg_state <= STATE_IDLE;

        end case;
    end process;

    full_adder_inst : entity work.full_adder
    port map(
        OP1   => reg_op1(0),
        OP2   => reg_op2(0),
        C_IN  => reg_carry_in,
        SUM   => fa_SUM,
        C_OUT => fa_C_OUT
    );

    SUM <= reg_sum;

end architecture rtl;
