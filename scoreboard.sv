class scoreboard;
  
  mailbox mon2scb;
 
  
  function new(mailbox mon2scb);
    this.mon2scb = mon2scb;
  endfunction
  
  task main;
    transaction trans;
    repeat(1)
      begin
      mon2scb.get(trans);
        
        
        if(trans.in == 2'b11)
          begin
            if(trans.count == 2 && trans.out == 1'b1 ) begin
              
            $display("SEQUENCE 11 DETECTED"); 
            end end
    else
              
           begin
             $display("Not Detected");
           end
            
        
         trans.display("Scoreboard");
    end
  endtask
  
endclass