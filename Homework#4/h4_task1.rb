FILE_NAME = 'file.txt'
BUFFER = 'buffer.txt'

def index
    puts File.read(FILE_NAME)
end

def find(id)
    File.foreach(FILE_NAME).with_index do |line, index|
        puts line if index == id
    end
end

def where(pattern)
    File.foreach(FILE_NAME) do |line|
        puts line if line.include?(pattern)
    end
end

def update(id, text)
    file = File.open(BUFFER, 'w')
    File.foreach(FILE_NAME).with_index do |line, index|
        file.puts(index == id ? text : line)
    end

    file.close
    File.write(FILE_NAME, File.read(BUFFER))

    File.delete(BUFFER) if File.exist?(BUFFER)
end

def delete(id)
    file = File.open(BUFFER, 'w')
    File.foreach(FILE_NAME).with_index do |line, index|
        file.puts line if index != id
    end

    file.close
    File.write(FILE_NAME, File.read(BUFFER))

    File.delete(BUFFER) if File.exist?(BUFFER)
end


