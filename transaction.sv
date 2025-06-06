class transaction;

  // Stimulus are declared with rand keyword
  rand bit [1:0]in;  
  bit out;
 
  bit clk;  // Semicolon added here
  int count;
  
  // Function for Displaying values of in and out
  function void display(string name);
    $display("-------------------------");
    $display(" %s ", name);
    $display("-------------------------");
    $display("input = %b,output= %b,count= %d", in,out,count);
    $display("-------------------------");
  endfunction

endclass
