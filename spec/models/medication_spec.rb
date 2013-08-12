require 'spec_helper'

describe Medication do

  let(:medication) { FactoryGirl.create(:medication, nui: 'N0000147852', name: 'Fluoxetine') }
  let(:medication2){ FactoryGirl.create(:medication, nui: 'N0000145914', name: 'Morphine') }
  let(:medication3){ FactoryGirl.create(:medication, nui: 'N0000148014', name: 'selegiline') }
  let(:medication4){ FactoryGirl.create(:medication, nui: 'N0000147924', name: 'Metoprolol') }
  let(:medication5){ FactoryGirl.create(:medication, nui: 'N0000147149', name: 'Naproxen') }

  context 'when interaction is severe' do
    it { medication.interaction_severity_to(medication4).should == 'Significant' }
  end

  context 'when interaction is critical' do
    it { medication.interaction_severity_to(medication3).should == 'Critical' }
  end

  context 'when interaction doesnt exist' do
    it { medication.interaction_severity_to(medication5).should == 'none' }
  end

end
