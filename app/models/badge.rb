class Badge < ApplicationRecord
  has_many :objectives

  scope :selected_for_start, -> { first(3) }

end
