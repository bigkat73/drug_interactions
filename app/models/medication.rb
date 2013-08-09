class Medication < ActiveRecord::Base

  attr_accessor :interaction_med
  attr_reader :severity

  after_create :populate_nui

  scope :active, -> { where('nui IS NOT NULL').order(:name) }

  def interaction_severity_to(medication)
    @interaction_med = medication
  	severity
  end

  def severity
    @severity ||= Interaction.severity(self, interaction_med)
  end

  def formatted_interaction
    {
      medications: [{
        id: self.id,
        name: self.name
      },{
        id: interaction_med.id,
        name: interaction_med.name
      }],
      severity: severity
    }
  end

  def populate_nui
  end

  def find_nui
  end

end
