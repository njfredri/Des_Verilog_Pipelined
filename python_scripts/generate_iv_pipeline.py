def generate_iv_pipeline(num_stages, name, file):
    beginningstr = '''
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

module {0} (input clk, input rst, input iv, output ov);
    wire '''.format(name)
    file.write(beginningstr)
    #next step is to create a bunch of wires
    wirenames =  ''
    for num in range(num_stages-1):
        wirenames += 'w{0}, '.format(num)
    #final wire
    wirenames += 'w{0};\n'.format(num_stages-1)
    file.write(wirenames)
    file.write('\tassign w0 = iv;\n')
    #loop through and make a bunch of flip flops
    ffstr = ''
    for num in range(num_stages-1):
        ffstr += '\tFlipflop_1 ff_{0}(clk, rst, w{0}, w{1});\n'.format(str(num), str(num+1))
    #connect last flipflop to output
    ffstr += '\tFlipflop_1 ff_{0}(clk, rst, w{0}, ov);\n'.format(str(num_stages-1))
    file.write(ffstr)
    file.write('endmodule')

fout = open('IV_Pipeline.v', 'w')
num_stages = int(input("number of stages for pipeline:\n"))
generate_iv_pipeline(num_stages, 'Validation_Pipeline', fout)
