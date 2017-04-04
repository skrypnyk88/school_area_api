class OurDay < ApplicationRecord
    validates :description, length: { maximum: 350 }
end
