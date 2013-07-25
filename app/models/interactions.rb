class Interactions
  include ActiveModel::Model

  attr_accessor :medication_ids

  def initialize(medication_ids=[])
    @medication_ids = medication_ids
  end

  def interactions
    interactions = []
    @medication_ids.each_with_index do |m_id, i|
      (i+1).upto(@medication_ids.size-1) do |j|
      	medication1 = Medication.where(id: m_id).first
      	medication2 = Medication.where(id: @medication_ids[j]).first
        severity, formatted_interaction = medication1.interaction_severity_to(medication2)
        if severity != 'none'
          interactions << medication1.formatted_interaction
        end
      end
    end
    interactions
  end

end