`include "interface.sv"
`include "test"
module tbench_top;
  
  intf i_intf();
  
  test t1(i_intf);
  
  fsm h1 (
    .clk(i_intf.clk),
    
    .in(i_intf.in),
    .out(i_intf.out),
    .count(i_intf.count)
   );
  
  initial begin 
    $dumpfile("dump.vcd"); $dumpvars;
  end
  
  
endmodule