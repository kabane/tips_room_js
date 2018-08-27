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
    @tips = Tip.published_only.limit(6)
    if @tip.draft?
      redirect_to tips_path
    end
  end

end
