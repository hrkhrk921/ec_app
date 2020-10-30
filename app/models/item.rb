class Item < ApplicationRecord
  belongs_to :genres,optional: true
end
