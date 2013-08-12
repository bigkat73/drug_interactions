class InteractionsController < ApplicationController
  before_action :set_interaction, only: [:show, :edit, :update, :destroy]

  # GET /interactions
  # GET /interactions.json
  def index
  end

end
