class ContributionsController < ApplicationController
  def mark_paid #Action to mark a contribution as paid, used in conjunction with checkboxes to submit the action form!
    @contribution = Contribution.find(params[:id])
    @contribution.update(paid: params[:paid])
    redirect_back fallback_location: trip_path(@contribution.expense.trip), notice: "Contribution updated."
  end
end
