def gen_reset_reg(list_of_reg, file):
    for reg in list_of_reg:
        file.write('{reg} <= 0\n'.format(reg=reg))

reg_list = [
    ov,
    
]