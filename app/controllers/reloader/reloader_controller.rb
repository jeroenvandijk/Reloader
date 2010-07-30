class Reloader::ReloaderController < ActionController::Base
  layout false
  
  def show
    respond_to do |format|
      format.js {
        render :file => File.expand_path("../../../../public/javascripts/#{params[:file]}.js", __FILE__)
      }
    end
  end

end


