def gen_pc2_module(array, file): #64 bit to 56 bit
    beginningstr = "module " + 'PBox' + "(input [0:31] in, output [0:31] out);\n"
    
    i = 0
    
    # file.write(name)
    file.write(beginningstr)
    for num in array:
        file.write('\tassign out['+str(i)+'] = in[' + str(num-1) + '];\n')
        i+=1
    file.write('endmodule\n')

P=[
    16,  7, 20, 21,
    29, 12, 28, 17,
    1, 15, 23, 26,
    5, 18, 31, 10,
    2,  8, 24, 14,
    32, 27,  3,  9,
    19, 13, 30,  6,
    22, 11,  4, 25
]

#main function
fout = open('PBox.v', 'w')


gen_pc2_module(P, fout)

fout.close()