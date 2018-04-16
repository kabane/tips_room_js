class Admin::TipsController < ApplicationController
  layout 'admin'

  before_action :authenticate_user!
  before_action :set_tip, only: [:show, :edit, :update, :destroy]
  before_action :owner?, only: [:edit, :update, :destroy]

  def index
    @tips = current_user.tips
  end

  def show
  end

  # GET /tips/new
  def new
    @tip = current_user.tips.new
  end

  # GET /tips/1/edit
  def edit
  end

  # POST /tips
  # POST /tips.json
  def create
    @tip = current_user.tips.new(tip_params)
    @tip.status = :draft if params["draft_btn"].present?

    respond_to do |format|
      if @tip.save
        format.html { redirect_to admin_tip_path(@tip), notice: 'Tip was successfully created.' }
        format.json { render :show, status: :created, location: @tip }
      else
        format.html { render :new }
        format.json { render json: @tip.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tips/1
  # PATCH/PUT /tips/1.json
  def update
    if params["draft_btn"].present?
      @tip.status = :draft
    else
      @tip.status = :published
    end

    respond_to do |format|
      if @tip.update(tip_params)
        format.html { redirect_to admin_tip_path(@tip), notice: 'Tip was successfully updated.' }
        format.json { render :show, status: :ok, location: @tip }
      else
        format.html { render :edit }
        format.json { render json: @tip.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tips/1
  # DELETE /tips/1.json
  def destroy
    @tip.destroy
    respond_to do |format|
      format.html { redirect_to admin_tips_url, notice: 'Tip was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_tip
      @tip = current_user.tips.find(params[:id])
    end

    def tip_params
      params.require(:tip).permit(:title, :contents)
    end

    def owner?
      redirect_to admin_tips_path unless @tip.owner?(current_user)
    end
end
