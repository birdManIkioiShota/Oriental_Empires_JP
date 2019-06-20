AdviceFile = "./text_en/AdviceText.utf.txt"
FactionFile = "./text_en/FactionText.utf.txt"
GenghisFile = "./text_en/GenghisText.utf.txt"
HelpFile = "./text_en/HelpText.utf.txt"
MiscFile = "./text_en/MiscText.utf.txt"
NamesFile = "./text_en/Names.utf.txt"
ProductionFile = "./text_en/ProductionText.utf.txt"
TechnologyFile = "./text_en/TechnologyText.utf.txt"



CSVFile = "./csvfile.csv"

advice = File.read(AdviceFile)
csvfile = File.open(CSVFile, "w")
count = 0
dotflag = 1
advice.each_line do |line|
  if line =~ /{(.*)}/
    csvfile.print("\"" + $1 + "\"")
    count = count + 1
    dotflag = 1
  elsif line =~ /{(.*)/ then
    csvfile.print("\"" + $1 + "\n")
    dotflag = 0
  elsif line =~ /(.*)}/ then
    csvfile.print($1 + "\"")
    dotflag = 1
    count = count + 1
  else
    csvfile.print line
    dotflag = 0
  end

  if count%2 == 0 then
    csvfile.print(",\n")
  elsif dotflag == 1 then
    csvfile.print(",")
  end
end
