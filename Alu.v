// Code your design here
// through behavioural level modelling in  verilog 
module Alu(
  input [3:0] a, b , input [2:0] opcode , 
  output reg  flagc , flagz , output reg [7:0] y );
  
parameter Add = 3'b000  , sub  = 3'b001  , multi = 3'b010  ,AND =3'b011   , 
 NAND  = 3'b100,  OR = 3'b101  , EXOR = 3'b110 , NOR = 3'b111  ;  
  
  always@(*)
    begin 
      case(opcode)
       Add : begin  y = a+b ;
         flagc = y[5];
         flagz = (y[8]==3'b0);
       end
       sub : begin  y = a+b ;

         flagz = (y[8]==3'b0);
       end
       multi : begin  y = a*b ;

         flagz = (y[8]==3'b0);
       end
       AND : begin  y = a&b ;

         flagz = (y[8]==3'b0);
       end
        NAND : begin  y = ~(a&b) ;

         flagz = (y[8]==3'b0);
       end
                 
      OR : begin  y = a|b ;

         flagz = (y[8]==3'b0);
       end
       EXOR : begin  y = a^b ;

         flagz = (y[8]==3'b0);
       end
        NOR : begin  y = ~(a|b) ;

         flagz = (y[8]==3'b0);
       end
       default : begin y = 8'bx ;
                   flagc = 1'bx;
               flagz = 1'bx;
       end
       
      
      endcase
    end
endmodule

//---------------------------------------------------
//testbench for ARITHMETIC AND LOGIC UNIT 
// Code your testbench here
 
module tb ;
  reg [3:0] a;reg [3:0] b ;
  reg [2:0] opcode ;
 wire flagc ;
 wire  flagz  ;
  wire [7:0] y ;
  Alu uut(  .a(a) , .b(b) , .opcode(opcode) , .y(y) , .flagc(flagc) , .flagz(flagz));
  
  
  initial begin
    $dumpfile("test.vcd");
    $dumpvars(1 ,a ,b, opcode , flagc ,flagz, y  );
    
    a = 4'b000  ;
    b = 4'b000  ;
   
      #5 a= 4'b0010  ;b = 4'b0011 ; opcode = 3'b000;
       #5 a= 4'b0010 ; b = 4'b0011 ; opcode = 3'b001;
       #5 a= 4'b0010 ; b = 4'b0011 ; opcode = 3'b011;
       #5 a= 4'b0010 ; b = 4'b0011 ; opcode = 3'b100;
       #5 a= 4'b0010 ; b = 4'b0011 ; opcode = 3'b101;
      
      
    end 
endmodule 