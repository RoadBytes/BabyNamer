# app/controllers/pages_controller.rb
class PagesController < ApplicationController
  include HighVoltage::StaticPage

  def show
    page = params[:id]
    @comments = Comment.where(commentable_type: "Page#{page.capitalize}")
                       .order(created_at: :desc)
    render page
  end
end
