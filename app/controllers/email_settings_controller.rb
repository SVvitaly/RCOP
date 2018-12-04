class EmailSettingsController < ApplicationController

  # def index
  #   @email_settings = EmailSetting.all
  #   respond_to do |format|
  #     format.html # index.html.erb
  #     format.json { render json: @email_settings }
  #   end
  # end

  # def show
  #   respond_to do |format|
  #     format.html # show.html.erb
  #     format.json { render json: @email_setting}
  #   end
  # end

  def new
    @notice
    @email_setting = EmailSetting.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @email_setting }
    end
  end

  def create
    @email_setting = EmailSetting.new(resource_params)
    # if @email_setting.valid?
    #   EmailMailer.email_created(@email_setting).deliver
    # end
    # redirect_to action: "new"
    respond_to do |format|
      if @email_setting.valid?
        format.html { redirect_to action: "new", notice: 'Сообщение было отправлено.' }
        format.json
        EmailMailer.email_created(@email_setting).deliver
      else
        format.html { render action: "new" }
        format.json { render json: @email_setting.errors, status: :unprocessable_entity, notice: 'Не валидные данные.' }
      end
    end
  end
  #
  # # PUT /agents/1
  # # PUT /agents/1.json
  # def update
  #   respond_to do |format|
  #     if SaveChanges.save(@agent, agent_params, current_agent)
  #       format.html {
  #         redirect_to agent_path(@agent), notice: 'Agent was successfully updated.'
  #       }
  #       format.json { head :no_content }
  #     else
  #       format.html { render action: "edit" }
  #       format.json { render json: @agent.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end
  #
  # # DELETE /agents/1
  # # DELETE /agents/1.json
  # def destroy
  #   @agent.destroy
  #
  #   respond_to do |format|
  #     format.html { redirect_to agents_url }
  #     format.json { head :no_content }
  #   end
  # end
  #

  protected

  def resource_params
    params.require(:email_setting).permit(:first_name, :last_name, :patronymic, :email, :text, :address)
  end
end
