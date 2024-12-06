class PagesController < ApplicationController
  layout false, only: [:terms]
  def terms
    # This action will render the terms_of_service view
  end
end
