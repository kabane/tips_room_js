class TipsController < ApplicationController
  layout 'tips'

  # GET /tips
  # GET /tips.json
  def index
    @tips = Tip.published_only
  end

  # GET /tips/1
  # GET /tips/1.json
  def show
    @tip = Tip.find(params[:id])
    if @tip.draft?
      redirect_to tips_path
    end
  end

end
