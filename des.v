module Expand_r (input [31:0] r, output [47:0] exp);
    // int E[] = //remember 32 is the first bit. Type it in reverse
    // {
    //     32,  1,  2,  3,  4,  5,
    //     4,  5,  6,  7,  8,  9,
    //     8,  9, 10, 11, 12, 13,
    //     12, 13, 14, 15, 16, 17,
    //     16, 17, 18, 19, 20, 21,
    //     20, 21, 22, 23, 24, 25,
    //     24, 25, 26, 27, 28, 29,
    //     28, 29, 30, 31, 32,  1
    // 
    //doing concatination instead of a bunch of lines
    assign exp[5:0] = {input[5], input[4], input[3], input[2], input[1], input[32]};
    assign exp[11:6] = {input[9], input[8], input[7], input[6], input[5], input[4]};
    assign exp[17:12] = {input[13], input[12], input[11], input[10], input[9], input[8]};
    assign exp[23:18] = {input[17], input[16], input[15], input[14], input[13], input[12]};
    assign exp[29:24] = {input[21], input[20], input[19], input[18], input[17], input[16]};
    assign exp[35:30] = {input[25], input[24], input[23], input[22], input[21], input[20]};
    assign exp[41:36] = {input[29], input[28], input[27], input[26], input[25], input[24]};
    assign exp[47:42] = {input[1], input[32], input[31], input[30], input[29], input[28]};
endmodule

module Xor_with_key(input[47:0] exp, input[47:0] key, output[47:0] out);
    assign output = exp^key;
endmodule

//primitive functions
//Too many numbers. Going to try and automate this a bit with loops
//Seems like sbox is a lookup using 6 elements from X at a time https://github.com/dkushagra/DES-Python/blob/master/DES.py#L114
//each sbox (1-8) can be an instance of a module
//created a python script to generate the 8 models using the arrays
//each s will convert 6 bit value to 4 bit. There are 8 sboxs, so there should be a 32 bit result
module S1(input [5:0] x, output reg [3:0] y);
	always @(*) begin
		case (s)
			0: y=15;
			1: y=1;
			2: y=8;
			3: y=14;
			4: y=6;
			5: y=11;
			6: y=3;
			7: y=4;
			8: y=9;
			9: y=7;
			10: y=2;
			11: y=13;
			12: y=12;
			13: y=0;
			14: y=5;
			15: y=10;
			16: y=3;
			17: y=13;
			18: y=4;
			19: y=7;
			20: y=15;
			21: y=2;
			22: y=8;
			23: y=14;
			24: y=12;
			25: y=0;
			26: y=1;
			27: y=10;
			28: y=6;
			29: y=9;
			30: y=11;
			31: y=5;
			32: y=0;
			33: y=14;
			34: y=7;
			35: y=11;
			36: y=10;
			37: y=4;
			38: y=13;
			39: y=1;
			40: y=5;
			41: y=8;
			42: y=12;
			43: y=6;
			44: y=9;
			45: y=3;
			46: y=2;
			47: y=15;
			48: y=13;
			49: y=8;
			50: y=10;
			51: y=1;
			52: y=3;
			53: y=15;
			54: y=4;
			55: y=2;
			56: y=11;
			57: y=6;
			58: y=7;
			59: y=12;
			60: y=0;
			61: y=5;
			62: y=14;
			63: y=9;
		endcase
	end
endmodule
module S2(input [5:0] x, output reg [3:0] y);
	always @(*) begin
		case (s)
			0: y=15;
			1: y=1;
			2: y=8;
			3: y=14;
			4: y=6;
			5: y=11;
			6: y=3;
			7: y=4;
			8: y=9;
			9: y=7;
			10: y=2;
			11: y=13;
			12: y=12;
			13: y=0;
			14: y=5;
			15: y=10;
			16: y=3;
			17: y=13;
			18: y=4;
			19: y=7;
			20: y=15;
			21: y=2;
			22: y=8;
			23: y=14;
			24: y=12;
			25: y=0;
			26: y=1;
			27: y=10;
			28: y=6;
			29: y=9;
			30: y=11;
			31: y=5;
			32: y=0;
			33: y=14;
			34: y=7;
			35: y=11;
			36: y=10;
			37: y=4;
			38: y=13;
			39: y=1;
			40: y=5;
			41: y=8;
			42: y=12;
			43: y=6;
			44: y=9;
			45: y=3;
			46: y=2;
			47: y=15;
			48: y=13;
			49: y=8;
			50: y=10;
			51: y=1;
			52: y=3;
			53: y=15;
			54: y=4;
			55: y=2;
			56: y=11;
			57: y=6;
			58: y=7;
			59: y=12;
			60: y=0;
			61: y=5;
			62: y=14;
			63: y=9;
		endcase
	end
