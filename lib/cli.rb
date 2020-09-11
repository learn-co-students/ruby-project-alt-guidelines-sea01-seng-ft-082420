class CommandLineInterface
  @@name = ""
def greet
    puts "Welcome to the World of Wine!"
    puts "I'm CLI, may I have your name please to see if you're in our wine club?"
    @@name = gets.chomp
    if Customer.find_by_name(@@name)
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
        puts "That's all I need.  You are now a member of the club!"
    end
    menu
end

def menu
    prompt = TTY::Prompt.new
    help = prompt.select("What can I help you with today?") do |menu|
    menu.choice 'What was the last bottle added to my cellar?'
    menu.choice 'What\'s in my cellar?'
    menu.choice 'I\'d like to exchange a bottle, please'
    menu.choice 'Maybe some wine.'
    end
    if help == 'What was the last bottle added to my cellar?'
        puts "Let me check."  
        cellar_check
        # wine = Customer.find_by(name: @@name).wine_deals.last.winery.wine_type #maybe change to name
        # # make a better sentence with interpolation
        # purchase(wine)  #if nil puts message "Sorry, there's no record" move to wine_seeking
    elsif help == 'What\'s in my cellar?'
        show_all_wine
    elsif help == 'I\'d like to exchange a bottle, please'
        exchange
    elsif help == 'Maybe some wine.'
        wine_seeking
    else
        puts "Thanks for coming in!"
    end
end

def wine_seeking
    prompt = TTY::Prompt.new
    seek = prompt.select("What wine are you looking for?") do |offer|
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
        puts "Thank you for your purchase." 
        c = Customer.find_by(name: @@name).id
        b = Winery.find_by(name: wine).id
        a = WineDeal.create(name: "#{b}.#{c}", customer_id: c, winery_id: b) 
        drink 
    elsif 
        sell == 'Maybe not today.'
        puts "Another time then."
        menu  ### or maybe wine_seeking
    end
end

def drink  ## or stash???
    prompt = TTY::Prompt.new
    friday = prompt.select("It's Friday! What are your plans?") do |hmm|
        hmm.choice 'Have a nice dinner!'
        hmm.choice 'Throw a party!'
    end
    if friday == 'Have a nice dinner!'
        Customer.find_by(name: @@name).wine_deals.last.destroy
        puts "You drank a couple glasses of wine with an amazing dinner.  Life is good!"
    elsif friday == 'Throw a party!'
        Customer.find_by(name: @@name).wine_deals.destroy_all
        ### put message with count like "wow, you guys drank #{this_many} bottles"
    end
end

def show_all_wine
    w = Customer.find_by(name: @@name)
    count = w.wine_deals.count 
    if count == 0
        puts "Uh-oh, looks like the the cellar is empty."
    elsif count == 1
        puts " You have 1 bottle of wine."
        puts w.wineries.map { |winery| "A #{winery.wine_type} from #{winery.name}"}
    else
        puts "You have #{count} bottles of wine."
        puts w.wineries.map { |winery| "A #{winery.wine_type} from #{winery.name}"}.uniq
    end
    menu
end

def exchange
    puts "Absolutly, here are all of your past purchases."
    show_all_wine
    prompt = TTY::Prompt.new
    this = prompt.select("What wine do you want to change?") do |that|
        that.choice 'Bubbly Wubbly'
        that.choice 'Rose All Day'
        that.choice 'Bright White'
        that.choice 'Red Meat Red'
    end
    w = Winery.find_by(name: this)
    prompt = TTY::Prompt.new
    new_wine = prompt.select("What would you like instead?") do |that|
        that.choice 'bubbly'
        that.choice 'rose'
        that.choice 'white'
        that.choice 'red'
    end
    w.update(wine_type: new_wine)
    #show_all_wine.update_all wine_type: this
    ## maybe change so it's not changing the Wineries actual wine type and just change wine id in Wine Deal to equal Wine id of new_wine
    # return to menu???
end
    
    def cellar_check
        first = Customer.find_by(name:@@name).wine_deals
        if first == nil || first.empty?
            puts "Sorry, there's nothing in your cellar right now."
            menu  ### or ? wine_seeking
        else
            wine = Customer.find_by(name: @@name).wine_deals.last.winery.name
            puts "Looks like you bought a bottle of #{wine} last time."
            purchase(wine)  
        end
    end
    
end
    



