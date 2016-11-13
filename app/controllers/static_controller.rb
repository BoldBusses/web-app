class StaticController < ApplicationController
  def index
    if current_user.present?
      redirect_to routes_path
    end
  end
end
