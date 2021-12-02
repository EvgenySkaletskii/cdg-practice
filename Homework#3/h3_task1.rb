def run_app
    puts "Введите слово >"
    word = gets.chomp
    
    puts process(word)
end

def process(word)
    if word.downcase.end_with?('cs')
         2 ** word.length
    else
         word.reverse
    end
end
