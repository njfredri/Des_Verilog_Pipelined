

def gen_keygen_module(file): #64 bit to 56 bit
    modulestart = ''' module Key_Generator 
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
    '''
    file.write(modulestart)
    left_shifts = [1, 1, 2, 2, 2, 2, 2, 2, 1, 2, 2, 2, 2, 2, 2, 1 ]
    i = 1
    for shift in left_shifts: #0: layer/i 1: number of left shifts 2: prev_layer (or i-1)
        layer = str(i)
        prev_layer = str(i-1)
        shift_count = str(shift)
        layer_str = '\t//layer {layer} - left shift by {shift_count} then PC2 to key1\n'.format(shift_count=shift_count, layer=layer, prev_layer=prev_layer)
        file.write(layer_str)
        layer_str = '\tKey_Shift{shift_count} ks{layer}c(C[{prev_layer}], C[{layer}]);\n'.format(shift_count=shift_count, layer=layer, prev_layer=prev_layer)
        file.write(layer_str)
        layer_str = '\tKey_Shift{shift_count} ks{layer}d(D[{prev_layer}], D[{layer}]);\n'.format(shift_count=shift_count, layer=layer, prev_layer=prev_layer)
        file.write(layer_str)
        layer_str = '\tPC2 pc2_{layer} ({{C[{layer}], D[{layer}]}}, keys[{layer}]);\n'.format(shift_count=shift_count, layer=layer, prev_layer=prev_layer)
        file.write(layer_str)
        i+=1
    file.write('\tassign keys_out = ')
    file.write('{')
    for x in range(16, 1, -1):
        file.write('keys[{num}], '.format(num=x))
    file.write('keys[1]'.format(num=x))
    file.write('};\n')
    file.write('endmodule\n')

#main function
fout = open('KeyGen.v', 'w')

# fout.write('module Key_Generator(input [63:0] keyin, output [47:0] keys [16:1]);')

gen_keygen_module(fout)

fout.close()