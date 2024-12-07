class ExpensesController < ApplicationController
  before_action :set_expense, only:[:show, :destroy, :edit, :update]
  before_action :set_trip, only: [:index, :new, :create]
  
  # GET /expenses or /expenses.json
  def index
    @expenses = @trip.expenses
  end

  # GET /expenses/new
  def new
    @expense = @trip.expenses.new  #Create a new expense related to the trip
    @participants = @trip.participants.includes(:user)  #Get the participants with the associated users, this should work!

    # Build contributions for all participants
    @participants.each do |participant|
      @expense.contributions.build(user: participant.user)
    end    
  end
  

  # GET /expenses/1/edit
def edit
  @trip = @expense.trip #Since our trip needs to be associated with the expense!!!
  @participants = @trip.participants.includes(:user)  #Get the participants with the associated users, this should work!
end

  #POST /expenses or /expenses.json
def create
  @expense = @trip.expenses.new(expense_params)  #Create a new expense related to the trip!
  @participants = @trip.participants.includes(:user)

  respond_to do |format|
    if @expense.save
      format.html { redirect_to trip_expenses_path(@expense.trip), notice: "Expense was successfully created." }
      format.json { render :show, status: :created, location: @expense }
    else
      format.html { render :new, status: :unprocessable_entity }
      format.json { render json: @expense.errors, status: :unprocessable_entity }
    end
  end
end

  # PATCH/PUT /expenses/1 or /expenses/1.json
  def update
    @trip = @expense.trip #Since our trip needs to be associated with the expense, we load it this way

    respond_to do |format|
      if @expense.update(expense_params)
        format.html { redirect_to trip_expenses_path(@trip, @expense), notice: "Expense was successfully updated." }
        format.json { render :show, status: :ok, location: @expense }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @expense.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /expenses/1 or /expenses/1.json
  def destroy
    @expense.destroy

    respond_to do |format|
      format.html { redirect_to trip_expenses_path(@expense.trip, @expense), status: :see_other, notice: "Expense was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
  #Setting expense
    def set_expense
      @expense = Expense.find(params[:id])
    end

    #Setting the trip here for reuse above!
    def set_trip
      @trip = Trip.find(params[:trip_id])  #Find the trip based on trip_id param!
    end

    #Param helper method!
    def expense_params
      params.require(:expense).permit(
        :trip_id, :name, :expense_type, :amount, :payer_id, :date,
        contributions_attributes: [:id, :user_id, :amount, :paid]
      )
    end
end
