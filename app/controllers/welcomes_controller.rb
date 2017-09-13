class WelcomesController < ApplicationController
  before_action :set_welcome, only: [:show, :edit, :update, :destroy]

  def index
  end

  private
    def set_welcome
      @welcome = Welcome.find(params[:id])
    end

    def welcome_params
      params.fetch(:welcome, {})
    end
end
