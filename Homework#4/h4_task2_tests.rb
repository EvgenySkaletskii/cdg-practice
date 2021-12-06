require 'rspec'
require './h4_task2.rb'

RSpec.describe "Test file methods" do
    string = File.read('users.txt')

    before { File.delete("result.txt") if File.exist?("result.txt") }

    it "Should get users array from the file" do
        expect(read_users).to eq(string.split("\n"))
    end

    it "Should return user with appropriate age if it exists in the file" do
        users = read_users
        expect(get_user(users, "21")).to eq("Иванов Иван 21")
    end

    it "Should return blank string if user with this age doesn't exist" do
        users = read_users
        expect(get_user(users, "150")).to eq("")
    end

    it "Should return write a user into result file" do
        write_user("Тестовый Пользователь 15")
        expect(File.read("result.txt")).to eq("Тестовый Пользователь 15\n")
    end

    it "Should return age from user's input" do
        allow_any_instance_of(Kernel).to receive(:gets).and_return('20')
        expect(ask_age).to eq(20)
    end

    it "Should show result file" do
        write_user("Тестовый Пользователь 20")
        write_user("Второй Пользователь 21")
        expect { show_users }.to output("Тестовый Пользователь 20\nВторой Пользователь 21\n").to_stdout
    end
end

RSpec.describe "Test run_app method" do
    string = File.read('users.txt')

    it "Should return results file when all users are done" do
        allow_any_instance_of(Kernel).to receive(:gets).and_return('21', '29', '36', '18', '50', '44', '20', '30', '60', '95' )
        expect { run_app }.to output("Введите возраст (-1 чтобы выйти) >\n" * 10 + string + "\n").to_stdout
    end

    it "Should show results file when user enters -1" do
        allow_any_instance_of(Kernel).to receive(:gets).and_return('21', '29', '-1' )
        expect { run_app }.to output("Введите возраст (-1 чтобы выйти) >\n" * 3 + "Иванов Иван 21\nАнтон Петров 29\n").to_stdout
    end

end