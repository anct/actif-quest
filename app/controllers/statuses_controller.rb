class StatusesController < ApplicationController
	def create
    @status = current_user.statuses.build(status_params)
    if @status.save
      flash[:success] = "Status created!"
      redirect_to root_url
    else
      render 'static_pages/home'
    end
  end

  def destroy
  end

  private

    def status_params
      params.require(:status).permit(:body)
    end
end
