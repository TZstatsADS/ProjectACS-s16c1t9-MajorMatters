
lines = [line.rstrip('\n\r') for line in open('huge_data_occ_deg.csv',"rb")]

g = open("HUGE_dat.csv","wb")

g.write("[\n")

for line in lines[1:-1]:
    g.write("[" + line + "],\n")
g.write("[" + lines[-1] + "]\n]")
g.close()

big_lis = []
for i in majors:
	sma_lis = []
	for j in occps + majors:
		if pd[(pd["Major"] == i) & (pd["Occp"] == j)].empty:
			sma_lis.append(0)
		else:
			sma_lis.append(int(pd[(pd["Major"] == i) & (pd["Occp"] == j)].Freq))
	big_lis.append(sma_lis)
for i in occps:
	sma_lis = []
	for j in occps + majors:
		if pd[(pd["Major"] == j) & (pd["Occp"] == i)].empty:
			sma_lis.append(0)
		else:
			sma_lis.append(int(pd[(pd["Major"] == j) & (pd["Occp"] == i)].Freq))
	big_lis.append(sma_lis)

with open("new_map.json","wb") as f:
    f.write("{")
    for i in majors + occps:
            f.write('"' + i + '"')
            f.write(": ")
            f.write(str(big_dic[i]))
            f.write(", ")
    f.write("}")

giant = "{"
for i in majors + occps:
    giant += ('"' + i + '"')
    giant += ": "
    giant += str(big_dic[i])
    giant += ", "
giant += "}"


big_lis = []
for i in sort_lis:
	sma_lis = []
	for j in sort_lis:
		if i["data"] == "major":
			first = "Major"
		else:
			first = "Occp"
		if j["data"] == "major":
			second = "Major"
		else:
			second = "Occp"
		if first == second:
			sma_lis.append(0)
		else:
			if pd[(pd[first] == i["name"]) & (pd[second] == j["name"])].empty:
				sma_lis.append(0)
			else:
				sma_lis.append(int(pd[(pd[first] == i["name"]) & (pd[second] == j["name"])].Freq))
	big_lis.append(sma_lis)


