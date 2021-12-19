module Resource
  def connection(routes)
    if routes.nil?
      puts "No route matches for #{self}"
      return
    end

    loop do
      print "Choose verb to interact with resources (GET/POST/PUT/DELETE) / q to exit: "
      verb = gets.chomp.upcase
      break if verb == "Q"

      if !["GET", "POST", "PUT", "DELETE"].include?(verb)
        puts "Incorrect nethod for #{self}. Available methods: 'GET', 'POST', 'PUT', 'DELETE'"
        next
      end

      action = nil

      if verb == "GET"
        print "Choose action (index/show) / q to exit: "
        action = gets.chomp.downcase
        break if action == "q"

        if !["index", "show"].include?(action)
          puts "Incorrect action for GET method. Available actions: 'index', 'show'"
          next
        end
      end

      action.nil? ? routes[verb].call : routes[verb][action].call
    end
  end
end

class PostsController
  extend Resource

  def initialize
    @posts = []
  end

  def index
    @posts.each { |p| puts p }
  end

  def show
    puts "Choose the post id"
    id = gets.chomp.to_i
    if @posts[id - 1] && id != 0
      puts @posts[id - 1]
    else
      puts "Incorrect post id"
    end
  end

  def create
    puts "Enter the post content"
    post = gets.chomp
    @posts << post
    {
      id: @posts.length,
      content: post,
    }
  end

  def update
    puts "Enter the post id"
    id = gets.chomp.to_i
    if !@posts[id - 1]
      puts "Incorrect post id"
      return
    end
    puts "Enter new content"
    content = gets.chomp
    @posts[id - 1] = content
    puts @posts[id - 1]
  end

  def destroy
    puts "Enter the post id"
    id = gets.chomp.to_i
    if @posts[id - 1]
      @posts.delete_at(id - 1)
    else
      puts "Incorrect post id"
    end
  end
end

class Router
  def initialize
    @routes = {}
  end

  def init
    resources(PostsController, "posts")

    loop do
      print "Choose resource you want to interact (1 - Posts, 2 - Comments, q - Exit): "
      choise = gets.chomp

      PostsController.connection(@routes["posts"]) if choise == "1"
      break if choise == "q"
    end

    puts "Good bye!"
  end

  def resources(klass, keyword)
    controller = klass.new
    @routes[keyword] = {
      "GET" => {
        "index" => controller.method(:index),
        "show" => controller.method(:show),
      },
      "POST" => controller.method(:create),
      "PUT" => controller.method(:update),
      "DELETE" => controller.method(:destroy),
    }
  end
end

router = Router.new

router.init
