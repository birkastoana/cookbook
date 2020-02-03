class ErrorsController < ApplicationController

  def not_found
    render "error", status: 404, formats: html
  end
end
