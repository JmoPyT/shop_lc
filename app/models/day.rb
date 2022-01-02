class Day < ApplicationRecord
    validates :label, presence: true, uniqueness: true
end
