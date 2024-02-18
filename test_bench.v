// 5.5
// 9.2
`timescale 1ns/1ns
module testbench();

    reg clock, reset;
    reg [63:0] key, plaintext;
    reg iv;
    wire [63:0] ciphertext;
    reg [63:0] expected_output;
    wire ov;

    des des(
        .clock(clock),
        .reset(reset), //synchronous high
        .key(key), //this key will be fixed in this design, so you won't need to necessarily pipeline the keys
        .plaintext(plaintext),
        .iv(iv), //says that there is a valid input
        .ciphertext(ciphertext),
        .ov(ov)
    );

    //set clock
    parameter clk_tgl_period = 5;
    parameter full_clk_period = 10;
    parameter long_delay = 30;
    parameter timeout = 864000;
    initial begin
        clock = '0;
        forever #(clk_tgl_period) clock = ~clock;
    end

    // feed three plaintext blocks to the DES circuit in three consecutive clock cycles. 
    // Wait for one clock clock, feed one plaintext block.
    // Wait for one clock clock, feed two plaintext blocks in two consecutive clock cycles. 
    // Totally sixplaintext blocks are fed to the DES circuit. 
    // The iv input signal needs to set properly to indicate these six valid input data blocks.

    initial begin
        reset = 0;
        iv = 0;
        key = 64'h133457799BBCDFF1;
        plaintext = 64'h0000000000000000;
        #(full_clk_period) //half a clock cycle
        reset = 1;
        #(full_clk_period)
        // feed three plaintext blocks to the DES circuit in three consecutive clock cycles. 
        reset = 0;
        plaintext = 64'h496E206F6C64656E;
        iv = 1; //ov should be 1 as soon as output is generated
        #(full_clk_period)
        plaintext = 64'h2074696D65732077;
        iv = 1;
        #(full_clk_period)
        plaintext = 64'h68656E2077697368;
        iv = 1;
        //Wait for one clock clock, feed one plaintext block.
        #(full_clk_period) 
        iv=0;
        #(full_clk_period)
        plaintext = 64'h696E67207374696C;
        iv=1;
        // Wait for one clock clock, feed two plaintext blocks in two consecutive clock cycles. 
        #(full_clk_period)
        iv=0;
        #(full_clk_period)
        plaintext = 64'h6C2064696420736F;
        iv=1;
        #(full_clk_period)
        plaintext = 64'h6D6520676F6F6420;
        iv=1;
        #(full_clk_period)
        plaintext = 64'h0000000000000000;
        iv=0;
    end

    initial begin
        expected_output=0;
        //first output at 205ns
        #205
        expected_output=64'hF095CDC9B8A0AD83;
        #(full_clk_period)
        expected_output=64'h4109113BAD212ADE;
        #(full_clk_period)
        expected_output=64'h7ECF0E52ADD999DE;
        #(full_clk_period*2)
        expected_output=64'h7EB3D91ED1D4CFCE;
        #(full_clk_period*2)
        expected_output=64'h3DDBACAC1B9F5C23;
        #(full_clk_period)
        expected_output=64'h3F40E069D50EAA11;
    end
endmodule