endmodule
module S3(input [5:0] x, output reg [3:0] y);
	always @(*) begin
		case (s)
			0: y=10;
			1: y=0;
			2: y=9;
			3: y=14;
			4: y=6;
			5: y=3;
			6: y=15;
			7: y=5;
			8: y=1;
			9: y=13;
			10: y=12;
			11: y=7;
			12: y=11;
			13: y=4;
			14: y=2;
			15: y=8;
			16: y=13;
			17: y=7;
			18: y=0;
			19: y=9;
			20: y=3;
			21: y=4;
			22: y=6;
			23: y=10;
			24: y=2;
			25: y=8;
			26: y=5;
			27: y=14;
			28: y=12;
			29: y=11;
			30: y=15;
			31: y=1;
			32: y=13;
			33: y=6;
			34: y=4;
			35: y=9;
			36: y=8;
			37: y=15;
			38: y=3;
			39: y=0;
			40: y=11;
			41: y=1;
			42: y=2;
			43: y=12;
			44: y=5;
			45: y=10;
			46: y=14;
			47: y=7;
			48: y=1;
			49: y=10;
			50: y=13;
			51: y=0;
			52: y=6;
			53: y=9;
			54: y=8;
			55: y=7;
			56: y=4;
			57: y=15;
			58: y=14;
			59: y=3;
			60: y=11;
			61: y=5;
			62: y=2;
			63: y=12;
		endcase
	end
endmodule
module S4(input [5:0] x, output reg [3:0] y);
	always @(*) begin
		case (s)
			0: y=7;
			1: y=13;
			2: y=14;
			3: y=3;
			4: y=0;
			5: y=6;
			6: y=9;
			7: y=10;
			8: y=1;
			9: y=2;
			10: y=8;
			11: y=5;
			12: y=11;
			13: y=12;
			14: y=4;
			15: y=15;
			16: y=13;
			17: y=8;
			18: y=11;
			19: y=5;
			20: y=6;
			21: y=15;
			22: y=0;
			23: y=3;
			24: y=4;
			25: y=7;
			26: y=2;
			27: y=12;
			28: y=1;
			29: y=10;
			30: y=14;
			31: y=9;
			32: y=10;
			33: y=6;
			34: y=9;
			35: y=0;
			36: y=12;
			37: y=11;
			38: y=7;
			39: y=13;
			40: y=15;
			41: y=1;
			42: y=3;
			43: y=14;
			44: y=5;
			45: y=2;
			46: y=8;
			47: y=4;
			48: y=3;
			49: y=15;
			50: y=0;
			51: y=6;
			52: y=10;
			53: y=1;
			54: y=13;
			55: y=8;
			56: y=9;
			57: y=4;
			58: y=5;
			59: y=11;
			60: y=12;
			61: y=7;
			62: y=2;
			63: y=14;
		endcase
	end
endmodule
module S5(input [5:0] x, output reg [3:0] y);
	always @(*) begin
		case (s)
			0: y=2;
			1: y=12;
			2: y=4;
			3: y=1;
			4: y=7;
			5: y=10;
			6: y=11;
			7: y=6;
			8: y=8;
			9: y=5;
			10: y=3;
			11: y=15;
			12: y=13;
			13: y=0;
			14: y=14;
			15: y=9;
			16: y=14;
			17: y=11;
			18: y=2;
			19: y=12;
			20: y=4;
			21: y=7;
			22: y=13;
			23: y=1;
			24: y=5;
			25: y=0;
			26: y=15;
			27: y=10;
			28: y=3;
			29: y=9;
			30: y=8;
			31: y=6;
			32: y=4;
			33: y=2;
			34: y=1;
			35: y=11;
			36: y=10;
			37: y=13;
			38: y=7;
			39: y=8;
			40: y=15;
			41: y=9;
			42: y=12;
			43: y=5;
			44: y=6;
			45: y=3;
			46: y=0;
			47: y=14;
			48: y=11;
			49: y=8;
			50: y=12;
			51: y=7;
			52: y=1;
			53: y=14;
			54: y=2;
			55: y=13;
			56: y=6;
			57: y=15;
			58: y=0;
			59: y=9;
			60: y=10;
			61: y=4;
			62: y=5;
			63: y=3;
		endcase
	end
