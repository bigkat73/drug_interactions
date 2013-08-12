require 'spec_helper'

describe RxNav do

  context 'medication lookup' do

  	let(:lookup_name){ 'CLOMIPHENE'}
  	let(:test_rxcui) { '1093062' }
  	let!(:rx_nav){ RxNav::Medication::Lookup.new(lookup_name) }
  	let(:medication){ rx_nav.medication_document }
  	let(:medication_name) { rx_nav.medication_name }
  	let(:medication_rxcui){	rx_nav.medication_rxcui }

		it 'is not nil' do
		  medication.nil?.should == false
		end

		it 'is a nokogiri object' do
			medication.class.should == Nokogiri::HTML::Document
		end

		it 'is the medication name' do
			medication_name.should == lookup_name
		end

		it 'is the rxcui name' do
			medication_rxcui.should == test_rxcui
		end

	end

  context 'nui lookup' do
    let(:medication_name_1){ 'fluoxetine' }
    let(:medication_name_2){ 'morphine' }
    let(:nui_1){ 'N0000147852' }
    let(:nui_2){ 'N0000145914' }

    it 'matches nuis to the looked up value for fluoxetine' do
      nui_lookup_1 = RxNav::Medication::Nui.new(medication_name_1)
      nui_lookup_1.medication_nui.should == nui_1
    end

    it 'matches nui for morphine' do
      nui_lookup_2 = RxNav::Medication::Nui.new(medication_name_2)
      nui_lookup_2.medication_nui.should == nui_2
    end

  end

  context 'looking up interactions' do
    let(:nui1) { 'N0000147852' }
    let(:nui2){ 'N0000145914' }
    let(:nui3){ 'N0000179514' }
    let(:nui4){ 'N0000147924' }
    let(:nui5){ 'N0000147149' }

    let(:no_interaction){ RxNav::Medication::Interaction.new(nui1, nui2) }
    let(:significant_interaction){ RxNav::Medication::Interaction.new(nui1, nui3) }
    let(:critical_interaction){ RxNav::Medication::Interaction.new(nui2, nui3) }

    context 'interaction with no severity' do
      it 'has an interaction document' do
        no_interaction.interaction_document.class.should == Nokogiri::HTML::Document
      end

      it 'has an interaction count of 0' do
        no_interaction.count.should == 0
      end

      it 'has interaction severity of none' do
        no_interaction.severity.should == 'none'
      end
    end

    context 'interaction with significant severity' do
      it 'has a Significant interaction' do
        significant_interaction.severity.should == 'Significant'
      end

      it 'has an interaction count greater than 0' do
        significant_interaction.count.should_not == 0
      end
    end

    it 'has a critical interaction' do
      critical_interaction.severity.should == 'Critical'
    end

  end

end 