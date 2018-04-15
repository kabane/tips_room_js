class TipsController < ApplicationController
  before_action :set_tip, only: [:show, :edit, :update, :destroy]

  # GET /tips
  # GET /tips.json
  def index
    @tips = Tip.all
  end

  # GET /tips/1
  # GET /tips/1.json
  def show
  end

  private
    def set_tip
      @tip = Tip.find(params[:id])
    end

    def tip_params
      params.require(:tip).permit(:title, :contents)
    end
end