endmodule
module S6(input [5:0] x, output reg [3:0] y);
	always @(*) begin
		case (s)
			0: y=12;
			1: y=1;
			2: y=10;
			3: y=15;
			4: y=9;
			5: y=2;
			6: y=6;
			7: y=8;
			8: y=0;
			9: y=13;
			10: y=3;
			11: y=4;
			12: y=14;
			13: y=7;
			14: y=5;
			15: y=11;
			16: y=10;
			17: y=15;
			18: y=4;
			19: y=2;
			20: y=7;
			21: y=12;
			22: y=9;
			23: y=5;
			24: y=6;
			25: y=1;
			26: y=13;
			27: y=14;
			28: y=0;
			29: y=11;
			30: y=3;
			31: y=8;
			32: y=9;
			33: y=14;
			34: y=15;
			35: y=5;
			36: y=2;
			37: y=8;
			38: y=12;
			39: y=3;
			40: y=7;
			41: y=0;
			42: y=4;
			43: y=10;
			44: y=1;
			45: y=13;
			46: y=11;
			47: y=6;
			48: y=4;
			49: y=3;
			50: y=2;
			51: y=12;
			52: y=9;
			53: y=5;
			54: y=15;
			55: y=10;
			56: y=11;
			57: y=14;
			58: y=1;
			59: y=7;
			60: y=6;
			61: y=0;
			62: y=8;
			63: y=13;
		endcase
	end
endmodule
module S7(input [5:0] x, output reg [3:0] y);
	always @(*) begin
		case (s)
			0: y=4;
			1: y=11;
			2: y=2;
			3: y=14;
			4: y=15;
			5: y=0;
			6: y=8;
			7: y=13;
			8: y=3;
			9: y=12;
			10: y=9;
			11: y=7;
			12: y=5;
			13: y=10;
			14: y=6;
			15: y=1;
			16: y=13;
			17: y=0;
			18: y=11;
			19: y=7;
			20: y=4;
			21: y=9;
			22: y=1;
			23: y=10;
			24: y=14;
			25: y=3;
			26: y=5;
			27: y=12;
			28: y=2;
			29: y=15;
			30: y=8;
			31: y=6;
			32: y=1;
			33: y=4;
			34: y=11;
			35: y=13;
			36: y=12;
			37: y=3;
			38: y=7;
			39: y=14;
			40: y=10;
			41: y=15;
			42: y=6;
			43: y=8;
			44: y=0;
			45: y=5;
			46: y=9;
			47: y=2;
			48: y=6;
			49: y=11;
			50: y=13;
			51: y=8;
			52: y=1;
			53: y=4;
			54: y=10;
			55: y=7;
			56: y=9;
			57: y=5;
			58: y=0;
			59: y=15;
			60: y=14;
			61: y=2;
			62: y=3;
			63: y=12;
		endcase
	end
endmodule
module S8(input [5:0] x, output reg [3:0] y);
	always @(*) begin
		case (s)
			0: y=13;
			1: y=2;
			2: y=8;
			3: y=4;
			4: y=6;
			5: y=15;
			6: y=11;
			7: y=1;
			8: y=10;
			9: y=9;
			10: y=3;
			11: y=14;
			12: y=5;
			13: y=0;
			14: y=12;
			15: y=7;
			16: y=1;
			17: y=15;
			18: y=13;
			19: y=8;
			20: y=10;
			21: y=3;
			22: y=7;
			23: y=4;
			24: y=12;
			25: y=5;
			26: y=6;
			27: y=11;
			28: y=0;
			29: y=14;
			30: y=9;
			31: y=2;
			32: y=7;
			33: y=11;
			34: y=4;
			35: y=1;
			36: y=9;
			37: y=12;
			38: y=14;
			39: y=2;
			40: y=0;
			41: y=6;
			42: y=10;
			43: y=13;
			44: y=15;
			45: y=3;
			46: y=5;
			47: y=8;
			48: y=2;
			49: y=1;
			50: y=14;
			51: y=7;
			52: y=4;
			53: y=10;
			54: y=8;
			55: y=13;
			56: y=15;
			57: y=12;
			58: y=9;
			59: y=0;
			60: y=3;
			61: y=5;
			62: y=6;
			63: y=11;
		endcase
	end
