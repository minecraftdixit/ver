// Code your design here
//D LATCH 
module dff(
    input  din , clk, 
  output reg  q);
  
  always@(din or clk)
    begin  
      if(clk)
        q = din ;
      else
        q=q;
    end
endmodule 
  



  //testbench code for d latch 
  
// Code your testbench here
// or browse Examples
`timescale  1ns/1ps
module tb ;
   reg d ;
  reg clk;
  wire q ;

  dff uut(.din(d) , .clk(clk) , .q(q));
  initial begin
    
    $dumpfile("test.vcd" );
    $dumpvars(0 , tb);
    
     d=0;
    clk=1;
  #5 ; d=1 ; clk=1;
     #5 ; d=0 ;clk=0; 
    #5 ; d=1 ; clk=1;
    #5 ; d=0 ; clk=0;
    $finish;
    
  end
  always begin  #50  clk = ~clk ; 
  end
   
endmodule 
    