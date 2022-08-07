 //randomization  in system verilog 

class random ;
  rand bit [7:0] a,b ;
  task display();
  $display(" a =%d  , b =  %d  " , a , b);
  endtask
    endclass

program main ;
  random randd ;
  initial 
    begin 
  
      randd = new();
      repeat(10)
      begin 
        randd.randomize();
        randd.display();
        
        
      end
      
      
    end
  
endprogram 