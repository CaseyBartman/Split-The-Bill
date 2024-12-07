class TripsController < ApplicationController
  before_action :set_trip, only: %i[ show edit update destroy ]
  def index
    if current_user
      # Only include trips where the current user is a participant
      @trips = Trip.joins(:users).where(users: { id: current_user.id }).distinct
    else
      @trips = []
    end
  
    @user = current_user
    @users = User.all
  end

  # GET /trips/1 or /trips/1.json
  def show
  end

  # GET /trips/new
  def new
    @trip = Trip.new
    @users = User.all #We want to display each user in the form!

  end

  # GET /trips/1/edit
  def edit
    @users = User.all
  end


  # POST /trips or /trips.json
  def create
    @trip = Trip.new(trip_params)

    #For the trip to include users through participations, we need to pass user ids
    if @trip.save
      # Add selected users to the trip
      user_ids = params[:trip][:user_ids] || []
      user_ids.each do |user_id|
        @trip.participants.create(user_id: user_id)
      end
      redirect_to @trip
    else
      @users = User.all
      render :new
    end
  end

  # PATCH/PUT /trips/1 or /trips/1.json
  def update
    respond_to do |format|
      if @trip.update(trip_params)
        format.html { redirect_to @trip, notice: "Trip was successfully updated." }
        format.json { render :show, status: :ok, location: @trip }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @trip.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trips/1 or /trips/1.json
  def destroy
    @trip.destroy

    respond_to do |format|
      format.html { redirect_to trips_path, status: :see_other, notice: "Trip was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trip
      @trip = Trip.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def trip_params
      params.require(:trip).permit(:name, :start_date, :end_date)
    end
end
