 //randomization  in system verilog 

class random ;
  rand bit [2:0] a,b ;
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


//using randc
  
class random ;
  randc bit [2:0] a,b ;
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