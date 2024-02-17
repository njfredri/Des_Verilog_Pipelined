// 5.5
// 9.2
`timescale 1ns/1ns
module testbench();

    reg clock, reset;
    reg [63:0] key, plaintext;
    reg iv;
    wire [63:0] ciphertext;
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

    initial begin
        reset = 0;
        key = 64'b0001001100110100010101110111100110011011101111001101111111110001;
        plaintext = 64'b0100100101101110001000000110111101101100011001000110010101101110;
        #(full_clk_period) //half a clock cycle
        reset = 1;
        #(full_clk_period)
        reset = 0;
        #(full_clk_period)
        iv = 1;
    end
endmodule