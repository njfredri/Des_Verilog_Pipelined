module Initial_Permute(input [1:64] plaintext, output [1:64] ip);
//     int IP[] =
// {
//     58, 50, 42, 34, 26, 18, 10, 2,
//     60, 52, 44, 36, 28, 20, 12, 4,
//     62, 54, 46, 38, 30, 22, 14, 6,
//     64, 56, 48, 40, 32, 24, 16, 8,
//     57, 49, 41, 33, 25, 17,  9, 1,
//     59, 51, 43, 35, 27, 19, 11, 3,
//     61, 53, 45, 37, 29, 21, 13, 5,
//     63, 55, 47, 39, 31, 23, 15, 7
// };
  assign ip[1] = plaintext[58];
  assign ip[2] = plaintext[50];
  assign ip[3] = plaintext[42];
  assign ip[4] = plaintext[34];
  assign ip[5] = plaintext[26];
  assign ip[6] = plaintext[18];
  assign ip[7] = plaintext[10];
  assign ip[8] = plaintext[2];
  assign ip[9] = plaintext[60];
  assign ip[10] = plaintext[52];
  assign ip[11] = plaintext[44];
  assign ip[12] = plaintext[36];
  assign ip[13] = plaintext[28];
  assign ip[14] = plaintext[20];
  assign ip[15] = plaintext[12];
  assign ip[16] = plaintext[4];
  assign ip[17] = plaintext[62];
  assign ip[18] = plaintext[54];
  assign ip[19] = plaintext[46];
  assign ip[20] = plaintext[38];
  assign ip[21] = plaintext[30];
  assign ip[22] = plaintext[22];
  assign ip[23] = plaintext[14];
  assign ip[24] = plaintext[6];
  assign ip[25] = plaintext[64];
  assign ip[26] = plaintext[56];
  assign ip[27] = plaintext[48];
  assign ip[28] = plaintext[40];
  assign ip[29] = plaintext[32];
  assign ip[30] = plaintext[24];
  assign ip[31] = plaintext[16];
  assign ip[32] = plaintext[8];
  assign ip[33] = plaintext[57];
  assign ip[34] = plaintext[49];
  assign ip[35] = plaintext[41];
  assign ip[36] = plaintext[33];
  assign ip[37] = plaintext[25];
  assign ip[38] = plaintext[17];
  assign ip[39] = plaintext[9];
  assign ip[40] = plaintext[1];
  assign ip[41] = plaintext[59];
  assign ip[42] = plaintext[51];
  assign ip[43] = plaintext[43];
  assign ip[44] = plaintext[35];
  assign ip[45] = plaintext[27];
  assign ip[46] = plaintext[19];
  assign ip[47] = plaintext[11];
  assign ip[48] = plaintext[3];
  assign ip[49] = plaintext[61];
  assign ip[50] = plaintext[53];
  assign ip[51] = plaintext[45];
  assign ip[52] = plaintext[37];
  assign ip[53] = plaintext[29];
  assign ip[54] = plaintext[21];
  assign ip[55] = plaintext[13];
  assign ip[56] = plaintext[5];
  assign ip[57] = plaintext[63];
  assign ip[58] = plaintext[55];
  assign ip[59] = plaintext[47];
  assign ip[60] = plaintext[39];
  assign ip[61] = plaintext[31];
  assign ip[62] = plaintext[23];
  assign ip[63] = plaintext[15];
  assign ip[64] = plaintext[7];
endmodule

module split_lr (input [63:0] in, output [31:0] right, output [31:0] left);
    assign right = in[31:0];
    assign left = in[63:31];
endmodule

module expand_r (input [31:0] r, output [47:0] exp);
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

module xor_with_key(input[47:0] exp, input[48:0] key, output[48:0]);
    assign output = exp^key;
endmodule

//primitive functions
//Too many numbers. Going to try and automate this a bit with loops
//Seems like sbox is a lookup using 6 elements from X at a time https://github.com/dkushagra/DES-Python/blob/master/DES.py#L114
//each sbox (1-8) can be an instance of a module
//each s will convert 6 bit value to 4 bit. There are 8 sboxs, so there should be a 32 bit result
module S1_Lookup(input [5:0] x, input rst, output [3:0] y);
    reg [1:0] r;
    reg [3:0] c;
    reg [5:0] comb;

    comb = {r, c};
    always@(*) begin //todo: check if bit order needs to flip or not
        //r=input[0]*2 + input[5] //equals input[0]<<1 + input[5]
        //since both ^ are 1 bit, then adding is the same as concatenating
        if(rst)

        else begin
            r = {x[0], x[5]};
            //c = 8 * b[1] + 4 * b[2] + 2 * b[3] + b[4];
            //             int S1[4][16] =
            //  row 0, col 2 = 2            row1, col2 = 18
            //         14,  4, 13,  1,  2, 15, 11,  8,  3, 10,  6, 12,  5,  9,  0,  7,  row 0
            //         0, 15,  7,  4, 14,  2, 13,  1, 10,  6, 12, 11,  9,  5,  3,  8,   row 1
            //         4,  1, 14,  8, 13,  6,  2, 11, 15, 12,  9,  7,  3, 10,  5,  0,   row 2
            //         15, 12,  8,  2,  4,  9,  1,  7,  5, 11,  3, 14, 10,  0,  6, 13   row 3
            // };
            c = {x[1], x[2], x[3], x[4]};

            case(comb)
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
                //         0, 15,  7,  4, 14,  2, 13,  1, 10,  6, 12, 11,  9,  5,  3,  8,   row 1
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
                //         4,  1, 14,  8, 13,  6,  2, 11, 15, 12,  9,  7,  3, 10,  5,  0,   row 2   
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
                45: y=10
                46: y=5;
                47: y=0;
                //         15, 12,  8,  2,  4,  9,  1,  7,  5, 11,  3, 14, 10,  0,  6, 13   row 3
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
                default: y=0;
            endcase

            // y = s[r][c];
        end
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

module xor_with_left(input [31:0] left, input[31:0] r, output [31:0] out);
    assign out=left^r;
endmodule

module func_right(input [31:0] right, output[31:0] out); //combine all of the sequential circuit

endmodule

module des (
    input clock,
    input reset, //synchronous high
    input [63:0] key,
    input [63:0] plaintext,
    input iv, //says that there is a valid input
    output reg [63:0] ciphertext,
    output reg ov
);

endmodule
