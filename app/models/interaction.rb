require 'net/http'
require 'uri'

class Interaction
  include ActiveModel::Model

  BASE_API_URL = "http://rxnav.nlm.nih.gov/REST/Ndfrt/interaction/"

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
    uri = URI.parse(BASE_API_URL)
    http = Net::HTTP.new(uri.host, uri.port)
    request = Net::HTTP::Get.new(uri.request_uri + "nui1=#{medication_1.nui}&nui2=#{medication_2.nui}&scope=2")
    request["User-Agent"] = "My Ruby Script"
    request["Accept"] = "application/json"

    output = JSON.parse(http.request(request).body)
    if output["fullInteractionGroup"]["fullInteraction"].first["interactionCount"].to_i > 0
      output["fullInteractionGroup"]["fullInteraction"].first["interactionTripleGroup"].first["interactionTriple"].first["severity"]
    else
      'none'
    end
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
