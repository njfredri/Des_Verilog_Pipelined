//calculate l1 and r1
    //Func_right(input[31:0] left, input [31:0] right, input[47:0] key, output[31:0] out);
    wire[31:0] l1, r1, l1_reg_out, r1_reg_out;
    Func_right layer1(l0_reg_out, r0_reg_out, key[1], r1);
    assign l1 = r0_reg_out;
    Flipflop_32 l1_reg (clock, reset, l1, l1_reg_out);
    Flipflop_32 r1_reg (clock, reset, r1, r1_reg_out);
    //calculate l2 and r2
    //Func_right(input[31:0] left, input [31:0] right, input[47:0] key, output[31:0] out);
    wire[31:0] l2, r2, l2_reg_out, r2_reg_out;
    Func_right layer2(l1_reg_out, r1_reg_out, key[2], r2);
    assign l2 = r1_reg_out;
    Flipflop_32 l2_reg (clock, reset, l2, l2_reg_out);
    Flipflop_32 r2_reg (clock, reset, r2, r2_reg_out);
    //calculate l3 and r3
    //Func_right(input[31:0] left, input [31:0] right, input[47:0] key, output[31:0] out);
    wire[31:0] l3, r3, l3_reg_out, r3_reg_out;
    Func_right layer3(l2_reg_out, r2_reg_out, key[3], r3);
    assign l3 = r2_reg_out;
    Flipflop_32 l3_reg (clock, reset, l3, l3_reg_out);
    Flipflop_32 r3_reg (clock, reset, r3, r3_reg_out);
    //calculate l4 and r4
    //Func_right(input[31:0] left, input [31:0] right, input[47:0] key, output[31:0] out);
    wire[31:0] l4, r4, l4_reg_out, r4_reg_out;
    Func_right layer4(l3_reg_out, r3_reg_out, key[4], r4);
    assign l4 = r3_reg_out;
    Flipflop_32 l4_reg (clock, reset, l4, l4_reg_out);
    Flipflop_32 r4_reg (clock, reset, r4, r4_reg_out);
    //calculate l5 and r5
    //Func_right(input[31:0] left, input [31:0] right, input[47:0] key, output[31:0] out);
    wire[31:0] l5, r5, l5_reg_out, r5_reg_out;
    Func_right layer5(l4_reg_out, r4_reg_out, key[5], r5);
    assign l5 = r4_reg_out;
    Flipflop_32 l5_reg (clock, reset, l5, l5_reg_out);
    Flipflop_32 r5_reg (clock, reset, r5, r5_reg_out);
    //calculate l6 and r6
    //Func_right(input[31:0] left, input [31:0] right, input[47:0] key, output[31:0] out);
    wire[31:0] l6, r6, l6_reg_out, r6_reg_out;
    Func_right layer6(l5_reg_out, r5_reg_out, key[6], r6);
    assign l6 = r5_reg_out;
    Flipflop_32 l6_reg (clock, reset, l6, l6_reg_out);
    Flipflop_32 r6_reg (clock, reset, r6, r6_reg_out);
    //calculate l7 and r7
    //Func_right(input[31:0] left, input [31:0] right, input[47:0] key, output[31:0] out);
    wire[31:0] l7, r7, l7_reg_out, r7_reg_out;
    Func_right layer7(l6_reg_out, r6_reg_out, key[7], r7);
    assign l7 = r6_reg_out;
    Flipflop_32 l7_reg (clock, reset, l7, l7_reg_out);
    Flipflop_32 r7_reg (clock, reset, r7, r7_reg_out);
    //calculate l8 and r8
    //Func_right(input[31:0] left, input [31:0] right, input[47:0] key, output[31:0] out);
    wire[31:0] l8, r8, l8_reg_out, r8_reg_out;
    Func_right layer8(l7_reg_out, r7_reg_out, key[8], r8);
    assign l8 = r7_reg_out;
    Flipflop_32 l8_reg (clock, reset, l8, l8_reg_out);
    Flipflop_32 r8_reg (clock, reset, r8, r8_reg_out);
    //calculate l9 and r9
    //Func_right(input[31:0] left, input [31:0] right, input[47:0] key, output[31:0] out);
    wire[31:0] l9, r9, l9_reg_out, r9_reg_out;
    Func_right layer9(l8_reg_out, r8_reg_out, key[9], r9);
    assign l9 = r8_reg_out;
    Flipflop_32 l9_reg (clock, reset, l9, l9_reg_out);
    Flipflop_32 r9_reg (clock, reset, r9, r9_reg_out);
    //calculate l10 and r10
    //Func_right(input[31:0] left, input [31:0] right, input[47:0] key, output[31:0] out);
    wire[31:0] l10, r10, l10_reg_out, r10_reg_out;
    Func_right layer10(l9_reg_out, r9_reg_out, key[10], r10);
    assign l10 = r9_reg_out;
    Flipflop_32 l10_reg (clock, reset, l10, l10_reg_out);
    Flipflop_32 r10_reg (clock, reset, r10, r10_reg_out);
    //calculate l11 and r11
    //Func_right(input[31:0] left, input [31:0] right, input[47:0] key, output[31:0] out);
    wire[31:0] l11, r11, l11_reg_out, r11_reg_out;
    Func_right layer11(l10_reg_out, r10_reg_out, key[11], r11);
    assign l11 = r10_reg_out;
    Flipflop_32 l11_reg (clock, reset, l11, l11_reg_out);
    Flipflop_32 r11_reg (clock, reset, r11, r11_reg_out);
    //calculate l12 and r12
    //Func_right(input[31:0] left, input [31:0] right, input[47:0] key, output[31:0] out);
    wire[31:0] l12, r12, l12_reg_out, r12_reg_out;
    Func_right layer12(l11_reg_out, r11_reg_out, key[12], r12);
    assign l12 = r11_reg_out;
    Flipflop_32 l12_reg (clock, reset, l12, l12_reg_out);
    Flipflop_32 r12_reg (clock, reset, r12, r12_reg_out);
    //calculate l13 and r13
    //Func_right(input[31:0] left, input [31:0] right, input[47:0] key, output[31:0] out);
    wire[31:0] l13, r13, l13_reg_out, r13_reg_out;
    Func_right layer13(l12_reg_out, r12_reg_out, key[13], r13);
    assign l13 = r12_reg_out;
    Flipflop_32 l13_reg (clock, reset, l13, l13_reg_out);
    Flipflop_32 r13_reg (clock, reset, r13, r13_reg_out);
    //calculate l14 and r14
    //Func_right(input[31:0] left, input [31:0] right, input[47:0] key, output[31:0] out);
    wire[31:0] l14, r14, l14_reg_out, r14_reg_out;
    Func_right layer14(l13_reg_out, r13_reg_out, key[14], r14);
    assign l14 = r13_reg_out;
    Flipflop_32 l14_reg (clock, reset, l14, l14_reg_out);
    Flipflop_32 r14_reg (clock, reset, r14, r14_reg_out);
    //calculate l15 and r15
    //Func_right(input[31:0] left, input [31:0] right, input[47:0] key, output[31:0] out);
    wire[31:0] l15, r15, l15_reg_out, r15_reg_out;
    Func_right layer15(l14_reg_out, r14_reg_out, key[15], r15);
    assign l15 = r14_reg_out;
    Flipflop_32 l15_reg (clock, reset, l15, l15_reg_out);
    Flipflop_32 r15_reg (clock, reset, r15, r15_reg_out);
    //calculate l16 and r16
    //Func_right(input[31:0] left, input [31:0] right, input[47:0] key, output[31:0] out);
    wire[31:0] l16, r16, l16_reg_out, r16_reg_out;
    Func_right layer16(l15_reg_out, r15_reg_out, key[16], r16);
    assign l16 = r15_reg_out;
    Flipflop_32 l16_reg (clock, reset, l16, l16_reg_out);
    Flipflop_32 r16_reg (clock, reset, r16, r16_reg_out);
    