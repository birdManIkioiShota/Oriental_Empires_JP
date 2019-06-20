AdviceFile = "./text_en/AdviceText.utf.txt"
CSVFile = "./csvfile.txt"

advice = File.read(AdviceFile)
csvfile = File.open(CSVFile, "w")
advice.each_line do |line|
  csvfile.puts line
end
