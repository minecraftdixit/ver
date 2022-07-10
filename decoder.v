module decoder(
  input a, b

  ,output reg[3:0]	Q
)
  
  ;
  always@(*) begin 
    case({a,b})
      2'b00 : Q = 4'b1000;
      2'b01 : Q = 4'b1000;
      2'b10: Q = 4'b1000;
      2'b11 : Q = 4'b1000;
      default : Q = 4'bzzzz;
    endcase
  end
endmodule
      
     
  