endmodule




module Pbox(input [31:0] x, output [31:0] out);
    //     int P[] =
    // {
    //     16,  7, 20, 21,
    //     29, 12, 28, 17,
    //     1, 15, 23, 26,
    //     5, 18, 31, 10,
    //     2,  8, 24, 14,
    //     32, 27,  3,  9,
    //     19, 13, 30,  6,
    //     22, 11,  4, 25
    // };
    assign out[3:0] = {x[21], x[20], x[7], x[16]};
    assign out[7:4] = {x[17], x[28], x[12], x[29]};
    assign out[11:8] = {x[26], x[23], x[15], x[1]};
    assign out[15:12] = {x[10], x[31], x[18], x[5]};
    assign out[19:16] = {x[14], x[24], x[8], x[2]};
    assign out[23:20] = {x[9], x[3], x[27], x[32]};
    assign out[27:24] = {x[6], x[20], x[13], x[19]};
    assign out[31:28] = {x[25], x[4], x[11], x[22]};
endmodule

module Xor_with_left(input [31:0] left, input[31:0] r, output [31:0] out);
    assign out=left^r;
endmodule

module Func_right(input[31:0] left, input [31:0] right, input[47:0] key, output[31:0] out); //combine all of the combinational circuits
    //expand_r (input [31:0] r, output [47:0] exp);
    wire[47:0] expandedr;
    Expand_r expand(
        .r(right),
        .exp(expandedr)
    );
    //Xor_with_key(input[47:0] exp, input[47:0] key, output[47:0] out);
    wire[47:0] xorkey_out;
    Xor_with_key xor1(
        .exp(expandedr),
        .key(key),
        .out(xorkey_out)
    )
    //connect to the S1-S8
    wire[5:0] S1_in, S2_in, S3_in, S4_in, S5_in, S6_in, S7_in, S8_in;
    assign {S1_in, S2_in, S3_in, S4_in, S5_in, S6_in, S7_in, S8_in} = xorkey_out;
    wire[5:0] S1_out, S2_out, S3_out, S4_out, S5_out, S6_out, S7_out, S8_out;
    // S1(input [5:0] x, output [3:0] y);
    S1 s1box(S1_in, S1_out);
    S2 s1box(S2_in, S2_out);
    S3 s1box(S3_in, S3_out);
    S4 s1box(S4_in, S4_out);
    S5 s1box(S5_in, S5_out);
    S6 s1box(S6_in, S6_out);
    S7 s1box(S7_in, S7_out);
    S8 s1box(S8_in, S8_out);
    wire [31:0] S_out;
    assign S_out = {S1_out, S2_out, S3_out, S4_out, S5_out, S6_out, S7_out, S8_out};
    //connect to Pbox
    // module Pbox(input [31:0] x, output [31:0] out);
    wire[31:0] P_out;
    Pbox pbox(
        .x(S_out),
        .out(P_out)
    );
    //final xor with Left
    // Xor_with_left(input [31:0] left, input[31:0] r, output [31:0] out);
    Xor_with_left xwl(
        .left(left),
        .r(P_out),
        .out(out)
    );
endmodule

