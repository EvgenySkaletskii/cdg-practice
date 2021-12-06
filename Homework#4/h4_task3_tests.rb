require 'rspec'
require './h4_task3.rb'

RSpec.describe "Test terminal methods" do

    before do
        File.write(BALANCE_FILE, "200.0")
        read_balance
    end 
    
    it "Should read balance from the file" do
        expect(@balance).to eq(200.0)
    end

    it "Should set default balance if file doesn't exist" do
        File.delete(BALANCE_FILE) if File.exist?(BALANCE_FILE)
        read_balance
        expect(@balance).to eq(100.0)
    end

    it "Should show balance" do
        expect{ show_balance }.to output("Ваш баланс: 200.0\n").to_stdout
    end

    it "Should puts money on deposit" do
        expect{ deposit(100) }.to output("Ваш баланс: 300.0\n").to_stdout
        expect(@balance).to eq(300.0)
    end

    it "Should return error when deposit amount less than 0" do
        expect{ deposit(-100) }.to output("Сумма не может быть меньше или равна нулю.\n").to_stdout
    end

    it "Should return error when deposit amount equal to 0" do
        expect{ deposit(0) }.to output("Сумма не может быть меньше или равна нулю.\n").to_stdout
    end

    it "Should withdraw money from balance" do
        expect{ withdraw(100) }.to output("Ваш баланс: 100.0\n").to_stdout
    end

    it "Should withdraw all money from balance" do
        expect{ withdraw(200) }.to output("Ваш баланс: 0.0\n").to_stdout
    end

    it "Should return error when value more than balance" do
        expect{ withdraw(1000) }.to output("Недостаточно средств на счету. Ваш баланс 200.0\n").to_stdout
    end

    it "Should return error when withdraw value less than 0" do
        expect{ withdraw(-50) }.to output("Сумма не может быть меньше или равна нулю\n").to_stdout
    end

    it "Should return error when withdraw value equal to 0" do
        expect{ withdraw(0) }.to output("Сумма не может быть меньше или равна нулю\n").to_stdout
    end

    it "Should record balance into the file on quit" do
        deposit(300)
        record_balance
        expect(File.read(BALANCE_FILE)).to eq("500.0")
    end
end

RSpec.describe "Test terminal app" do

    before { File.write(BALANCE_FILE, "500.0") }
    
    it "Should run terminal commands" do
        result = <<~HEREDOC.chomp
            Добрый день
            Ваш баланс: 500.0
            1. Введите D чтобы внести деньги на счёт
            2. Введите W чтобы снять деньги со счёта
            3. Введите B чтобы проверить баланс
            4. Введите Q чтобы выйти
            Введите команду >Введите сумму: Ваш баланс: 600.0
            Введите команду >Введите сумму: Ваш баланс: 400.0
            Введите команду >Ваш баланс: 400.0
            Введите команду >
            HEREDOC
        allow_any_instance_of(Kernel).to receive(:gets).and_return('d', '100', 'W', '200', 'b', 'q')
        expect { terminal }.to output(result).to_stdout
    end

    it "Should show error message on invalid command" do
        result = <<~HEREDOC.chomp
            Добрый день
            Ваш баланс: 500.0
            1. Введите D чтобы внести деньги на счёт
            2. Введите W чтобы снять деньги со счёта
            3. Введите B чтобы проверить баланс
            4. Введите Q чтобы выйти
            Введите команду >Неправильная команда, используйте команды из приведённого списка
            Введите команду >
            HEREDOC
        allow_any_instance_of(Kernel).to receive(:gets).and_return('invalid command', 'q')
        expect { terminal }.to output(result).to_stdout
    end
end