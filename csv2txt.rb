require "csv"
CSVfile = "./csvfile.csv"

hoge = CSV.read(CSVfile)
i = 0
writefile = File.open("hoge", "w")
while hoge[i] != nil
  if hoge[i][1] == nil
    writefile = File.open(hoge[i][0], "w")
  elsif hoge[i][3] != nil
    writefile.print("{" + hoge[i][0] + "}\n")
    writefile.print("{" + hoge[i][3] + "}\n")
  else
    writefile.print("{" + hoge[i][0] + "}\n")
    writefile.print("{" + hoge[i][1] + "}\n")
  end
  i = i + 1
end
