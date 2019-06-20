# coding utf-8
Advice = "./text_en/AdviceText.utf.txt"
Trans = "./translate.txt"

def main
    fuga = File.open(Trans, "w")
    hoge = File.read(Advice)
    hoge.each_line do |line|
        fuga.puts line
    end
end

main