class Medication < ActiveRecord::Base

  scope :active, -> { where('nui IS NOT NULL').order(:name) }

end
