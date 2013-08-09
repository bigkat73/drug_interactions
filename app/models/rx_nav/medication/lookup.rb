require 'open-uri'
require 'nokogiri'

module RxNav
  module Medication
  	class Lookup

  	  BASE_URL = "http://rxnav.nlm.nih.gov/REST/drugs?name="

  	  attr_reader :name, :medication_document

  	  def initialize(name)
  	  	@name = name
  	  end

  	  def clean_xml(field, field_name)
  	  	if field
  	  		field.gsub(/field_name/,'').gsub(/\</,'').gsub(/\/\>/,'')
  	  	else
  	  		''
  	  	end
  	  end

  	  def medication_document
  	  	@medication_document ||= Nokogiri::HTML(open(BASE_URL + name))
  	  end

  	  def medication_name
  	  	name = medication_document.xpath("//name").first.content
  	  	clean_xml(name, 'name')
  	  end

  	  def medication_rxcui
  	    rxcui = medication_document.xpath("//rxcui").first.content
  	    clean_xml(rxcui, 'rxcui')
  	  end
  	
  	end
  end
end