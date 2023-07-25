library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity PC is
    Port ( 
        clk_in : in STD_LOGIC;
        pc_op_in : in STD_LOGIC_VECTOR (1 downto 0);
        pc_in : in STD_LOGIC_VECTOR (15 downto 0);
        pc_out : out STD_LOGIC_VECTOR (15 downto 0)
        );
end PC;

architecture Behavioral of PC is
    
    signal pc_cnt : std_logic_vector (15 downto 0) := x"0000";

begin
    
    process (clk_in)
    begin
    
        if rising_edge (clk_in) then
            
            case pc_op_in is 
                
                when "00" => -- Reset
                    pc_cnt <= x"0000";  -- Assign program counter initially to 0
                
                when "01" => -- Increment program counter
                    pc_cnt <= std_logic_vector(unsigned(pc_cnt) + 1);
                    
                when "10" => -- Branch operation
                    pc_cnt <= pc_in;
                    
                when "11" => -- Do nothing here
                
                when others =>
                
            end case;
            
        end if;
        
    end process;
    
    pc_out <= pc_cnt;


end Behavioral;
