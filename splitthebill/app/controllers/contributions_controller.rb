class ContributionsController < ApplicationController
  def mark_paid #Action to mark a contribution as paid, used in conjunction with checkboxes to submit the action form!
    @contribution = Contribution.find(params[:id])
    @contribution.update(paid: params[:paid])
    redirect_back fallback_location: trip_path(@contribution.expense.trip), notice: "Contribution updated."
  end

  # def pay_all_contributions
  #   user = User.find(params[:id])
  #   contributions = user.contributions.where(expense_id: params[:trip_expenses], paid: false)
  #   contributions.update_all(paid: true)
  #   redirect_back fallback_location: trip_path(params[:trip_id]), notice: "All contributions marked as paid."
  # end
end
