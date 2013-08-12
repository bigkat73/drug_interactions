module RxNav
  module Medication
    class Interaction

      BASE_URL = "http://rxnav.nlm.nih.gov/REST/Ndfrt/interaction/"

      attr_reader :url, :nui1, :nui2, :interaction_document

      def initialize(nui1, nui2)
        @nui1 = nui1
        @nui2 = nui2
        @url  = BASE_URL + "nui1=#{nui1}&nui2=#{nui2}&scope=2"
      end

      def interaction_document
        @interaction_document ||= Nokogiri::HTML(open(url))
      end

      def count
        @count ||= (interaction_document.css("fullinteractiongroup fullinteraction interactioncount").first.content rescue 0).to_i
      end

      def severity
        @severity ||= if count > 0
          interaction_document.css("fullinteractiongroup fullinteraction interactiontriple severity").first.content rescue ''
        else
          'none'
        end
      end

    end
  end
end
