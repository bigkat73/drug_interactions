class Medication < ActiveRecord::Base

  attr_accessor :interaction_med
  attr_reader :severity

  after_create :populate_rxcui, :populate_nui

  scope :active, -> { where('nui IS NOT NULL').order(:name) }

  def interaction_severity_to(medication)
    interaction = RxNav::Medication::Interaction.new(self.nui, medication.nui)
    interaction.severity
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

private

  def populate_rxcui
    rxcui_lookup = RxNav::Medication::Lookup.new(name)
    self.rx_cui = rxcui_lookup.medication_rxcui
    save
  end

  def populate_nui
    nui_lookup = RxNav::Medication::Nui.new(name)
    self.nui = nui_lookup.medication_nui
    save
  end

end
