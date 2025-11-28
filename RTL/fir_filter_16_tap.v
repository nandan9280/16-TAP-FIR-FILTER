module fir_filter_16_tap (
    input clk, 
    input rst, 
    input [15:0] x_in, 
    input [15:0] h0, h1, h2, h3, h4, h5, h6, h7,
    input [15:0] h8, h9, h10, h11, h12, h13, h14, h15,
    output reg [31:0] y_out
);
    // Delay line (16 taps)
    reg [15:0] tap0, tap1, tap2, tap3, tap4, tap5, tap6, tap7;
    reg [15:0] tap8, tap9, tap10, tap11, tap12, tap13, tap14, tap15;
    
    // Multiplier outputs
    wire [31:0] p0, p1, p2, p3, p4, p5, p6, p7;
    wire [31:0] p8, p9, p10, p11, p12, p13, p14, p15;
    
    // Instantiate multipliers
    booth_multiplier_16x16 m0 (.A(tap0), .B(h0), .P(p0));
    booth_multiplier_16x16 m1 (.A(tap1), .B(h1), .P(p1));
    booth_multiplier_16x16 m2 (.A(tap2), .B(h2), .P(p2));
    booth_multiplier_16x16 m3 (.A(tap3), .B(h3), .P(p3));
    booth_multiplier_16x16 m4 (.A(tap4), .B(h4), .P(p4));
    booth_multiplier_16x16 m5 (.A(tap5), .B(h5), .P(p5));
    booth_multiplier_16x16 m6 (.A(tap6), .B(h6), .P(p6));
    booth_multiplier_16x16 m7 (.A(tap7), .B(h7), .P(p7));
    booth_multiplier_16x16 m8 (.A(tap8), .B(h8), .P(p8));
    booth_multiplier_16x16 m9 (.A(tap9), .B(h9), .P(p9));
    booth_multiplier_16x16 m10 (.A(tap10), .B(h10), .P(p10));
    booth_multiplier_16x16 m11 (.A(tap11), .B(h11), .P(p11));
    booth_multiplier_16x16 m12 (.A(tap12), .B(h12), .P(p12));
    booth_multiplier_16x16 m13 (.A(tap13), .B(h13), .P(p13));
    booth_multiplier_16x16 m14 (.A(tap14), .B(h14), .P(p14));
    booth_multiplier_16x16 m15 (.A(tap15), .B(h15), .P(p15));
    
    // Adder tree
    wire [31:0] sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7;
    wire [31:0] sum8, sum9, sum10, sum11, sum12, sum13, sum14;
    
    // First level of addition
    ripple_carry_adder_32bit adder0 (.A(p0), .B(p1), .Cin(1'b0), .Sum(sum0));
    ripple_carry_adder_32bit adder1 (.A(p2), .B(p3), .Cin(1'b0), .Sum(sum1));
    ripple_carry_adder_32bit adder2 (.A(p4), .B(p5), .Cin(1'b0), .Sum(sum2));
    ripple_carry_adder_32bit adder3 (.A(p6), .B(p7), .Cin(1'b0), .Sum(sum3));
    ripple_carry_adder_32bit adder4 (.A(p8), .B(p9), .Cin(1'b0), .Sum(sum4));
    ripple_carry_adder_32bit adder5 (.A(p10), .B(p11), .Cin(1'b0), .Sum(sum5));
    ripple_carry_adder_32bit adder6 (.A(p12), .B(p13), .Cin(1'b0), .Sum(sum6));
    ripple_carry_adder_32bit adder7 (.A(p14), .B(p15), .Cin(1'b0), .Sum(sum7));
    
    // Second level
    ripple_carry_adder_32bit adder8 (.A(sum0), .B(sum1), .Cin(1'b0), .Sum(sum8));
    ripple_carry_adder_32bit adder9 (.A(sum2), .B(sum3), .Cin(1'b0), .Sum(sum9));
    ripple_carry_adder_32bit adder10 (.A(sum4), .B(sum5), .Cin(1'b0), .Sum(sum10));
    ripple_carry_adder_32bit adder11 (.A(sum6), .B(sum7), .Cin(1'b0), .Sum(sum11));
    
    // Third level
    ripple_carry_adder_32bit adder12 (.A(sum8), .B(sum9), .Cin(1'b0), .Sum(sum12));
    ripple_carry_adder_32bit adder13 (.A(sum10), .B(sum11), .Cin(1'b0), .Sum(sum13));
    
    // Final addition
    ripple_carry_adder_32bit adder14 (.A(sum12), .B(sum13), .Cin(1'b0), .Sum(sum14));
    
    // Update delay line and output
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            tap0 <= 16'd0; tap1 <= 16'd0; tap2 <= 16'd0; tap3 <= 16'd0;
            tap4 <= 16'd0; tap5 <= 16'd0; tap6 <= 16'd0; tap7 <= 16'd0;
            tap8 <= 16'd0; tap9 <= 16'd0; tap10 <= 16'd0; tap11 <= 16'd0;
            tap12 <= 16'd0; tap13 <= 16'd0; tap14 <= 16'd0; tap15 <= 16'd0;
            y_out <= 32'd0;
        end else begin
            // Shift data through delay line
            tap15 <= tap14; tap14 <= tap13; tap13 <= tap12; tap12 <= tap11;
            tap11 <= tap10; tap10 <= tap9; tap9 <= tap8; tap8 <= tap7;
            tap7 <= tap6; tap6 <= tap5; tap5 <= tap4; tap4 <= tap3;
            tap3 <= tap2; tap2 <= tap1; tap1 <= tap0; tap0 <= x_in;
            
            // Update output
            y_out <= sum14;
        end
    end
endmodule
