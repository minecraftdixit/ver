// Code your design here
// Code your design here
module ripple_counter (
input clk , rst , 
  output [2:0] data_out; 
 
);
  reg [2:0]  count_next;
  
  
  always @(posedge clk)
    begin 
      if(rst)
       begin  
       data_out = 0;
       count_next = 0  
       end
      else 
        begin 
          if(count==7)
            begin 
              count_next = 0;
              data_out =0 ;
               
            end
          else 
            begin 
              count_next = count_next+1 ;
              data_out = data_out<<1;
          
        end
      
      
    end
  
  
endmodule 