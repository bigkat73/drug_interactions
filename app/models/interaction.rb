require 'net/http'
require 'uri'

class Interaction

  BASE_API_URL = "http://rxnav.nlm.nih.gov/REST/Ndfrt/interaction/"

  def self.severity(medication_1, medication_2)
    begin
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
    rescue
      'none'
    end
  end

end
