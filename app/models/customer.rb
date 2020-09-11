class Customer < ActiveRecord::Base
    has_many :wine_deals
    has_many :wineries, through: :wine_deals
end