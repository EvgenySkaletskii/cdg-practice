require 'rspec'
require './h3_task1.rb'

RSpec.describe "Test user word" do
    it "contains 'cs' in lowercase" do
        allow_any_instance_of(Kernel).to receive(:gets).and_return('abbacs')
        expect { process_user_input }.to output("Введите слово >\n64\n").to_stdout
    end

    it "contains 'cs' in uppercase" do
        allow_any_instance_of(Kernel).to receive(:gets).and_return('someCS')
        expect { process_user_input }.to output("Введите слово >\n64\n").to_stdout
    end

    it "doesn't contain 'cs'" do
        allow_any_instance_of(Kernel).to receive(:gets).and_return('some')
        expect { process_user_input }.to output("Введите слово >\nemos\n").to_stdout
    end

    it "word less than 2 characters" do
        allow_any_instance_of(Kernel).to receive(:gets).and_return('c')
        expect { process_user_input }.to output("Введите слово >\nc\n").to_stdout
    end
end