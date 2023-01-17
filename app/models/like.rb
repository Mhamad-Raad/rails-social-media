class Like < ApplicationRecord
  belongs_to :post,  foreign_key: true, optional: true
end
