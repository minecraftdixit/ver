// Code your design here
 //inheritance example  in system verilog 

class parent ;
  
  
  task print();
   
    $display("this is parent class");
    
  endtask
  
  
endclass

class child extends parent ;
  
  task print();
    $display("this is child class");
    
  endtask
  
endclass
program main;
  initial
    begin 
  parent p ;
  child c ;
  p = new();
  c= new();
  p.print();
  c.print();
    end
endprogram