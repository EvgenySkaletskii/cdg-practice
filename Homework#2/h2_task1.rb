def greeting
    print "Введите своё имя >"
    name = gets.chomp

    print "Введите свою фамилию >"
    surname = gets.chomp

    print "Введите свой возраст >"
    age = gets.chomp.to_i

    if age <= 18
        puts "Привет, #{name} #{surname}. Тебе меньше 18 лет, но начать учиться программировать никогда не рано"
    else
        puts "Привет, #{name} #{surname}. Самое время заняться делом!"
    end
end

def foobar(left, right)
    contain_20 = [left, right].any? { |number| number == 20 }

    contain_20 ? right : left + right
end