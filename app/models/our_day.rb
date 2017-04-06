class OurDay < ApplicationRecord
    validates :description, length: { in: 1..1000 }
    validates :day, presence: true
end
