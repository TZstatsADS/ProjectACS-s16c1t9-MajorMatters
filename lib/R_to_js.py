
lines = [line.rstrip('\n\r') for line in open('bip_data_occ_deg.csv',"rb")]

g = open("bi_dat.csv","wb")

g.write("[\n")

for line in lines[1:-1]:
    g.write("[" + line + "],\n")
g.write("[" + lines[-1] + "]\n]")
g.close()
