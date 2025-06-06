class monitor;
  
  virtual intf vif;
  mailbox mon2scb;
  
  function new(virtual intf vif,mailbox mon2scb);
    this.vif     = vif;
    this.mon2scb = mon2scb;
  endfunction
  
  task main;
    repeat(1)
      #3;
      begin
      transaction trans;
      trans = new();
      	
        trans.in = vif.in;
        trans.out = vif.out;
        trans.clk <= vif.clk;
        trans.count = vif.count;
        mon2scb.put(trans);
      trans.display("Monitor");
    end
  endtask
  
endclass


