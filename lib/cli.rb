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
    menu.choice 'What have all my wine purchases been?'
    menu.choice 'I\'d like to exchange a bottle, please'
    menu.choice 'What do you have today?'
    end
    if help == 'What was my last purchase?'
        puts "Let me check."  # make a better sentence with interpolation
        wine = Customer.find_by(name: @@name).wine_deals.last.winery.wine_type #maybe change to name
        purchase(wine)
    elsif help = 'What have all my wine purchases been?'
        show_all_wine
    elsif help = 'I\'d like to return a bottle, please'
        exchange
    elsif help == 'What do you have today?'
        wine_seeking
    else
        puts "Thanks for coming in!"
    end
end

def wine_seeking
    prompt = TTY::Prompt.new
    seek = prompt.select("What wine are you looking for today?") do |offer|
    offer.choice 'bubbly'
    offer.choice 'rose'
    offer.choice 'white'
    offer.choice 'red'
    end
    a = Winery.where("wine_type ==?", seek).map { |n| n.name}
    puts "I have a couple bottles of #{a[0]}."
    purchase(a[0]) ### right now is pulling the name of the bottle
end

def purchase(wine)
    prompt = TTY::Prompt.new
    sell = prompt.select("Would you like to buy this today?")  do |answer|
        answer.choice 'Yes, please!'
        answer.choice 'Maybe not today.'
        #answer.choice 'What else do you have?  What would you suggest' . sample
    end
    if sell == 'Yes, please!'
        puts "Thank you for your purchase" # make that sale, create wine_deal #find wine id to create wine_deal
        c = Customer.find_by(name: @@name).id
        b = Winery.find_by(wine_type: wine).id
        a = WineDeal.create(name: "11th", customer_id: c, winery_id: b)
        drink
    elsif sell == 'Maybe not today.'
        puts "Maybe next time.  Thanks for coming in!"
    end
end

def drink
    prompt = TTY::Prompt.new
    friday = prompt.select("It's Friday! What are your plans?") do |hmm|
        hmm.choice 'Have a nice dinner!'
        hmm.choice 'Throw a party!'
    end
    if friday == 'Have a nice dinner!'
        # destroy last row entered
        Customer.find_by(name: @@name).wine_deals.last.destroy
    elsif friday == 'Throw a party!'
        Customer.find_by(name: @@name).wine_deals.last.destroy_all
    end
end

def show_all_wine
    w = Customer.find_by(name: @@name)
   puts w.wineries.map { |winery| "name: #{winery.name} wine type: #{winery.wine_type}"}
end



end