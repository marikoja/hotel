# require_relative 'reception'
require 'pry'
require 'date'

module Hotel
  COST = 200
  ROOMS = Array(1..20)
  class Reservation
    
    attr_reader :check_in, :check_out, :assigned_room

    def initialize(check_in, check_out)

      @check_in = check_in
      @check_out = check_out
      @range = date_range
      @length_of_stay = @range.length
      @assigned_room = assign_room
      @total_cost = total_cost
    end

# Randomly assigns room
    def assign_room
      assigned_room = ROOMS.sample
      return assigned_room
    end

# Creates array of dates from given check_in and check_out dates
    def date_range
      @range = (@check_in...@check_out).to_a
      return @range
    end


    def length_of_stay
       nights = (@check_out - @check_in).to_i
       return nights
    end

    def total_cost
      total_cost = (COST * length_of_stay).to_f.round(2)
      return total_cost
    end
  end
end
