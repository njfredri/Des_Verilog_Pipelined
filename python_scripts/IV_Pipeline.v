
module Flipflop_1(input clk, input rst, input in, output reg out);
    always@(posedge(clk)) begin
        if(rst==1) begin
            out<=0;
        end
        else begin
            out<=in;
        end
    end
endmodule

module Validation_Pipeline (input clk, input rst, input iv, output ov);
    wire w0, w1, w2, w3, w4, w5, w6, w7, w8, w9, w10, w11, w12, w13, w14, w15, w16, w17, w18;
	assign w0 = iv;
	Flipflop_1 ff_0(clk, rst, w0, w1);
	Flipflop_1 ff_1(clk, rst, w1, w2);
	Flipflop_1 ff_2(clk, rst, w2, w3);
	Flipflop_1 ff_3(clk, rst, w3, w4);
	Flipflop_1 ff_4(clk, rst, w4, w5);
	Flipflop_1 ff_5(clk, rst, w5, w6);
	Flipflop_1 ff_6(clk, rst, w6, w7);
	Flipflop_1 ff_7(clk, rst, w7, w8);
	Flipflop_1 ff_8(clk, rst, w8, w9);
	Flipflop_1 ff_9(clk, rst, w9, w10);
	Flipflop_1 ff_10(clk, rst, w10, w11);
	Flipflop_1 ff_11(clk, rst, w11, w12);
	Flipflop_1 ff_12(clk, rst, w12, w13);
	Flipflop_1 ff_13(clk, rst, w13, w14);
	Flipflop_1 ff_14(clk, rst, w14, w15);
	Flipflop_1 ff_15(clk, rst, w15, w16);
	Flipflop_1 ff_16(clk, rst, w16, w17);
	Flipflop_1 ff_17(clk, rst, w17, w18);
	Flipflop_1 ff_18(clk, rst, w18, ov);
endmodule