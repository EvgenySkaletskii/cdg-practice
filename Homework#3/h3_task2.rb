def setup_pokemons(number)
    pokemons = []
    number.times do 
        pokemon = get_next_pokemon
        pokemons.push(pokemon)
    end
    pokemons
end

def get_next_pokemon
    puts "Введите имя покемона >"
    name = gets.chomp

    puts "Введите цвет покемона >"
    color = gets.chomp

    {name: name, color: color}
end

def show_pokemons(pokemons)
    pretty_pokemons = pokemons.map do |pokemon|
        "{name: '#{pokemon[:name].capitalize()}', color: '#{pokemon[:color].capitalize()}'}"
    end
    puts "[#{pretty_pokemons.join(', ')}]"
end

def pokemons_game
    puts "Введите число покемонов >"
    pokemons_number = gets.chomp.to_i

    pokemons = setup_pokemons(pokemons_number)
    show_pokemons(pokemons)
end

pokemons_game
