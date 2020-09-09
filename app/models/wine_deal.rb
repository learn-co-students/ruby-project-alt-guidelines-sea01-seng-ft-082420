class Wine_Deal < ActiveRecord::Base
    has_many :customers
    has_many :wineries
end