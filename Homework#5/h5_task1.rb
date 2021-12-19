require "pry"

class CashMachine
  attr_accessor :balance_file, :default_balance, :balance

  def initialize
    @balance_file = "balance.txt"
    @default_balance = 100.0
  end

  def read_balance
    if File.exist?(@balance_file)
      @balance = File.read(@balance_file).to_f
    else
      @balance = @default_balance
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
    File.write(@balance_file, @balance)
  end

  def self.init
    machine = CashMachine.new
    machine.read_balance

    puts "Добрый день"
    machine.show_balance
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
        machine.deposit(sum)
      when "w"
        print "Введите сумму: "
        sum = gets.chomp.to_i
        machine.withdraw(sum)
      when "b"
        machine.show_balance
      when "q"
        machine.record_balance
        break
      else
        puts "Неправильная команда, используйте команды из приведённого списка"
      end
    end
  end
end
