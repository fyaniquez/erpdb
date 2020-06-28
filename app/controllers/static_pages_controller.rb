class StaticPagesController < ApplicationContrioller
  before_action :authenticate_user!, except: [:welcome, :about, home, help]

  def home
  end
  def about
  end
  def help
  end
  def welcome
  end
end
