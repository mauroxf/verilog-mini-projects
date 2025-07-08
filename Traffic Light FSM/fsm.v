module fsm #(
    parameter S0 = 2'b00,
    parameter S1 = 2'b01,
    parameter S2 = 2'b10,
    parameter RED = 3'b100,
    parameter GREEN = 3'b010,
    parameter YELLOW = 3'b001
)(
    input clock, 
    output reg [0:2] light
);
    reg [0:1] state; // Use 2 bit reg because we need 3 values for state

    always @(posedge clock) begin
        case (state) // Moving through stages according to transition table
            S0: state <= S1; // Non-blocking 
            S1: state <= S2;
            S2: state <= S0;
            default: state <= S0;
        endcase
    end

    always @(state) begin // Check for state change rather than posedge clock
        case(state)
        S0: light = RED;
        S1: light = GREEN;
        S2: light = YELLOW;
        default: light = RED;
        endcase
    end
endmodule
