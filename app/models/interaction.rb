class Interaction
  include ActiveModel::Model

  attr_accessor :medications

  def initialize(medications=nil)
    @medications = medications
  end

  def interactions
    [
      {
        medications: [
          {id: 216, name: 'Aspirin'},
          {id: 355, name: 'Warfarin'}
        ],
        severity: 'Critical'
      }
    ]
  end

end
