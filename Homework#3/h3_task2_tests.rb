require 'rspec'
require './h3_task2.rb'

RSpec.describe "Test get_next_pokemon method" do
    it "Should return a hash with pokemon name and color" do
        allow_any_instance_of(Kernel).to receive(:gets).and_return('Pikachu', 'Yellow')
        expect(get_next_pokemon).to eq({:color=>"Yellow", :name=>"Pikachu"})
    end
end

RSpec.describe "Test setup_pokemons method" do
    it "Should return an array of hashes when number is provided" do
        allow_any_instance_of(Kernel).to receive(:gets).and_return('Pikachu', 'Yellow', 'Bulbazav', 'Green')
        expect(setup_pokemons(2)).to eq([{:color=>"Yellow", :name=>"Pikachu"}, {:color=>"Green", :name=>"Bulbazav"}])
    end

    it "Should return an empty array when 0 is provided" do
        expect(setup_pokemons(0)).to eq([])
    end
end

RSpec.describe "Test show_pokemons method" do
    it "Should return a string with pokemons is format [{name: 'A', color: 'B'}... N.times]" do
        pokemons = [{:color=>"Yellow", :name=>"Pikachu"}, {:color=>"Green", :name=>"Bulbazav"}]
        expect do
            show_pokemons(pokemons)
        end.to output("[{name: 'Pikachu', color: 'Yellow'}, {name: 'Bulbazav', color: 'Green'}]\n").to_stdout
    end

    it "Should return a string with pokemons with capitalized values" do
        pokemons = [{:color=>"yeLLow", :name=>"pikachU"}, {:color=>"GReen", :name=>"bulbazav"}]
        expect do
            show_pokemons(pokemons)
        end.to output("[{name: 'Pikachu', color: 'Yellow'}, {name: 'Bulbazav', color: 'Green'}]\n").to_stdout
    end
end

RSpec.describe "Test pokemons_game method" do
    it "Should display an array of hashed pokemons from the users input" do
        allow_any_instance_of(Kernel).to receive(:gets).and_return('1', 'Charmander', 'Orange')
        expect do
            pokemons_game
        end.to output("Введите число покемонов >\nВведите имя покемона >\nВведите цвет покемона >\n[{name: 'Charmander', color: 'Orange'}]\n").to_stdout
    end
end