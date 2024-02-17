

def gen_inversep_module(array, file): #64 bit to 56 bit
    beginningstr = "module " + "InverseP" + "(input [63:0] in, output [55:0] out);\n"
    
    i = 0
    
    # file.write(name)
    file.write(beginningstr)
    for num in array:
        file.write('\tassign out['+str(i)+'] = in[' + str(num-1) + '];\n') #num -1 bc we start at 0 in this implementation
        i+=1
    file.write('endmodule\n')


FP=[
    40, 8, 48, 16, 56, 24, 64, 32,
    39, 7, 47, 15, 55, 23, 63, 31,
    38, 6, 46, 14, 54, 22, 62, 30,
    37, 5, 45, 13, 53, 21, 61, 29,
    36, 4, 44, 12, 52, 20, 60, 28,
    35, 3, 43, 11, 51, 19, 59, 27,
    34, 2, 42, 10, 50, 18, 58, 26,
    33, 1, 41,  9, 49, 17, 57, 25
]

#main function
fout = open('InvP.v', 'w')


gen_inversep_module(FP, fout)

fout.close()