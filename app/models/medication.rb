class Medication < ActiveRecord::Base

  scope :active, -> { where('nui IS NOT NULL').order(:name) }

  def interaction_severity_to(medication)
  	Interaction.severity(self, medication)
  end

  def formatted_interaction(medication, severity)
    {
      medications: [{
        id: self.id,
        name: self.name
      },{
        id: medication.id,
        name: medication.name
      }],
      severity: severity
    }
  end

end
