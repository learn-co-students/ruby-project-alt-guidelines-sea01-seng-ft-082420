class Winery < ActiveRecord::Base
    has_many :wine_deals
    has_many :customers, through: :wine_deals
end