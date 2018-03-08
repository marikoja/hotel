require_relative 'reservation'
require 'pry'
require 'date'

module Hotel
  class Reception
    attr_reader :reservation_list
    def initialize
      @reservation_list = []
    end


# Adds new resercation to reservations array
    def add_reservation(check_in, check_out)
      new_reservation = Hotel::Reservation.new(check_in, check_out)
      if check_in >= check_out
        raise ArgumentError.new "invalid date range"
      end
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
      #
      # # if reservations_on_date.empty?
      #   return "All rooms available for #{date}"
      # # end
      return reservations_on_date
    end

    # def availability_by_date(date)
    #   booked_rooms_on_date = []
    #
    #   resercations_by_date(date).each do |reservation|
    #     booked_rooms_on_date << @assigned_room
    #   end
    #
    #   if booked_rooms_on_date.empty?
    #     raise ArgumentError.new "No rooms available on #{date}"
    #   end
    #   return booked_rooms_on_date
    # end

    def availability_by_date_range(check_in, check_out)
        occupied_rooms = []
        range = (check_in...check_out).to_a
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

    # def room_status(date, room)
    #   availability = ""
    #   if availability_by_date(date).availability_on_date.include? room
    #      availability = "Available"
    #   else
    #     availability = "Booked"
    #   end
    #   return availability
    # end

  end
end
