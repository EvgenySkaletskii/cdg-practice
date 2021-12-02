def process_user_input
    puts "Введите слово >"
    word = gets.chomp

    if word.downcase.end_with?('cs')
        puts 2 ** word.length
    else
        puts word.reverse
    end
end
