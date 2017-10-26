class Admin::BaseController < ApplicationController

  before_action :current_admin

  def current_admin
    render_404 unless check_admin?
  end

end
