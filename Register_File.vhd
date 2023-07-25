library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Register_File is
  Port ( 
        clk_in : in std_logic;
        enable_in : in std_logic;
        write_enable_in : in std_logic;
        rM_data_out : out std_logic_vector (15 downto 0);
        rN_data_out : out std_logic_vector (15 downto 0);
        rD_data_in : in std_logic_vector (15 downto 0);
        sel_rM_in : in std_logic_vector (2 downto 0);
        sel_rN_in : in std_logic_vector (2 downto 0);
        sel_rD_in : in std_logic_vector (2 downto 0)
        );
end Register_File;


architecture Behavioral of Register_File is     -- 8 Registers that need to be 8-bits each 
    
    type reg_array is array (0 to 7) of std_logic_vector (15 downto 0);
    signal reg_file : reg_array := (others => x"0000"); -- Assign all registers initially to 0


begin
    process (clk_in)
    begin
        
        if rising_edge (clk_in) and enable_in = '1' then -- Data is written out or to registers
            rM_data_out <= reg_file(to_integer(unsigned(sel_rM_in)));
            rN_data_out <= reg_file(to_integer(unsigned(sel_rN_in)));
            
        if write_enable_in = '1' then
            reg_file(to_integer(unsigned(sel_rD_in))) <= rD_data_in;
        end if;
        
        end if;
    
    end process;
            


end Behavioral;
