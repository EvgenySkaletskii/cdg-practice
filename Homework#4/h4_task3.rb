BALANCE_FILE = "balance.txt"
DEFAULT_BALANCE = 100.0

def read_balance
  if File.exist?(BALANCE_FILE)
    @balance = File.read(BALANCE_FILE).to_f
  else
    @balance = DEFAULT_BALANCE
  end
end

def show_balance
  puts "Ваш баланс: #{@balance}"
end

def deposit(value)
  if value > 0
    @balance += value
    show_balance
  else
    puts "Сумма не может быть меньше или равна нулю."
  end
end

def withdraw(value)
  if value > 0 && value <= @balance
    @balance -= value
    show_balance
  elsif value <= 0
    puts "Сумма не может быть меньше или равна нулю"
  else
    puts "Недостаточно средств на счету. Ваш баланс #{@balance}"
  end
end

def record_balance
  File.write(BALANCE_FILE, @balance)
end

def terminal
  read_balance

  puts "Добрый день"
  show_balance
  puts "1. Введите D чтобы внести деньги на счёт"
  puts "2. Введите W чтобы снять деньги со счёта"
  puts "3. Введите B чтобы проверить баланс"
  puts "4. Введите Q чтобы выйти"

  while true
    print "Введите команду >"
    command = gets.chomp.downcase

    case command
    when "d"
      print "Введите сумму: "
      sum = gets.chomp.to_i
      deposit(sum)
    when "w"
      print "Введите сумму: "
      sum = gets.chomp.to_i
      withdraw(sum)
    when "b"
      show_balance
    when "q"
      record_balance
      break
    else
      puts "Неправильная команда, используйте команды из приведённого списка"
    end
  end
end
