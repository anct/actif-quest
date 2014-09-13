class Admin::AchievementsController < Admin::BaseController
  before_action :set_admin_achievement, only: [:show, :edit, :update, :destroy] 

  # GET /admin/achievements
  # GET /admin/achievements.json
  def index
    @achievements = Achievement.all
  end

  # GET /admin/achievements/1
  # GET /admin/achievements/1.json
  def show
  end

  # GET /admin/achievements/new
  def new
    @achievement = Achievement.new
  end

  # GET /admin/achievements/1/edit
  def edit
  end

  # POST /admin/achievements
  # POST /admin/achievements.json
  def create
    @achievement = Achievement.new(admin_achievement_params)

    respond_to do |format|
      if @achievement.save
        format.html { redirect_to admin_achievements_url, notice: 'Achievement was successfully created.' }
        format.json { render :show, status: :created, location: @achievement }
      else
        format.html { render :new }
        format.json { render json: @achievement.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/achievements/1
  # PATCH/PUT /admin/achievements/1.json
  def update
    respond_to do |format|
      if @achievement.update(admin_achievement_params)
        format.html { redirect_to admin_achievements_url, notice: 'Achievement was successfully updated.' }
        format.json { render :show, status: :ok, location: @achievement }
      else
        format.html { render :edit }
        format.json { render json: @achievement.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/achievements/1
  # DELETE /admin/achievements/1.json
  def destroy
    @achievement.destroy
    respond_to do |format|
      format.html { redirect_to admin_achievements_url, notice: 'Achievement was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_achievement
      @achievement = Achievement.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_achievement_params
      params.require(:achievement).permit(:name, :introduction, :image_url, :group_id)
    end
end

end
