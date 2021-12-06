#1. Read the 'balance' file --> get the balance (100 if doesn't exist)
#2. Puts instructions
#3. Get user input
#4. Perform action
#   4.1 B -> show balance
#   4.2 D -> get deposit sum -> check > 0 (Show error) -> add to balance -> show balance
#   4.3 W -> get amount sum -> validate (>0 and < deposit) -> update balance -> show balance
#   4.4 Q -> update balance file with the current balance

BALANCE_FILE = 'balance.txt'
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
    @balance += value
    show_balance
end

def credit(value)
    @balance -= value
    show_balance
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
            puts "Введите сумму:"
            sum = gets.chomp.to_i
            deposit(sum)
        when "w"
            puts "Введите сумму:"
            sum = gets.chomp.to_i
            credit(sum)
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

terminal

