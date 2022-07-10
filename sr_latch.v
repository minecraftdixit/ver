   //Behavioural design flow 
module sr_latch(
  input s , r , clk, 
  output q ,qbar );
  always@(posedge clk)
    begin 
      if(s==0&r==0)
        begin
          q<=q;
          qbar<=qbar;
        end
     else if(s==0&r==1)
        begin
          q<=0;
          qbar<=1;
        end
   else if(s==1&r==0)
        begin
          q<=1;
          qbar<=0;
        end
      
      end
endmodule 