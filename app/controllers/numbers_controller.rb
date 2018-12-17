class NumbersController < ApplicationController

  MIN_NUMBER = 1111111111
  MAX_NUMBER = 9999999999

  def index
    @new_number = params["new_number"] unless params["new_number"].nil?
  end

  def new
  end

  def get_new_number
    if NumberRunning.count == 0
      running = NumberRunning.new
      running.counter = MIN_NUMBER
      running.save!
    else
      running = NumberRunning.first
    end

    new_number = "not_found"
    can_use_unique = false
    unless params["value"].nil? || params["value"] == ""
      new_number = params["value"].to_i
      new_number = MIN_NUMBER if new_number < MIN_NUMBER
      new_number = MAX_NUMBER if new_number > MAX_NUMBER
      unless Number.any? {|n| n.value == new_number }
        can_use_unique = true
      end
    end

    if can_use_unique
      @number = Number.new
      @number.value = new_number
      @number.save!
    else
      if running.counter < MAX_NUMBER
        new_number = running.counter
        running.counter += 1 if running.counter < MAX_NUMBER
        running.save!
      end
    end

    redirect_to :action => "index", :new_number => new_number
  end
end
