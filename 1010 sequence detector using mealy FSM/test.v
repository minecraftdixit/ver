// Code your testbench here
// or browse Examples
module tb;
  
  reg clk ,rst, data_in ;
  wire data_out;
  
  sequence_detector UUT(  .clk(clk) , .rst(rst), .data_in(data_in), 
                        .data_out(data_out));
  
  initial begin 
    clk = 0; 
    rst = 1 ;
    #11 rst = 0;
    #21 data_in = 1;
    gen(1);
    gen(0);
    gen(1);
    gen(1);
    gen(1);
    gen(0);
    gen(1);
    gen(1);
    
    #200 $stop;
    
  end
  
  
  task gen ;
    input inp;
    @(posedge clk)
    begin
      data_in = inp;
    end
    
    
  endtask
  
  
  initial begin 
    $dumpfile("dump.vcd");
    $dumpvars ;
  end
  
  always #10 clk = ~clk ; 
endmodule
  
