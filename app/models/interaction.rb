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
        med1, med2, severity = interaction(m_id, @medication_ids[j])
        if severity != 'none'
          interactions << formatted_interaction(med1, med2, severity)
        end
      end
    end
    interactions
  end

  def interaction(medication_1_id, medication_2_id)
    medication_1 = Medication.where(id: medication_1_id).first
    medication_2 = Medication.where(id: medication_2_id).first
    severity = if medication_1 && medication_2
      find_interaction_severity(medication_1,medication_2)
    else
      'none'
    end
    [medication_1, medication_2, severity]
  end

  def find_interaction_severity(medication_1, medication_2)
    'Critical'
  end

  def formatted_interaction(medication_1, medication_2, severity)
    {
      medications: [{
        id: medication_1.id,
        name: medication_1.name
      },{
        id: medication_2.id,
        name: medication_2.name
      }],
      severity: severity
    }
  end

end
