require 'rspec'
require './task2.rb'

RSpec.describe "Tests for taks2" do
    it "#age is less than 18" do
        allow_any_instance_of(Kernel).to receive(:gets).and_return('Иван', 'Иванов', '17')

        expect(greeting).to eq("Привет, Иван Иванов. Тебе меньше 18 лет, но начать учиться программировать никогда не рано")
    end

    #it "#age is greater than 18" do
       # puts "ololo"
    #end
end