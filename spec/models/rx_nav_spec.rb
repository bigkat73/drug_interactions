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

  context 'looking up interactions' do
    let(:medication) { FactoryGirl.create(:medication, nui: 'N0000147852', name: 'Fluoxetine') }
    let(:medication2){ FactoryGirl.create(:medication, nui: 'N0000007070', name: 'Morphine') }
    let(:medication3){ FactoryGirl.create(:medication, nui: 'N0000179514', name: 'Rasagline') }
    let(:medication4){ FactoryGirl.create(:medication, nui: 'N0000147924', name: 'Metoprolol') }
    let(:medication5){ FactoryGirl.create(:medication, nui: 'N0000147149', name: 'Naproxen') }

    let(:no_interaction){ RxNav::Medication::Interaction.new(medication.nui, medication2.nui) }
    let(:significant_interaction){ RxNav::Medication::Interaction.new(medication.nui, medication3.nui) }
    let(:critical_interaction){ RxNav::Medication::Interaction.new(medication2.nui, medication3.nui) }

    context 'interaction with no severity' do
      it 'has an interaction document' do
        no_interaction.document.class.should == Nokogiri::HTML::Document
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