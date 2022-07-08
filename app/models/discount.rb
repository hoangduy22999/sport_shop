class Discount < ApplicationRecord
    before_create :generate_code

    scope :is_active, -> { where(active: true) }

    def generate_code
        self.code = SecureRandom.hex(4)
    end
end
