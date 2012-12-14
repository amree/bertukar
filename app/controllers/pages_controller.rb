class PagesController < ApplicationController
  skip_before_filter :require_authentication

  def about
  end
end
