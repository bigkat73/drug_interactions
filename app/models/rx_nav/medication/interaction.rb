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

      def document
        @interaction_document ||= Nokogiri::HTML(open(url))
      end

      def count
        @count ||= document.css("fullinteractiongroup fullinteraction interactioncount").first.content.to_i
      end

      def severity
        @severity ||= if count > 0
          document.css("fullinteractiongroup fullinteraction interactiontriple severity").first.content
        else
          'none'
        end
      end

    end
  end
end
