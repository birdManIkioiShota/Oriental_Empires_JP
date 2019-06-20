# english file
AdviceFile = "./text_en/AdviceText.utf.txt"
FactionFile = "./text_en/FactionText.utf.txt"
GenghisFile = "./text_en/GenghisText.utf.txt"
HelpFile = "./text_en/HelpText.utf.txt"
MiscFile = "./text_en/MiscText.utf.txt"
NamesFile = "./text_en/Names.utf.txt"
ProductionFile = "./text_en/ProductionText.utf.txt"
TechnologyFile = "./text_en/TechnologyText.utf.txt"

# chinese file
AdviceFile_CH = "./text_sc/AdviceText.utf-sc.txt"
FactionFile_CH = "./text_sc/FactionText.utf-sc.txt"
GenghisFile_CH = "./text_sc/GenghisText.utf-sc.txt"
HelpFile_CH = "./text_sc/HelpText.utf-sc.txt"
MiscFile_CH = "./text_sc/MiscText.utf-sc.txt"
ProductionFile_CH = "./text_sc/ProductionText.utf-sc.txt"
TechnologyFile_CH = "./text_sc/TechnologyText.utf-sc.txt"

CSVFile = "./csvfile.csv"

def fileWriter(title, engfile, writefile)
  writefile.print(title, ",\n")
  count = 0
  dotflag = 1
  engfile.each_line do |line|
    line.gsub!(/"/, "\"\"")
    if line =~/Population who will be killed : {1:d}/
      writefile.puts("Population who will be killed : {1:d}")
      dotflag = 0
    elsif line =~ /(.*)}}$/ then
      writefile.print("\"" + $1 + "}\"")
      count = count + 1
      dotflag = 1
    elsif line =~ /^{(.*)}$/ then
      writefile.print("\"" + $1 + "\"")
      count = count + 1
      dotflag = 1
    elsif line =~ /^{(.*)/ then
      writefile.print("\"" + $1 + "\n")
      dotflag = 0
    elsif line =~ /(.*)}$/ then
      writefile.print($1 + "\"")
      dotflag = 1
      count = count + 1
    else
      writefile.print line
      dotflag = 0
    end

    if count % 2 == 0 then
      writefile.print(",\n")
    elsif dotflag == 1 then
      writefile.print(",")
    end
  end
end

advice = File.read(AdviceFile)
faction = File.read(FactionFile)
genghis = File.read(GenghisFile)
help = File.read(HelpFile)
misc = File.read(MiscFile)
production = File.read(ProductionFile)
technology = File.read(TechnologyFile)

csvfile = File.open(CSVFile, "w")

fileWriter(AdviceFile,advice, csvfile)
fileWriter(FactionFile,faction, csvfile)
fileWriter(GenghisFile, genghis, csvfile)
fileWriter(HelpFile, help, csvfile)
fileWriter(MiscFile, misc, csvfile)
fileWriter(ProductionFile, production, csvfile)
fileWriter(TechnologyFile, technology, csvfile)
