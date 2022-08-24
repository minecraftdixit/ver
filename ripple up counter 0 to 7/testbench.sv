// Code your testbench here
// or browse Examples
// Code your testbench here
// or browse Examples
module tb;
  reg clk , rst ;
  wire [2:0] data_out ;
  
  ripple_counter UUT(.clk(clk), .rst(rst), .data_out(data_out));
  
  initial begin 
    clk = 0 ;
    rst = 1;
    
 #11 rst  =  0;
    
    
    
    
  end
  always #10 clk= ~clk;
  initial begin 
    $dumpfiles("dump.vcd");
    $dumpvars;
  end
  
  
endmodule 