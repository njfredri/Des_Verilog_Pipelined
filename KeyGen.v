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
