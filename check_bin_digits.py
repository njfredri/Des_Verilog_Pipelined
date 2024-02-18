instring = input("enter binary number: \n")
if(len(instring) < 6):
    exit()
outstring = instring[0] + instring[5] + instring[1] + instring[2] + instring[3] + instring[4]
# x[5], x[4], x[0], x[1], x[2], x[3]
outstring2 = instring[5] + instring[4] + instring[0] + instring[1] + instring[2] + instring[3]
print(outstring)
print(outstring2)