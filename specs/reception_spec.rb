
require_relative 'spec_helper'
require 'pry'

describe 'Reception class' do
  before do
    @receptionist = Hotel::Reception.new
    @new_reservation = @receptionist.add_reservation(Date.new(2018,3,5), Date.new(2018,3,10))
  end

  # ***IDEAS*** validate_date check for calendar date, check for date after today, check for valid date_range

  describe "initialize" do
    it 'creates a new instance of Reception' do
      @receptionist.must_be_instance_of Hotel::Reception
    end
  end

  describe "add_reservation" do
    it "returns an array of all reservations" do
      @receptionist.reservation_list.must_be_kind_of Array
    end

    it "assaigns an available room" do
      @new_reservation.assigned_room.must_equal 1
    end

    it "raises an error when date range is invalid" do
      proc {@receptionist.add_reservation(Date.new(2018,3,11), Date.new(2018,3,5))}.must_raise ArgumentError
    end
  end

  describe 'reservation_by_date' do
    it "returns the number of reservations for given day" do
      @receptionist.reservations_by_date(Date.new(2018,3,8)).length.must_equal 1
      @receptionist.reservations_by_date(Date.new(2018,3,6)).length.must_equal 1

      4.times do
        @receptionist.add_reservation(Date.new(2018,3,5), Date.new(2018,3,10))
      end
      @receptionist.reservations_by_date(Date.new(2018,3,6)).length.must_equal 5

      15.times do
        @receptionist.add_reservation(Date.new(2018,3,5), Date.new(2018,3,10))
      end
      @receptionist.reservations_by_date(Date.new(2018,3,6)).length.must_equal 20
    end

    it 'retruns an empty array when no reservations on given date' do
      @receptionist.reservations_by_date(Date.new(2018,3,16)).must_equal []
      @receptionist.reservations_by_date(Date.new(2018,3,16)).must_be_empty
      @receptionist.reservations_by_date(Date.new(2018,3,4)).must_be_empty
    end
  end

  describe "availability_by_date_range" do
    it "returns an array of all available rooms for given range" do
      @receptionist.availability_by_date_range(Date.new(2018,3,5), Date.new(2018,3,10)).length.must_equal 19

      4.times do
        @receptionist.add_reservation(Date.new(2018,3,5), Date.new(2018,3,10))
      end
      @receptionist.availability_by_date_range(Date.new(2018,3,5), Date.new(2018,3,10)).length.must_equal 15

    end

    it "returns an empty array if no rooms available for a given date range" do
      20.times do
        @receptionist.add_reservation(Date.new(2018,3,5), Date.new(2018,3,10))
      end

      @receptionist.availability_by_date_range(Date.new(2018,3,5), Date.new(2018,3,10)).must_equal []
      @receptionist.availability_by_date_range(Date.new(2018,3,5), Date.new(2018,3,10)).must_be_empty
    end

    it "will return array of all rooms if no bookings during given range" do
      @receptionist.availability_by_date_range(Date.new(2018,3,11), Date.new(2018,3,21)).length.must_equal 20
    end
  end

end
