require 'rspec'
require './h4_task1.rb'

RSpec.describe "Test file methods" do
    string = File.read('base.txt')

    before { File.write('file.txt', string) }

    it "Should display the file content" do
        expect { index }.to output(string).to_stdout
    end

    it "Should find a line by id" do
        expect { find(2) }.to output("Fluffy kitten\n").to_stdout
    end

    it "Should puts lines that contain pattern" do
        expect { where('line') }.to output("First line\nSecond line\nThe last line\n").to_stdout
    end

    it "Should update the line" do
        update(2, "Fat kitten")
        expect(File.read('file.txt')).to eq "First line\nSecond line\nFat kitten\nThe last line\n"
    end

    it "Should delete the line" do
        delete(2)
        expect(File.read('file.txt')).to eq "First line\nSecond line\nThe last line\n"
    end
end