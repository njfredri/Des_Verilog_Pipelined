module Expand_r (input [32:1] r, output [47:0] exp); //changed r bits to start from 1
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
    assign exp[5:0] = {r[5], r[4], r[3], r[2], r[1], r[32]};
    assign exp[11:6] = {r[9], r[8], r[7], r[6], r[5], r[4]};
    assign exp[17:12] = {r[13], r[12], r[11], r[10], r[9], r[8]};
    assign exp[23:18] = {r[17], r[16], r[15], r[14], r[13], r[12]};
    assign exp[29:24] = {r[21], r[20], r[19], r[18], r[17], r[16]};
    assign exp[35:30] = {r[25], r[24], r[23], r[22], r[21], r[20]};
    assign exp[41:36] = {r[29], r[28], r[27], r[26], r[25], r[24]};
    assign exp[47:42] = {r[1], r[32], r[31], r[30], r[29], r[28]};
endmodule

module Xor_with_key(input[47:0] exp, input[47:0] key, output[47:0] out);
    assign out = exp^key;
endmodule

//primitive functions
//Too many numbers. Going to try and automate this a bit with loops
//Seems like sbox is a lookup using 6 elements from X at a time https://github.com/dkushagra/DES-Python/blob/master/DES.py#L114
//each sbox (1-8) can be an instance of a module
//created a python script to generate the 8 models using the arrays
//each s will convert 6 bit value to 4 bit. There are 8 sboxs, so there should be a 32 bit result
module S1(input [5:0] x, output reg [3:0] y);
	wire [5:0] s;
	assign s = {x[5], x[0], x[4], x[3], x[2], x[1]};
	always @(*) begin
		case (s)
			0: y=14;
			1: y=4;
			2: y=13;
			3: y=1;
			4: y=2;
			5: y=15;
			6: y=11;
			7: y=8;
			8: y=3;
			9: y=10;
			10: y=6;
			11: y=12;
			12: y=5;
			13: y=9;
			14: y=0;
			15: y=7;
			16: y=0;
			17: y=15;
			18: y=7;
			19: y=4;
			20: y=14;
			21: y=2;
			22: y=13;
			23: y=1;
			24: y=10;
			25: y=6;
			26: y=12;
			27: y=11;
			28: y=9;
			29: y=5;
			30: y=3;
			31: y=8;
			32: y=4;
			33: y=1;
			34: y=14;
			35: y=8;
			36: y=13;
			37: y=6;
			38: y=2;
			39: y=11;
			40: y=15;
			41: y=12;
			42: y=9;
			43: y=7;
			44: y=3;
			45: y=10;
			46: y=5;
			47: y=0;
			48: y=15;
			49: y=12;
			50: y=8;
			51: y=2;
			52: y=4;
			53: y=9;
			54: y=1;
			55: y=7;
			56: y=5;
			57: y=11;
			58: y=3;
			59: y=14;
			60: y=10;
			61: y=0;
			62: y=6;
			63: y=13;
		endcase
	end
endmodule
module S2(input [5:0] x, output reg [3:0] y);
	wire [5:0] s;
	assign s = {x[5], x[0], x[4], x[3], x[2], x[1]};
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
	wire [5:0] s;
	assign s = {x[5], x[0], x[4], x[3], x[2], x[1]};
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
	wire [5:0] s;
	assign s = {x[5], x[0], x[4], x[3], x[2], x[1]};
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
	wire [5:0] s;
	assign s = {x[5], x[0], x[4], x[3], x[2], x[1]};
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
	wire [5:0] s;
	assign s = {x[5], x[0], x[4], x[3], x[2], x[1]};
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
	wire [5:0] s;
	assign s = {x[5], x[0], x[4], x[3], x[2], x[1]};
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
	wire [5:0] s;
	assign s = {x[5], x[0], x[4], x[3], x[2], x[1]};
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

