class CommandLineInterface
  @@name = ""
def greet
    puts "Welcome to the World of Wine!"
    puts "I'm CLI, may I have your name please to see if you're in our wine club?"
    @@name = gets.chomp
    if Customer.all.find_by_name(@@name)
        puts "Welcome Back #{@@name}"
        menu
    else 
        puts "You don't seem to be in the club #{@@name}."
        add_to_club
    end
end

def add_to_club
    prompt = TTY::Prompt.new
    ask = prompt.select("Would you like to join?") do |menu|
        menu.choice 'YES'
        menu.choice 'NO'
    end
    if ask == 'YES'
        fave = prompt.select("What's your favorite type of wine?") do |type|
            type.choice 'bubbly'
            type.choice 'rose'
            type.choice 'white'
            type.choice 'red'
        end
        Customer.create(name: "#{@@name}", wine_preference: "#{fave}")
    end
end

def menu
    prompt = TTY::Prompt.new
    help = prompt.select("What can I help you with today?") do |menu|
    menu.choice 'What was my last purchase?'
    menu.choice 'What do you have today?'
    end
    if help == 'What was my last purchase?'
        puts "Let me check."  #take to a last_purchase method that asks if would like to purchase again; if no, redirect to wine_seeking
        wine_seeking #will change later
    elsif help == 'What do you have today?'
        wine_seeking
    else
        puts "Thanks for coming in!"
    end
end

def wine_seeking
    puts "What wine are you looking for today?"
    puts Winery.all.map { |m| m.wine_type}
    response = gets.chomp
 
    a = Winery.where("wine_type ==?", response).map { |n| n.name}
    puts "I have a couple bottles of #{a[0]}."
end

end