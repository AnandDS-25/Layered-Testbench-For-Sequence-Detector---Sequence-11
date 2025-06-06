// Code your design here
module fsm (
    input bit clk,        // Clock signal
        
    input bit [1:0]in,         // Input bit (0 or 1)
    output bit out, // Output (1 if sequence "11" is detected)
    output int count
);

    // Define state encoding
    typedef enum bit [1:0] {
        S0 = 2'b00,  // Initial state, no "1" detected
        S1 = 2'b01,  // One "1" detected, waiting for second "1"
        S2 = 2'b10   // Sequence "11" detected
    } state_t;

    state_t state, nextstate;

    // State register (sequential logic)
  always_ff @(*) begin
    if (count == 0) begin
            state <= S0;// Reset to initial state
        	
      end
        else begin
            state <= nextstate;  // Transition to next state
   			
        end
    end

    // Next state logic (combinational logic)
    always_comb begin
        case (state)
            S0: begin
                if (in) begin
                    nextstate = S1;
                    count = 1;
                end else begin
                    nextstate = S0;
                  count = 0;// Stay in S0 if in is 0
                end
            end

            S1: begin
                if (in) begin
                  nextstate =S2;
                  count = 2;
                  
                end else begin
                    nextstate = S0;  // Go back to S0 if in is 0
                  count =1;
                end
            end

            S2: begin
              
                if (in) begin
                    nextstate = S2;  // Transition to S1 for overlapping detection
                    count =2;
                end else begin
                    nextstate = S0;  // Go back to S0 if in is 0
                    count =0;
                end
            end

            default: begin
                nextstate = S0;  // Default to initial state
            end
        endcase
    end

    // Output logic (Moore output)
    assign out = (count == 2 && state == S2)?1'b1:1'b0;  // Output 1 if state is S2, meaning sequence "11" detected

endmodule