module Pbox(input [0:31] in, output [0:31] out);
	assign out[0] = in[15];
	assign out[1] = in[6];
	assign out[2] = in[19];
	assign out[3] = in[20];
	assign out[4] = in[28];
	assign out[5] = in[11];
	assign out[6] = in[27];
	assign out[7] = in[16];
	assign out[8] = in[0];
	assign out[9] = in[14];
	assign out[10] = in[22];
	assign out[11] = in[25];
	assign out[12] = in[4];
	assign out[13] = in[17];
	assign out[14] = in[30];
	assign out[15] = in[9];
	assign out[16] = in[1];
	assign out[17] = in[7];
	assign out[18] = in[23];
	assign out[19] = in[13];
	assign out[20] = in[31];
	assign out[21] = in[26];
	assign out[22] = in[2];
	assign out[23] = in[8];
	assign out[24] = in[18];
	assign out[25] = in[12];
	assign out[26] = in[29];
	assign out[27] = in[5];
	assign out[28] = in[21];
	assign out[29] = in[10];
	assign out[30] = in[3];
	assign out[31] = in[24];
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
    );
    //connect to the S1-S8
    wire[5:0] S1_in, S2_in, S3_in, S4_in, S5_in, S6_in, S7_in, S8_in;
    assign {S1_in, S2_in, S3_in, S4_in, S5_in, S6_in, S7_in, S8_in} = xorkey_out;
    wire[3:0] S1_out, S2_out, S3_out, S4_out, S5_out, S6_out, S7_out, S8_out;
    // S1(input [5:0] x, output [3:0] y);
    S1 s1box(S1_in, S1_out);
    S2 s2box(S2_in, S2_out);
    S3 s3box(S3_in, S3_out);
    S4 s4box(S4_in, S4_out);
    S5 s5box(S5_in, S5_out);
    S6 s6box(S6_in, S6_out);
    S7 s7box(S7_in, S7_out);
    S8 s8box(S8_in, S8_out);
    wire [31:0] S_out;
    assign S_out = {S1_out, S2_out, S3_out, S4_out, S5_out, S6_out, S7_out, S8_out};
    //connect to Pbox
    // module Pbox(input [31:0] x, output [31:0] out);
    wire[31:0] P_out;
    Pbox pbox(
        .in(S_out),
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

module Initial_Permute(input [64:1] plaintext, output [63:0] ip); //have to offset plaintext since it starts at 1
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
    assign right = in[63:32];
    assign left = in[31:0];
endmodule

module PC1(input [0:63] in, output [0:55] out); //had to flip bit order.
	assign out[0] = in[56];
	assign out[1] = in[48];
	assign out[2] = in[40];
	assign out[3] = in[32];
	assign out[4] = in[24];
	assign out[5] = in[16];
	assign out[6] = in[8];
	assign out[7] = in[0];
	assign out[8] = in[57];
	assign out[9] = in[49];
	assign out[10] = in[41];
	assign out[11] = in[33];
	assign out[12] = in[25];
	assign out[13] = in[17];
	assign out[14] = in[9];
	assign out[15] = in[1];
	assign out[16] = in[58];
	assign out[17] = in[50];
	assign out[18] = in[42];
	assign out[19] = in[34];
	assign out[20] = in[26];
	assign out[21] = in[18];
	assign out[22] = in[10];
	assign out[23] = in[2];
	assign out[24] = in[59];
	assign out[25] = in[51];
	assign out[26] = in[43];
	assign out[27] = in[35];
	assign out[28] = in[62];
	assign out[29] = in[54];
	assign out[30] = in[46];
	assign out[31] = in[38];
	assign out[32] = in[30];
	assign out[33] = in[22];
	assign out[34] = in[14];
	assign out[35] = in[6];
	assign out[36] = in[61];
	assign out[37] = in[53];
	assign out[38] = in[45];
	assign out[39] = in[37];
	assign out[40] = in[29];
	assign out[41] = in[21];
	assign out[42] = in[13];
	assign out[43] = in[5];
	assign out[44] = in[60];
	assign out[45] = in[52];
	assign out[46] = in[44];
	assign out[47] = in[36];
	assign out[48] = in[28];
	assign out[49] = in[20];
	assign out[50] = in[12];
	assign out[51] = in[4];
	assign out[52] = in[27];
	assign out[53] = in[19];
	assign out[54] = in[11];
	assign out[55] = in[3];
endmodule

module Split_C_D(input[55:0] pc1_in, output [27:0] c, output[27:0] d);
    assign c = pc1_in[55:28];
    assign d = pc1_in[27:0];
endmodule

module PC2(input [0:55] in, output [0:47] out);
	assign out[0] = in[13];
	assign out[1] = in[16];
	assign out[2] = in[10];
	assign out[3] = in[23];
	assign out[4] = in[0];
	assign out[5] = in[4];
	assign out[6] = in[2];
	assign out[7] = in[27];
	assign out[8] = in[14];
	assign out[9] = in[5];
	assign out[10] = in[20];
	assign out[11] = in[9];
	assign out[12] = in[22];
	assign out[13] = in[18];
	assign out[14] = in[11];
	assign out[15] = in[3];
	assign out[16] = in[25];
	assign out[17] = in[7];
	assign out[18] = in[15];
	assign out[19] = in[6];
	assign out[20] = in[26];
	assign out[21] = in[19];
	assign out[22] = in[12];
	assign out[23] = in[1];
	assign out[24] = in[40];
	assign out[25] = in[51];
	assign out[26] = in[30];
	assign out[27] = in[36];
	assign out[28] = in[46];
	assign out[29] = in[54];
	assign out[30] = in[29];
	assign out[31] = in[39];
	assign out[32] = in[50];
	assign out[33] = in[44];
	assign out[34] = in[32];
	assign out[35] = in[47];
	assign out[36] = in[43];
	assign out[37] = in[48];
	assign out[38] = in[38];
	assign out[39] = in[55];
	assign out[40] = in[33];
	assign out[41] = in[52];
	assign out[42] = in[45];
	assign out[43] = in[41];
	assign out[44] = in[49];
	assign out[45] = in[35];
	assign out[46] = in[28];
	assign out[47] = in[31];
endmodule

module InverseP(input [0:63] in, output [0:63] out);
	assign out[0] = in[39];
	assign out[1] = in[7];
	assign out[2] = in[47];
	assign out[3] = in[15];
	assign out[4] = in[55];
	assign out[5] = in[23];
	assign out[6] = in[63];
	assign out[7] = in[31];
	assign out[8] = in[38];
	assign out[9] = in[6];
	assign out[10] = in[46];
	assign out[11] = in[14];
	assign out[12] = in[54];
	assign out[13] = in[22];
	assign out[14] = in[62];
	assign out[15] = in[30];
	assign out[16] = in[37];
	assign out[17] = in[5];
	assign out[18] = in[45];
	assign out[19] = in[13];
	assign out[20] = in[53];
	assign out[21] = in[21];
	assign out[22] = in[61];
	assign out[23] = in[29];
	assign out[24] = in[36];
	assign out[25] = in[4];
	assign out[26] = in[44];
	assign out[27] = in[12];
	assign out[28] = in[52];
	assign out[29] = in[20];
	assign out[30] = in[60];
	assign out[31] = in[28];
	assign out[32] = in[35];
	assign out[33] = in[3];
	assign out[34] = in[43];
	assign out[35] = in[11];
	assign out[36] = in[51];
	assign out[37] = in[19];
	assign out[38] = in[59];
	assign out[39] = in[27];
	assign out[40] = in[34];
	assign out[41] = in[2];
	assign out[42] = in[42];
	assign out[43] = in[10];
	assign out[44] = in[50];
	assign out[45] = in[18];
	assign out[46] = in[58];
	assign out[47] = in[26];
	assign out[48] = in[33];
	assign out[49] = in[1];
	assign out[50] = in[41];
	assign out[51] = in[9];
	assign out[52] = in[49];
	assign out[53] = in[17];
	assign out[54] = in[57];
	assign out[55] = in[25];
	assign out[56] = in[32];
	assign out[57] = in[0];
	assign out[58] = in[40];
	assign out[59] = in[8];
	assign out[60] = in[48];
	assign out[61] = in[16];
	assign out[62] = in[56];
	assign out[63] = in[24];
endmodule

module Key_Shift1(input [27:0] in, output [27:0] shifted);
    assign shifted = {in[26:0], in[27]};
endmodule

module Key_Shift2(input [27:0] in, output [27:0] shifted);
    assign shifted = {in[25:0], in[27:26]};
endmodule

module Key_Generator 
    #(parameter key_out_width=48,
    parameter num_keys=16)
    ( input [63:0] keyin, 
        output [(num_keys*key_out_width -1): 0] keys_out
    );
    wire[55:0] pc1_out;
    wire[27:0] C [16:0];
    wire[27:0] D [16:0];
    wire [47:0] keys [16:1];
    PC1 pc1(keyin, pc1_out);
    Split_C_D splitcd(pc1_out, C[0], D[0]);
    	//layer 1 - left shift by 1 then PC2 to key1
	Key_Shift1 ks1c(C[0], C[1]);
	Key_Shift1 ks1d(D[0], D[1]);
	PC2 pc2_1 ({C[1], D[1]}, keys[1]);
	//layer 2 - left shift by 1 then PC2 to key1
	Key_Shift1 ks2c(C[1], C[2]);
	Key_Shift1 ks2d(D[1], D[2]);
	PC2 pc2_2 ({C[2], D[2]}, keys[2]);
	//layer 3 - left shift by 2 then PC2 to key1
	Key_Shift2 ks3c(C[2], C[3]);
	Key_Shift2 ks3d(D[2], D[3]);
	PC2 pc2_3 ({C[3], D[3]}, keys[3]);
	//layer 4 - left shift by 2 then PC2 to key1
	Key_Shift2 ks4c(C[3], C[4]);
	Key_Shift2 ks4d(D[3], D[4]);
	PC2 pc2_4 ({C[4], D[4]}, keys[4]);
	//layer 5 - left shift by 2 then PC2 to key1
	Key_Shift2 ks5c(C[4], C[5]);
	Key_Shift2 ks5d(D[4], D[5]);
	PC2 pc2_5 ({C[5], D[5]}, keys[5]);
	//layer 6 - left shift by 2 then PC2 to key1
	Key_Shift2 ks6c(C[5], C[6]);
	Key_Shift2 ks6d(D[5], D[6]);
	PC2 pc2_6 ({C[6], D[6]}, keys[6]);
	//layer 7 - left shift by 2 then PC2 to key1
	Key_Shift2 ks7c(C[6], C[7]);
	Key_Shift2 ks7d(D[6], D[7]);
	PC2 pc2_7 ({C[7], D[7]}, keys[7]);
	//layer 8 - left shift by 2 then PC2 to key1
	Key_Shift2 ks8c(C[7], C[8]);
	Key_Shift2 ks8d(D[7], D[8]);
	PC2 pc2_8 ({C[8], D[8]}, keys[8]);
	//layer 9 - left shift by 1 then PC2 to key1
	Key_Shift1 ks9c(C[8], C[9]);
	Key_Shift1 ks9d(D[8], D[9]);
	PC2 pc2_9 ({C[9], D[9]}, keys[9]);
	//layer 10 - left shift by 2 then PC2 to key1
	Key_Shift2 ks10c(C[9], C[10]);
	Key_Shift2 ks10d(D[9], D[10]);
	PC2 pc2_10 ({C[10], D[10]}, keys[10]);
	//layer 11 - left shift by 2 then PC2 to key1
	Key_Shift2 ks11c(C[10], C[11]);
	Key_Shift2 ks11d(D[10], D[11]);
	PC2 pc2_11 ({C[11], D[11]}, keys[11]);
	//layer 12 - left shift by 2 then PC2 to key1
	Key_Shift2 ks12c(C[11], C[12]);
	Key_Shift2 ks12d(D[11], D[12]);
	PC2 pc2_12 ({C[12], D[12]}, keys[12]);
	//layer 13 - left shift by 2 then PC2 to key1
	Key_Shift2 ks13c(C[12], C[13]);
	Key_Shift2 ks13d(D[12], D[13]);
	PC2 pc2_13 ({C[13], D[13]}, keys[13]);
	//layer 14 - left shift by 2 then PC2 to key1
	Key_Shift2 ks14c(C[13], C[14]);
	Key_Shift2 ks14d(D[13], D[14]);
	PC2 pc2_14 ({C[14], D[14]}, keys[14]);
	//layer 15 - left shift by 2 then PC2 to key1
	Key_Shift2 ks15c(C[14], C[15]);
	Key_Shift2 ks15d(D[14], D[15]);
	PC2 pc2_15 ({C[15], D[15]}, keys[15]);
	//layer 16 - left shift by 1 then PC2 to key1
	Key_Shift1 ks16c(C[15], C[16]);
	Key_Shift1 ks16d(D[15], D[16]);
	PC2 pc2_16 ({C[16], D[16]}, keys[16]);
	assign keys_out = {keys[16], keys[15], keys[14], keys[13], keys[12], keys[11], keys[10], keys[9], keys[8], keys[7], keys[6], keys[5], keys[4], keys[3], keys[2], keys[1]};
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
    output [63:0] ciphertext,
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

    wire [47:0] keys[16:1]; //keys that will be generated later. keys[layer#][key#] //don't need 0

    // Key_Generator(input [63:0] keyin, output [47:0] keys [16:1]);
    Key_Generator key_gen(key, {keys[16], keys[15], keys[14], keys[13], keys[12], keys[11], keys[10], keys[9], keys[8], keys[7], keys[6], keys[5], keys[4], keys[3], keys[2], keys[1]});

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

    /*  begin lr layers */
    //calculate l1 and r1
    //Func_right(input[31:0] left, input [31:0] right, input[47:0] key, output[31:0] out);
    wire[31:0] l1, r1, l1_reg_out, r1_reg_out;
    Func_right layer1(l0_reg_out, r0_reg_out, keys[1], r1);
    assign l1 = r0_reg_out;
    Flipflop_32 l1_reg (clock, reset, l1, l1_reg_out);
    Flipflop_32 r1_reg (clock, reset, r1, r1_reg_out);
    //calculate l2 and r2
    //Func_right(input[31:0] left, input [31:0] right, input[47:0] key, output[31:0] out);
    wire[31:0] l2, r2, l2_reg_out, r2_reg_out;
    Func_right layer2(l1_reg_out, r1_reg_out, keys[2], r2);
    assign l2 = r1_reg_out;
    Flipflop_32 l2_reg (clock, reset, l2, l2_reg_out);
    Flipflop_32 r2_reg (clock, reset, r2, r2_reg_out);
    //calculate l3 and r3
    //Func_right(input[31:0] left, input [31:0] right, input[47:0] key, output[31:0] out);
    wire[31:0] l3, r3, l3_reg_out, r3_reg_out;
    Func_right layer3(l2_reg_out, r2_reg_out, keys[3], r3);
    assign l3 = r2_reg_out;
    Flipflop_32 l3_reg (clock, reset, l3, l3_reg_out);
    Flipflop_32 r3_reg (clock, reset, r3, r3_reg_out);
    //calculate l4 and r4
    //Func_right(input[31:0] left, input [31:0] right, input[47:0] key, output[31:0] out);
    wire[31:0] l4, r4, l4_reg_out, r4_reg_out;
    Func_right layer4(l3_reg_out, r3_reg_out, keys[4], r4);
    assign l4 = r3_reg_out;
    Flipflop_32 l4_reg (clock, reset, l4, l4_reg_out);
    Flipflop_32 r4_reg (clock, reset, r4, r4_reg_out);
    //calculate l5 and r5
    //Func_right(input[31:0] left, input [31:0] right, input[47:0] key, output[31:0] out);
    wire[31:0] l5, r5, l5_reg_out, r5_reg_out;
    Func_right layer5(l4_reg_out, r4_reg_out, keys[5], r5);
    assign l5 = r4_reg_out;
    Flipflop_32 l5_reg (clock, reset, l5, l5_reg_out);
    Flipflop_32 r5_reg (clock, reset, r5, r5_reg_out);
    //calculate l6 and r6
    //Func_right(input[31:0] left, input [31:0] right, input[47:0] key, output[31:0] out);
    wire[31:0] l6, r6, l6_reg_out, r6_reg_out;
    Func_right layer6(l5_reg_out, r5_reg_out, keys[6], r6);
    assign l6 = r5_reg_out;
    Flipflop_32 l6_reg (clock, reset, l6, l6_reg_out);
    Flipflop_32 r6_reg (clock, reset, r6, r6_reg_out);
    //calculate l7 and r7
    //Func_right(input[31:0] left, input [31:0] right, input[47:0] key, output[31:0] out);
    wire[31:0] l7, r7, l7_reg_out, r7_reg_out;
    Func_right layer7(l6_reg_out, r6_reg_out, keys[7], r7);
    assign l7 = r6_reg_out;
    Flipflop_32 l7_reg (clock, reset, l7, l7_reg_out);
    Flipflop_32 r7_reg (clock, reset, r7, r7_reg_out);
    //calculate l8 and r8
    //Func_right(input[31:0] left, input [31:0] right, input[47:0] key, output[31:0] out);
    wire[31:0] l8, r8, l8_reg_out, r8_reg_out;
    Func_right layer8(l7_reg_out, r7_reg_out, keys[8], r8);
    assign l8 = r7_reg_out;
    Flipflop_32 l8_reg (clock, reset, l8, l8_reg_out);
    Flipflop_32 r8_reg (clock, reset, r8, r8_reg_out);
    //calculate l9 and r9
    //Func_right(input[31:0] left, input [31:0] right, input[47:0] key, output[31:0] out);
    wire[31:0] l9, r9, l9_reg_out, r9_reg_out;
    Func_right layer9(l8_reg_out, r8_reg_out, keys[9], r9);
    assign l9 = r8_reg_out;
    Flipflop_32 l9_reg (clock, reset, l9, l9_reg_out);
    Flipflop_32 r9_reg (clock, reset, r9, r9_reg_out);
    //calculate l10 and r10
    //Func_right(input[31:0] left, input [31:0] right, input[47:0] key, output[31:0] out);
    wire[31:0] l10, r10, l10_reg_out, r10_reg_out;
    Func_right layer10(l9_reg_out, r9_reg_out, keys[10], r10);
    assign l10 = r9_reg_out;
    Flipflop_32 l10_reg (clock, reset, l10, l10_reg_out);
    Flipflop_32 r10_reg (clock, reset, r10, r10_reg_out);
    //calculate l11 and r11
    //Func_right(input[31:0] left, input [31:0] right, input[47:0] key, output[31:0] out);
    wire[31:0] l11, r11, l11_reg_out, r11_reg_out;
    Func_right layer11(l10_reg_out, r10_reg_out, keys[11], r11);
    assign l11 = r10_reg_out;
    Flipflop_32 l11_reg (clock, reset, l11, l11_reg_out);
    Flipflop_32 r11_reg (clock, reset, r11, r11_reg_out);
    //calculate l12 and r12
    //Func_right(input[31:0] left, input [31:0] right, input[47:0] key, output[31:0] out);
    wire[31:0] l12, r12, l12_reg_out, r12_reg_out;
    Func_right layer12(l11_reg_out, r11_reg_out, keys[12], r12);
    assign l12 = r11_reg_out;
    Flipflop_32 l12_reg (clock, reset, l12, l12_reg_out);
    Flipflop_32 r12_reg (clock, reset, r12, r12_reg_out);
    //calculate l13 and r13
    //Func_right(input[31:0] left, input [31:0] right, input[47:0] key, output[31:0] out);
    wire[31:0] l13, r13, l13_reg_out, r13_reg_out;
    Func_right layer13(l12_reg_out, r12_reg_out, keys[13], r13);
    assign l13 = r12_reg_out;
    Flipflop_32 l13_reg (clock, reset, l13, l13_reg_out);
    Flipflop_32 r13_reg (clock, reset, r13, r13_reg_out);
    //calculate l14 and r14
    //Func_right(input[31:0] left, input [31:0] right, input[47:0] key, output[31:0] out);
    wire[31:0] l14, r14, l14_reg_out, r14_reg_out;
    Func_right layer14(l13_reg_out, r13_reg_out, keys[14], r14);
    assign l14 = r13_reg_out;
    Flipflop_32 l14_reg (clock, reset, l14, l14_reg_out);
    Flipflop_32 r14_reg (clock, reset, r14, r14_reg_out);
    //calculate l15 and r15
    //Func_right(input[31:0] left, input [31:0] right, input[47:0] key, output[31:0] out);
    wire[31:0] l15, r15, l15_reg_out, r15_reg_out;
    Func_right layer15(l14_reg_out, r14_reg_out, keys[15], r15);
    assign l15 = r14_reg_out;
    Flipflop_32 l15_reg (clock, reset, l15, l15_reg_out);
    Flipflop_32 r15_reg (clock, reset, r15, r15_reg_out);
    //calculate l16 and r16
    //Func_right(input[31:0] left, input [31:0] right, input[47:0] key, output[31:0] out);
    wire[31:0] l16, r16, l16_reg_out, r16_reg_out;
    Func_right layer16(l15_reg_out, r15_reg_out, keys[16], r16);
    assign l16 = r15_reg_out;
    Flipflop_32 l16_reg (clock, reset, l16, l16_reg_out);
    Flipflop_32 r16_reg (clock, reset, r16, r16_reg_out);
    
    /*  end lr layers */
    
    //final permutation before output
    //InverseP(input [63:0] in, output [55:0] out);
    wire [63:0] final_text;
    InverseP final_perm({r16_reg_out, l16_reg_out}, final_text);
    Flipflop_64 output_reg(clock, reset, final_text, ciphertext);

endmodule