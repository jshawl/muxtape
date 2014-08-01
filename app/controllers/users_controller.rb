class UsersController < ApplicationController
  def index
    session
  end
  def show
    puts params.inspect
  end
end
