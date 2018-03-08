require_relative 'reservation'
require 'pry'
require 'date'

module Hotel
  class Reception
    attr_reader :reservation_list#, :assigned_room
    def initialize
      @reservation_list = []
      # @assigned_room = assign_room
    end

# Checks for availabl rooms, assigns room to new_reservation and adds new reservation to reservations array
    def add_reservation(check_in, check_out)

      available_room = availability_by_date_range(check_in, check_out).first

      new_reservation = Hotel::Reservation.new(check_in, check_out, available_room)
      if check_in >= check_out
        raise ArgumentError.new "invalid date range"
      end
      # assign_room(check_in, check_out)
      @reservation_list << new_reservation
      return @reservation_list
    end

# Searches through reservatsions to generate reservations for a given day
    def reservations_by_date(date)
      reservations_on_date = []
      @reservation_list.each do |reservation|
        if reservation.date_range.include? date
          reservations_on_date << reservation
        end
      end
      return reservations_on_date
    end

# compares each reservation to date range in question and returns an array of rooms available for the given period.
    def availability_by_date_range(check_in, check_out)
        occupied_rooms = []
        range = (check_in...check_out)#.to_a
        @reservation_list.each do |reservation|
          if (range.include? reservation.check_in) || (range.include? reservation.check_out - 1)
            occupied_rooms << reservation.assigned_room
          end
        end

        available_rooms = []
        ROOMS.each do |room|
          if !(occupied_rooms.include? room)
            available_rooms << room
          end
        end
        return available_rooms
    end

  end
end
