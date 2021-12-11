class Category < ApplicationRecord
    has_many: articles, through: :has_categories
end
