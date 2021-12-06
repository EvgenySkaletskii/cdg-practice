FILE_NAME = 'users.txt'
RESULT = 'result.txt'

def read_users
    File.read(FILE_NAME).split("\n")
end

def get_user(users, age)
    user = ""

    users.each do |current_user|
        if current_user.split[2] == age.to_s
            user = current_user
            users.delete(current_user)
            break
        end
    end
    return user

end

def write_user(user)
    File.write(RESULT, "#{user}\n", mode: "a")
end

def ask_age
    puts "Введите возраст (-1 чтобы выйти) >"
    gets.chomp.to_i
end

def show_users
    puts File.read(RESULT).split("\n")
end

def run_app
    File.delete(RESULT) if File.exist?(RESULT)
    users = read_users

    while users.length > 0
        age = ask_age
        break if age == -1

        user = get_user(users, age)
        write_user(user) if user != ""
    end

    show_users
end


