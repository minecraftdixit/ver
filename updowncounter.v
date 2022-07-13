// Code your design here
module uuc(
  input clk , en, 
  input [3:0] pin , output [3:0] q , qb);
         tff t1(1'b1, pin[0] ,en,  clk, q[0],qb[0]) ;
         tff t1(1'b1, pin[1] ,en, en?q[0]:qb[0], q[1],qb[1]) ;
         tff t1(1'b1, pin[2] , en,en?q[1]:qb[1], q[2],qb[2]) ;
         tff t1(1'b1, pin[3] , en,	en?q[2]:qb[2], q[3],qb[3]) ;    
         endmodule

module tff(
input t , pin  , clk ,en , 
  output reg q , qb 
);
  // en =1 downcounter  , en =0 upcounter
  //pin = preset in downcounter while pin is reset in upcounter
  always@(posedge clk)
    begin 
      if(en)
         begin 
           if(pin)
             begin
             q=1'b1;
               qb=1'b0;
             end
           else
             begin 
               q=1'b0;
               qb=1'b1;
             end
           else if(t)
             begin
              q=~q;
               qb=~q ;
             end
           else
             begin 
               q=q;
               qb=~q;
               end
      else
        begin 
          if(pin)
            begin  q=1'b0;
              qb = 1'b1;
            end
          else if(t)
            begin 
              q=~q;
              qb=~q;
            end
          else 
            begin q=q;
            qb=q;  
           end
      end
       end
  endmodule