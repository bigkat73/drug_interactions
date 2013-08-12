require 'open-uri'
require 'nokogiri'

module RxNav
  module Medication
    class Nui

      include RxNav::Utilities

      attr_reader :medication_name, :nui_document, :nui_url, :medication_nui

      def initialize(medication_name)
        @medication_name = medication_name
        @nui_url = "http://rxnav.nlm.nih.gov/REST/Ndfrt/search?conceptName=#{medication_name}&kindName=DRUG_KIND"
      end

      def nui_document
        @nui_document ||= Nokogiri::HTML(open(nui_url))
      end

      def medication_nui
        nui_field = nui_document.css("groupconcepts conceptnui").first.content rescue ''
        @medication_nui ||= clean_xml(nui_field, 'conceptui')
      end

    end
  end
end
