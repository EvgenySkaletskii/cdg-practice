require 'rspec'
require './task2.rb'

RSpec.describe "Tests for taks2" do
    it "#age is less than 18" do
        allow_any_instance_of(Kernel).to receive(:gets).and_return('Иван', 'Иванов', '17')
        expect do
            greeting
        end.to output("Введите своё имя >Введите свою фамилию >Введите свой возраст >Привет, Иван Иванов. Тебе меньше 18 лет, но начать учиться программировать никогда не рано\n").to_stdout
    end

    it "#age is greater than 18" do
        allow_any_instance_of(Kernel).to receive(:gets).and_return('Иван', 'Иванов', '20')
        expect do
             greeting 
        end.to output("Введите своё имя >Введите свою фамилию >Введите свой возраст >Привет, Иван Иванов. Самое время заняться делом!\n").to_stdout
    end

    it "#incorrect age" do
        allow_any_instance_of(Kernel).to receive(:gets).and_return('Иван', 'Иванов', 'azaza')
        expect do
            greeting 
        end.to output("Введите своё имя >Введите свою фамилию >Введите свой возраст >С вашим возрастом что-то не то...\n").to_stdout
    end
end