class Interaction
  include ActiveModel::Model

  attr_accessor :medication_ids

  def initialize(medication_ids=[])
    @medication_ids = medication_ids
  end

  def interactions
    interactions = []
    @medication_ids.each_with_index do |m_id, i|
      (i+1).upto(@medication_ids.size-1) do |j|
        interactions << interaction(m_id, @medication_ids[j])
      end
    end
    interactions
  end

  def interaction(medication_1_id, medication_2_id)
    medication_1 = Medication.where(id: medication_1_id).first
    medication_2 = Medication.where(id: medication_2_id).first
    if medication_1 && medication_2
      {
        medications: [{
          id: medication_1_id,
          name: medication_1.name
        },{
          id: medication_2_id,
          name: medication_2.name
        }],
        severity: find_interaction_severity(medication_1,medication_2)
      }
    else
      {
        medications: [{
          id: medication_1_id,
          name: medication_1.present? ? medication_1.name : 'unknown'
        },{
          id: medication_2_id,
          name: medication_2.present? ? medication_2.name : 'unknown'
        }],
        severity: 'none'
      }
    end
  end

  def find_interaction_severity(medication_1, medication_2)
    'Critical'
  end

end
