onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -expand -group top /testbench/clock
add wave -noupdate -expand -group top /testbench/reset
add wave -noupdate -expand -group top /testbench/key
add wave -noupdate -expand -group top /testbench/plaintext
add wave -noupdate -expand -group top /testbench/iv
add wave -noupdate -expand -group top /testbench/ciphertext
add wave -noupdate -expand -group top /testbench/ov
add wave -noupdate -group beg /testbench/des/input_reg_out
add wave -noupdate -group beg /testbench/des/keys
add wave -noupdate -group beg /testbench/des/ip_out
add wave -noupdate -group lay0 /testbench/des/l0
add wave -noupdate -group lay0 /testbench/des/r0
add wave -noupdate -group lay0 /testbench/des/l0_reg_out
add wave -noupdate -group lay0 /testbench/des/r0_reg_out
add wave -noupdate -group lay1 /testbench/des/l1
add wave -noupdate -group lay1 /testbench/des/r1
add wave -noupdate -group lay1 /testbench/des/l1_reg_out
add wave -noupdate -group lay1 /testbench/des/r1_reg_out
add wave -noupdate -group l0_ff /testbench/des/l0_reg/clk
add wave -noupdate -group l0_ff /testbench/des/l0_reg/rst
add wave -noupdate -group l0_ff /testbench/des/l0_reg/in
add wave -noupdate -group l0_ff /testbench/des/l0_reg/out
add wave -noupdate -group r0_ff /testbench/des/r0_reg/clk
add wave -noupdate -group r0_ff /testbench/des/r0_reg/rst
add wave -noupdate -group r0_ff /testbench/des/r0_reg/in
add wave -noupdate -group r0_ff /testbench/des/r0_reg/out
add wave -noupdate -group l1_ff /testbench/des/l1_reg/clk
add wave -noupdate -group l1_ff /testbench/des/l1_reg/rst
add wave -noupdate -group l1_ff /testbench/des/l1_reg/in
add wave -noupdate -group l1_ff /testbench/des/l1_reg/out
add wave -noupdate -group r1_ff /testbench/des/r1_reg/clk
add wave -noupdate -group r1_ff /testbench/des/r1_reg/rst
add wave -noupdate -group r1_ff /testbench/des/r1_reg/in
add wave -noupdate -group r1_ff /testbench/des/r1_reg/out
add wave -noupdate -group lay1_comb /testbench/des/layer1/left
add wave -noupdate -group lay1_comb /testbench/des/layer1/right
add wave -noupdate -group lay1_comb /testbench/des/layer1/key
add wave -noupdate -group lay1_comb /testbench/des/layer1/out
add wave -noupdate -group lay1_comb /testbench/des/layer1/expandedr
add wave -noupdate -group lay1_comb /testbench/des/layer1/xorkey_out
add wave -noupdate -group lay1_comb /testbench/des/layer1/S1_in
add wave -noupdate -group lay1_comb /testbench/des/layer1/S2_in
add wave -noupdate -group lay1_comb /testbench/des/layer1/S3_in
add wave -noupdate -group lay1_comb /testbench/des/layer1/S4_in
add wave -noupdate -group lay1_comb /testbench/des/layer1/S5_in
add wave -noupdate -group lay1_comb /testbench/des/layer1/S6_in
add wave -noupdate -group lay1_comb /testbench/des/layer1/S7_in
add wave -noupdate -group lay1_comb /testbench/des/layer1/S8_in
add wave -noupdate -group lay1_comb /testbench/des/layer1/S1_out
add wave -noupdate -group lay1_comb /testbench/des/layer1/S2_out
add wave -noupdate -group lay1_comb /testbench/des/layer1/S3_out
add wave -noupdate -group lay1_comb /testbench/des/layer1/S4_out
add wave -noupdate -group lay1_comb /testbench/des/layer1/S5_out
add wave -noupdate -group lay1_comb /testbench/des/layer1/S6_out
add wave -noupdate -group lay1_comb /testbench/des/layer1/S7_out
add wave -noupdate -group lay1_comb /testbench/des/layer1/S8_out
add wave -noupdate -group lay1_comb /testbench/des/layer1/S_out
add wave -noupdate -group lay1_comb /testbench/des/layer1/P_out
add wave -noupdate -group keygen /testbench/des/key_gen/keyin
add wave -noupdate -group keygen /testbench/des/key_gen/keys_out
add wave -noupdate -group keygen /testbench/des/key_gen/pc1_out
add wave -noupdate -group keygen /testbench/des/key_gen/C
add wave -noupdate -group keygen /testbench/des/key_gen/D
add wave -noupdate -group keygen /testbench/des/key_gen/keys
add wave -noupdate -expand -group final_perm /testbench/des/final_perm/in
add wave -noupdate -expand -group final_perm /testbench/des/final_perm/out
add wave -noupdate -expand -group Output_ff /testbench/des/output_reg/clk
add wave -noupdate -expand -group Output_ff /testbench/des/output_reg/rst
add wave -noupdate -expand -group Output_ff /testbench/des/output_reg/in
add wave -noupdate -expand -group Output_ff /testbench/des/output_reg/out
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {55 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 402
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ns} {666 ns}
