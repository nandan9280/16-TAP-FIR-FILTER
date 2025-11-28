module booth_multiplier_16x16 (
    input  [15:0] A,
    input  [15:0] B,
    output [31:0] P
);
    reg [31:0] product;
    reg [33:0] temp; // Extended version of B with appended 0 at LSB
    reg [31:0] partial_sum;
    integer i;

    always @(*) begin
        product = 32'd0;
        temp = {B, 1'b0};  // B[15:0] & B[-1] = 0
        for (i = 0; i < 16; i = i + 1) begin
            case ({temp[i+1], temp[i]})
                2'b01: partial_sum = A << i;       // Add A shifted by i
                2'b10: partial_sum = ~(A << i) + 1; // Sub A shifted by i
                default: partial_sum = 32'd0;
            endcase
            product = product + partial_sum;
        end
    end

    assign P = product;
endmodule
