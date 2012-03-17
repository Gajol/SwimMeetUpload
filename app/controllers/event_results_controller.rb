class EventResultsController < ApplicationController
  def show
        @event_result = EventResult.find(params[:id])
        send_data @event_result.data, :filename => @event_result.filename, :type => @event_result.content_type, :disposition => "inline"
		# :target => "_blank" 
  end
  
  # def show
     # event_result = EventResult.find(params[:id])
	 # respond_to do |format|
        # format.html
        # #  http://guides.rubyonrails.org/action_controller_overview.html for PDF example
     # end
  # end

  # GET /event_results
  # GET /event_results.json
  def index
    @event_results = EventResult.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @posts }
    end
  end

  
  def create
        return if params[:event_result].blank?

        @event_result = EventResult.new
        @event_result.uploaded_file = params[:event_result]

        if @event_result.save
            flash[:notice] = "Thank you for your submission..."
            redirect_to :action => "index"
        else
            flash[:error] = "There was a problem submitting your event_result."
            render :action => "new"
        end
  end
  
  
  def destroy
    @event_result = EventResult.find(params[:id])
    @event_result.destroy

    respond_to do |format|
      format.html { redirect_to '/event_results' }
      format.json { head :no_content }
    end
  end
end
