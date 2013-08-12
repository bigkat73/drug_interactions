require 'open-uri'
require 'nokogiri'

module RxNav
  module Medication
  	class Lookup

      include RxNav::Utilities

  	  BASE_URL = "http://rxnav.nlm.nih.gov/REST/drugs?name="

  	  attr_reader :name, :medication_name, :medication_document

  	  def initialize(name)
  	  	@name = name
  	  end

  	  def medication_document
  	  	@medication_document ||= Nokogiri::HTML(open(BASE_URL + name))
  	  end

  	  def medication_name
  	  	name_field = medication_document.xpath("//name").first.content rescue ''
  	  	@medication_name ||= clean_xml(name_field, 'name')
  	  end

  	  def medication_rxcui
  	    rxcui_field = medication_document.xpath("//rxcui").first.content rescue ''
  	    @medication_rxcui ||= clean_xml(rxcui_field, 'rxcui')
  	  end
  	
  	end
  end
end