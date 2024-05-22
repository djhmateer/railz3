class HomeController < ApplicationController
  # this puts auth on for all pages on home controller
  # before_action :authenticate_user!

  # only on the secret page do we want to authenticate
  # before_action :authenticate_user!, only: [:secret]

  # needs to be an admin to see secret page otherwise redirect to root
  before_action :is_admin!, only: [:secret]

  def is_admin!
    redirect_to root_path unless user_signed_in? && current_user.is_admin?
  end

  def index
  end

  # def about
  # end

  def dave
  end

  def secret
  end
end
