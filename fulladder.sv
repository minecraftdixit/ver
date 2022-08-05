// full adder design 
interface fulladder();
  logic a , b , c ;
  logic s , carry ;
  modport dut(input a,b,c,output s,carry);
  modport tb(input s ,carry , output a,b,c);
endinterface

module f_add(fulladder.dut  inf);
 initial begin 
  assign inf.s = inf.a ^ inf.b ^ inf.c;
  assign inf.carry = (inf.a&inf.b) | (inf.a^ inf.b)&inf.c ;
end
endmodule
  // code for the full adder 
   
  
  //  code for testbench
  // Code your testbench here

module ftb(fulladder.tb intf);
  initial begin
    #5 intf.a=1'b0;intf.b=1'b0;intf.c=1'b0;
    #5 intf.a=1'b0;intf.b=1'b0;intf.c=1'b1;
    #5 intf.a=1'b0;intf.b=1'b1;intf.c=1'b0;
    #5 intf.a=1'b0;intf.b=1'b1;intf.c=1'b1;
    #5 intf.a=1'b1;intf.b=1'b0;intf.c=1'b1;
    #5 intf.a=1'b1;intf.b=1'b1;intf.c=1'b0;
    #5 intf.a=1'b1;intf.b=1'b1;intf.c=1'b1;
    #200 $finish;
    end
   
  initial
  begin
    
    $dumpfile("dump.vcd");
    $dumpvars;  
    end 
      endmodule
module Ftop();
 fulladder infc();
f_add dut(infc) ;
ftb tb(infc);



endmodule