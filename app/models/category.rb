class Category < ApplicationRecord
    belongs_to :item, optional:true
end
