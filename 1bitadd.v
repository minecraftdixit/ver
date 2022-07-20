// Code your design here
module up_counter(
  input  [2:0] in , 
  input clk , 
  input rst , 
  output reg [2:0]  q 
);
  reg [2:0] ns;
  reg [2:0] state ;
  always @(posedge clk)
    begin 
      if(rst)
        begin 
          state<=0;
          ns<=0;
          q<=0;
          
        end
      else
        begin 
          case(in)
            'b000:
              begin 
              state<='b000;
             
              q<=001;
              ns<=q+'b001; 
            end
            'b001:
              begin 
              state<='b001;
              q<='b010;
              ns<=q+'b001; 
            end
            'b010:
              begin 
              state<='b010;
               
              q<='b011;
            
              ns<=q+'b001; 
            end
            'b011:
              begin 
              state<='b011;
             
             q<='b100;
          
              ns<=q+'b001; 
            end
            'b100:
              begin 
              state<='b100;
              
              q<='b101;
              
              ns<=q+'b001; 
            end
            'b101:
              begin 
              state<='b101;
 
              q<='b110;
              
              ns<=q+'b001; 
              
            end
            default: 
              begin 
              state<='bxxx;
              ns<= 'bxxx;
              q<='b000;
              
            end
          endcase 
           
        end
      
      
    end
endmodule
  
  //code for testbench 
 // Code your testbench here
// or browse Examples
module tb;
  reg [2:0] in;
  reg clk ;
  reg rst ;
  wire [2:0] q ;
  wire [2:0] ns ;
  wire  [2:0] state ;

  
  up_counter dut( in , clk, rst , q);
  initial 
    begin 
      in='b000;
      
    end
  initial 
    begin 
      #20 ;rst =1 ; clk =1; in='b000;
        #20 ;rst =0 ; clk =1;  in='b100;
        #20 ;rst =0 ; clk =1;  in='b101;
        #20 ;rst =0 ; clk =1;  in='b110;
      
      #20 ;rst =0 ; clk =1;   in='b001;
      #20 ;rst =0 ; clk =1; in='b011;
      $monitor(" %b3 %b3 %b3 " ,in , state , ns); 
    end
  initial 
    begin 
      $dumpfile("dump.vcd");
      $dumpvars;
      
    end
  
  always #100 clk=~clk;
  
  initial begin
  #1000;
  $finish;
end
  
  
endmodule
