class BugsController < ApplicationController

  # GET /bugs
  def index
    @bugs = Bug.all
  end

  # GET /bugs/new
  def new
    @bug = Bug.new
    @bug.solve = false # Set solve to false when initialized
  end

  # POST /bugs
  def create
    @bug = Bug.new(bug_params)
    @bug.solve = false # Set solve to false when initialized

    # Recover the user in the current session
    @current_user = User.find session[:user_id]
    @bug.user_id = @current_user.id

    if @bug.save

      # Create a message with the bug's information
      message = ""
      message << "*New bug created!*\n"
      message << "*Name:* #{@bug.name}\n"
      message << "*Type:* #{@bug.bug_type}\n"
      message << "*Description:* ```#{@bug.description}``` \n"

      # Create a new Slack notifier
      notifier = Slack::Notifier.new "https://hooks.slack.com/services/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",
      channel: 'channel-test'

      # Send the message to Slack
      notifier.ping message

      flash.now.alert = 'Bug created successfully!'
      redirect_to @bug
    else
      render :new
    end
  end

  # GET /bugs/1
  def show
    @bug = Bug.find(params[:id])
  end

  # GET /bugs/1/edit
  def edit
    @bug = Bug.find(params[:id])
  end

  # PATCH/PUT /bugs/1
  def update
    @bug = Bug.find(params[:id])
    if @bug.update_attributes(bug_params)
      flash.now.alert = 'Bug has been updated!'
      redirect_to @bug
    else
      render :edit
    end
  end

  # DELETE /projects/1
  def destroy
    @bug = Bug.find(params[:id])
    @bug.destroy
    redirect_to bugs_path
  end

  # PUT /bugs/1
  def solve
    @bug = Bug.find(params[:id])
    if @bug.update_attribute(:solve, true)

      # Create a message with the bug's information
      message = ""
      message << "*Bug solved!*\n"
      message << "*State:* Solved\n"
      message << "*Name:* #{@bug.name}\n"
      message << "*Type:* #{@bug.bug_type}\n"
      message << "*Description:* ```#{@bug.description}``` \n"

      # Create a new Slack notifier
      notifier = Slack::Notifier.new "https://hooks.slack.com/services/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",
      channel: 'channel-test'

      # Send the message to Slack
      notifier.ping message

      redirect_to @bug, notice: 'Bug has been solved!'
    else
      redirect_to bugs_path, notice: "Couldn't solve bug" 
    end
  end

  private
  # Params allowed to be changed by the user
  def bug_params
    params.require(:bug).permit(:name, :bug_type, :description, :project_id)
  end
end
