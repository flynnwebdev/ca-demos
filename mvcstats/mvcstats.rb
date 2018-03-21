class StatsModel

  def initialize
    @numbers = []
  end

  def insert numbers
    @numbers = numbers
  end

  def list
    @numbers
  end

  def average
    if @numbers.length > 0
      sum = 0
      @numbers.each { |x| sum += x }
      return sum / @numbers.length
    end
    false
  end

end


class StatsView

  def greeting
    puts "Welcome to my awesome stats app!"
  end

  def menu
    menu_choices = [ :enter_numbers, :list_numbers, :average, :quit ]
    choice = 0
    while choice < 1 || choice > 4
      puts "------------------------------"
      puts "MAIN MENU"
      puts "------------------------------"
      puts "1. Insert numbers into the list"
      puts "2. List the numbers"
      puts "3. Show the average of the numbers"
      puts "4. Quit"
      puts "------------------------------"
      choice = gets.chomp.to_i
    end
    menu_choices[choice - 1]
  end

  def read_numbers
    values = []
    puts "Please enter numbers, one per line. Enter -1 to finish."
    num = gets.chomp.to_i
    while num != -1 do
      values.push num
      num = gets.chomp.to_i
    end
    values
  end

  def show_average avg
    if avg
      puts "The average of the numbers is: #{avg}"
    else
      puts "There were no numbers to average"
    end
  end

  def exit
    puts "See you next time!"
  end

  def list numbers
    if numbers.empty?
      puts "The list is empty"
    else
      puts "The numbers are: [ #{numbers.join ', '} ]"
    end
  end

end

class StatsController

  def initialize
    @StatsModel = StatsModel.new
    @StatsView = StatsView.new
  end

  def run
    @StatsView.greeting
    choice = @StatsView.menu

    while choice != :quit
      case choice
      when :list_numbers
        numbers = @StatsModel.list
        @StatsView.list numbers
      when :enter_numbers
        numbers = @StatsView.read_numbers
        @StatsModel.insert numbers
      when :average
        avg = @StatsModel.average
        @StatsView.show_average avg
      end
      choice = @StatsView.menu
    end
    @StatsView.exit
  end
end

# Main entry point
bc = StatsController.new
bc.run
