// Code your design here
`define s0  2'b00
`define s1  2'b01
`define s2  2'b10
`define s3  2'b11

module sequence_detector(
  input clk , rst ,
  input data_in, 
  output reg data_out
);
  reg [3:0] ps,ns;
  reg [1:0] count;
  always @(posedge clk)
begin 
  if(rst)
    begin
    ps = `s0; 
 count = 0;
    end
  else 
  ps = ns; 
  
  end
  always @(*)
    begin 
      ns  = ps ;
      case(ps)
        `s0 : begin 
          
          $display($time ,"----------------s0 state");
          ns = data_in?`s1:`s0;
          data_out = 0 ;
          count =0 ;
          
        end
        `s1 : begin
          
          $display($time ,"----------------s1 state");
          ns = data_in?`s1:`s2;
          data_out=0;
          count =0;
          
        end
      `s2:begin
          
        $display($time ,"----------------s2 state");
          ns=data_in ?`s3:`s0;
          data_out=0;
          count =0;
          
        end
      `s3:begin
        $display($time ,"----------------s3 state");
          ns=data_in ?`s1:`s2;
          data_out=1;
        if(data_out==1)
          begin
            count= count+1;
          end
        else
          count =0;
          
        end
      default: ns = `s0;
      endcase
    end
        endmodule 
