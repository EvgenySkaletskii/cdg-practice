require 'rspec'
require './h2_task1.rb'

RSpec.describe "Test greeting method" do
    it "age is less than 18" do
        allow_any_instance_of(Kernel).to receive(:gets).and_return('Иван', 'Иванов', '17')
        expect do
            greeting
        end.to output("Введите своё имя >Введите свою фамилию >Введите свой возраст >Привет, Иван Иванов. Тебе меньше 18 лет, но начать учиться программировать никогда не рано\n").to_stdout
    end

    it "age is greater than 18" do
        allow_any_instance_of(Kernel).to receive(:gets).and_return('Иван', 'Иванов', '20')
        expect do
             greeting 
        end.to output("Введите своё имя >Введите свою фамилию >Введите свой возраст >Привет, Иван Иванов. Самое время заняться делом!\n").to_stdout
    end
end

RSpec.describe "Test foobar method" do
    it "should return sum when both are not equal 20" do
         expect(foobar(10, 5)).to eq(15)
    end

    it "should return right number when any equal 20" do
        expect(foobar(20, 150)).to eq(150)
   end
end