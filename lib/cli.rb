class CommandLineInterface
  @@name = ""
def greet
    puts "Welcome to the World of Wine!"
    puts "I'm CLI, may I have your name please to see if you're in our wine club?"
    @@name = gets.chomp
    if Customer.all.find_by_name(@@name)
        puts "Welcome Back #{name}"
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
        puts "What's your favorite type of wine?"
        wine = gets.chomp
        # Customer.new(name: #{name}, wine_preference: #{wine})
    end
end

def menu
    puts "Would you like to (A) see your last purchase or (B) know what we have in the store today?"
    reply = gets.chomp
    if reply == "A"
        puts "Let me check!"  #find last purchase on date of whatever bottle; maybe ask if like another bottle of the same?
    elsif reply == "B"
        puts Winery.all.map { |m| m.wine_type}
    end
end

def wine_seeking
    puts "What wine are you looking for today?"
    response = gets.chomp
 
    a = Winery.where("wine_type ==?", response).map { |n| n.name}
    puts "I have a couple bottles of #{a[0]}."
end

end