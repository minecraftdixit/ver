 
//To program 3*8 priority encoder
module prencoder(
  input  [7:0] d , 
   input en , 
  output  reg [2:0] q 
  

); 
  
  always @(d or en)
    begin 
      casex(d)
        
          8'b00000001: q=3'b000;
          8'b0000001x: q=3'b001;
          8'b000001xx: q=3'b010;
          8'b00001xxx: q=3'b011;
          8'b0001xxxx: q=3'b100;
          8'b001xxxxx: q=3'b101;
          8'b01xxxxxx: q=3'b110;
          8'b1xxxxxxx: q=3'b111;
          default: q=3'bxxx;
          
        
          endcase
        
    
       
    end
  
 
        endmodule
		
		//testbench
		 
    module test;  
      reg  [7:0] d;  
      reg en ; 
      
      wire [2:0] q; 
    
      
      
      prencoder  tb( .d (d),  
                      .en (en),  
                    .q(q)
                   );  
      
       initial 
         begin  
         d = 'b0000000;  
                en = 0;   
          end  
 initial 
        begin 
    #5 ; en=0 ;  d='b0000000 ; 
          
    #5 ; en=1 ;  d='b0000001 ;  
          
    #5 ; en=1 ;  d='b0000010 ; 
          
    #5 ; en=1 ;  d='b0000011 ; 
          
    #5 ; en=1 ;  d='b0000100 ;
          
    #5 ; en=1 ;  d='b0000101 ; 
          
    #5 ; en=1 ;  d='b0000110 ; 
          
    #5 ; en=1 ;  d='b0000111 ; 
          
        end
      initial 
        
        begin 
         
          $dumpfile("dump.vcd");
          $dumpvars ;
         #100 $finish ;
          
        end
      
    endmodule