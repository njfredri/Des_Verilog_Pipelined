

def gen_lr_layer(file, layer): #one layer
    prev_layer = layer-1
    string = '''//calculate l{1} and r{1}
    //Func_right(input[31:0] left, input [31:0] right, input[47:0] key, output[31:0] out);
    wire[31:0] l{1}, r{1}, l{1}_reg_out, r{1}_reg_out;
    Func_right layer{1}(l{2}_reg_out, r{2}_reg_out, key[{1}], r{1});
    assign l{1} = r{2}_reg_out;
    Flipflop_32 l{1}_reg (clock, reset, l{1}, l{1}_reg_out);
    Flipflop_32 r{1}_reg (clock, reset, r{1}, r{1}_reg_out);
    '''.format('nothing', str(layer), str(prev_layer))
    file.write(string)


#main function
fout = open('lr_layers.v', 'w')

for i in range(1,17):
    gen_lr_layer(fout, i)

fout.close()