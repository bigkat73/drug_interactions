class InteractionsController < ApplicationController

  # GET /interactions
  # GET /interactions.json
  def index
    med_ids = params[:medication_ids].present? ? params[:medication_ids].split(',') : []
    @interaction = Interactions.new(med_ids)
    @interactions = @interaction.interactions
  end

end
