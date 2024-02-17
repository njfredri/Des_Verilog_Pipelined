

def gen_pc1_module(array, file, name): #64 bit to 56 bit
    beginningstr = "module " + name + "(input [63:0] in, output [55:0] out);\n"
    
    i = 0
    
    # file.write(name)
    file.write(beginningstr)
    for num in array:
        file.write('\tassign out['+str(i)+'] = in[' + str(num-1) + '];\n') #num -1 bc we start at 0 in this implementation
        i+=1
    file.write('endmodule\n')

def gen_pc2_module(array, file): #64 bit to 56 bit
    beginningstr = "module " + 'PC2' + "(input [55:0] in, output [47:0] out);\n"
    
    i = 0
    
    # file.write(name)
    file.write(beginningstr)
    for num in array:
        file.write('\tassign out['+str(i)+'] = in[' + str(num-1) + '];\n')
        i+=1
    file.write('endmodule\n')

PC1= [
    57, 49, 41, 33, 25, 17,  9,
    1, 58, 50, 42, 34, 26, 18,
    10,  2, 59, 51, 43, 35, 27,
    19, 11,  3, 60, 52, 44, 36,
    63, 55, 47, 39, 31, 23, 15,
    7, 62, 54, 46, 38, 30, 22,
    14,  6, 61, 53, 45, 37, 29,
    21, 13,  5, 28, 20, 12,  4
]

PC2 = [
    14, 17, 11, 24,  1,  5,
    3, 28, 15,  6, 21, 10,
    23, 19, 12,  4, 26,  8,
    16,  7, 27, 20, 13,  2,
    41, 52, 31, 37, 47, 55,
    30, 40, 51, 45, 33, 48,
    44, 49, 39, 56, 34, 53,
    46, 42, 50, 36, 29, 32
]

#main function
fout = open('PC.v', 'w')


gen_pc1_module(PC1, fout, 'PC1')
gen_pc2_module(PC2, fout)

fout.close()