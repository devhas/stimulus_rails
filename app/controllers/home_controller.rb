# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @employees = Employee.all
  end
end
