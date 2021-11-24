def greeting
    print "Введите своё имя >"
    name = gets.chomp

    print "Введите свою фамилию >"
    surname = gets.chomp

    print "Введите свой возраст >"
    age = gets.chomp.to_i

    if age > 0 && age <= 18
        puts "Привет, #{name} #{surname}. Тебе меньше 18 лет, но начать учиться программировать никогда не рано"
    elsif age > 18 && age < 120
        puts "Привет, #{name} #{surname}. Самое время заняться делом!"
    else
        puts "С вашим возрастом что-то не то..."
    end
end