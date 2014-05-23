class PinsController < ApplicationController
  def index
    @pins = Pin.all
    respond_to do |format|
      format.html
      format.json { render :json => @pins, :only => [:lat, :long]}
    end
    @pin = Pin.new
  end

  def create
    @pin = Pin.create(pin_params)
    respond_to do |format|
      if @pin.save
        format.json { render json: @pin, status: :created }
      else
        format.json { render json: @pin.errors, status: :unprocessable_entity }
      end
    end
  end
private
	def pin_params
		params.require(:pin).permit(:lat, :long)
	end	
end  
