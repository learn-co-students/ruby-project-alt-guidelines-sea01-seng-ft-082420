class WineDeal < ActiveRecord::Base
    belongs_to :customer
    belongs_to :winery
end