module Initial_Permute(input [63:0] plaintext, output [63:0] ip);
    //     int IP[] =
    // 58, 50,  42,     34, 26, 18, 10, 2,
    // 60, 52,  44,     36, 28, 20, 12, 4,
    // 62, 54,  46,     38, 30, 22, 14, 6,
    // 64, 56,  48,     40, 32, 24, 16, 8,
    // 57, 49,  41,     33, 25, 17,  9, 1,
    // 59, 51,  43,     35, 27, 19, 11, 3,
    // 61, 53,  45,     37, 29, 21, 13, 5,
    // 63, 55,  47,     39, 31, 23, 15, 7
    // };
  assign ip[7:0] = {plaintext[2], plaintext[10], plaintext[18], plaintext[26], plaintext[34], plaintext[42], plaintext[50], plaintext[58]};
  assign ip[15:8] = {plaintext[4], plaintext[12], plaintext[20], plaintext[28], plaintext[36], plaintext[44], plaintext[52], plaintext[60]};
  assign ip[23:16] = {plaintext[6], plaintext[14], plaintext[22], plaintext[30], plaintext[38], plaintext[46], plaintext[54], plaintext[62]};
  assign ip[31:24] = {plaintext[8], plaintext[16], plaintext[24], plaintext[32], plaintext[40], plaintext[48], plaintext[56], plaintext[64]};
  assign ip[39:32] = {plaintext[1], plaintext[9], plaintext[17], plaintext[25], plaintext[33], plaintext[41], plaintext[49], plaintext[57]};
  assign ip[47:40] = {plaintext[3], plaintext[11], plaintext[19], plaintext[27], plaintext[35], plaintext[43], plaintext[51], plaintext[59]};
  assign ip[55:48] = {plaintext[5], plaintext[13], plaintext[21], plaintext[29], plaintext[37], plaintext[45], plaintext[53], plaintext[61]};
  assign ip[63:56] = {plaintext[7], plaintext[15], plaintext[23], plaintext[31], plaintext[39], plaintext[47], plaintext[55], plaintext[63]};
endmodule

module Split_lr (input [63:0] in, output [31:0] right, output [31:0] left);
    assign right = in[31:0];
    assign left = in[63:32];
endmodule

module PC1();
    // int PC1[] =
    // {
    //     57, 49, 41, 33, 25, 17,  9,
    //     1, 58, 50, 42, 34, 26, 18,
    //     10,  2, 59, 51, 43, 35, 27,
    //     19, 11,  3, 60, 52, 44, 36,
    //     63, 55, 47, 39, 31, 23, 15,
    //     7, 62, 54, 46, 38, 30, 22,
    //     14,  6, 61, 53, 45, 37, 29,
    //     21, 13,  5, 28, 20, 12,  4
    // };
endmodule

module Flipflop_32(input clk, input rst, input[31:0] in, output reg [31:0] out);
    always@(posedge(clk)) begin
        if(rst==1) begin
            out <=0;
        end
        else begin
            out <= in;
        end
    end
endmodule

module Flipflop_48(input clk, input rst, input[47:0] in, output reg [47:0] out);
    always@(posedge(clk)) begin
        if(rst==1) begin
            out <=0;
        end
        else begin
            out <= in;
        end
    end
endmodule

module Flipflop_64(input clk, input rst, input[63:0] in, output reg [63:0] out);
    always@(posedge(clk)) begin
        if(rst==1) begin
            out <=0;
        end
        else begin
            out <= in;
        end
    end
endmodule

module des (
    input clock,
    input reset, //synchronous high
    input [63:0] key, //this key will be fixed in this design, so you won't need to necessarily pipeline the keys
    input [63:0] plaintext,
    input iv, //says that there is a valid input
    output reg [63:0] ciphertext,
    output reg ov
);
    //beginning
    wire[63:0] input_reg_out;
    Flipflop_64 input_reg(
        .clk(clock),
        .rst(reset),
        .in(plaintext),
        .out(input_reg_out)
    );

    reg [47:0] keys[15:0]; //keys that will be generated later. keys[layer#][key#]

    //Perform initial permute and split it into left and right
    //Initial_Permute(input [63:0] plaintext, output [63:0] ip);
    //Split_lr (input [63:0] in, output [31:0] right, output [31:0] left)
    wire[63:0] ip_out;
    wire[31:0] l0, r0;
    Initial_Permute ip(input_reg_out, ip_out);
    Split_lr split_lr(ip_out, l0, r0);

    //l0 and r0 ff for pipelining
    wire[31:0] l0_reg_out, r0_reg_out;
    Flipflop_32 l0_reg (clock, reset, l0, l0_reg_out);
    Flipflop_32 r0_reg (clock, reset, r0, r0_reg_out);

    //calculate l1 and r1
    //Func_right(input[31:0] left, input [31:0] right, input[47:0] key, output[31:0] out);
    wire[31:0] l1, r1;
    Func_right layer1(l0_reg_out, r0_reg_out,)


endmodule
