class Interaction
  include ActiveModel::Model

  attr_accessor :medications

  def initialize(medications=nil)
    @medications = medications
  end

end
