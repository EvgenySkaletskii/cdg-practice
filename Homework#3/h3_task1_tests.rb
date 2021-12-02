require 'rspec'
require './h3_task1.rb'

RSpec.describe "Test process method" do
    it "Should return 2 ** word's lenght if word ends with 'cs'" do
        expect(process('abbacs')).to eq(64)
    end

    it "Should return 2 ** word's lenght if word ends with 'cs' in uppercase" do
        expect(process('cCS')).to eq(8)
    end

    it "Should return reversed word if word doesn't end with 'cs'" do
        expect(process('kitten')).to eq('nettik')
    end

    it "Should return reversed word if word contains 'cs' not on the end" do
        expect(process('css')).to eq('ssc')
    end
end

RSpec.describe "Test run_app method" do
    it "Should run app with user's word that ends with 'cs'" do
        allow_any_instance_of(Kernel).to receive(:gets).and_return('someCs')
        expect { run_app }.to output("Введите слово >\n64\n").to_stdout
    end

    it "Should run app with user's word that doesn't ends with 'cs" do
        allow_any_instance_of(Kernel).to receive(:gets).and_return('abba')
        expect { run_app }.to output("Введите слово >\nabba\n").to_stdout
    end
end