
require_relative 'spec_helper'
require 'pry'

describe 'Reception class' do
  before do
    @receptionist = Hotel::Reception.new
    @add_reservation = @receptionist.add_reservation(Date.new(2018,3,5), Date.new(2018,3,10))
  end

  it 'creates a new instance of Reception' do
    @receptionist.must_be_instance_of Hotel::Reception
  end

  it "returns an array of all reservations" do
    @receptionist.reservation_list.must_be_kind_of Array

    @add_reservation.length.must_equal 1
  end

  it "raises an error when date range is invalid" do
    proc {@receptionist.add_reservation(Date.new(2018,3,11), Date.new(2018,3,5))}.must_raise ArgumentError
  end

  it 'reservation_by_date' do
    @receptionist.reservations_by_date(Date.new(2018,3,8)).length.must_equal 1
    @receptionist.reservations_by_date(Date.new(2018,3,6)).length.must_equal 1
  end

  it 'retruns an empty array when no reservations on given date' do
    @receptionist.reservations_by_date(Date.new(2018,3,16)).must_equal []
    @receptionist.reservations_by_date(Date.new(2018,3,16)).must_be_empty
  end
  #
  # it "returns availability of room" do
  #   @receptionist.room_status((Date.new(2018,3,11)),1).must_equal "Available"
  # end

  # it "returns an array of available rooms for a given day" do
  #   @receptionist.availability_by_date(Date.new(2018,3,8)).must_be_kind_of Array
  #   @receptionist.availability_by_date(Date.new(2018,3,8)).length.must_equal 1
  # end

  it "returns an array of all available rooms for given range" do
    @receptionist.availability_by_date_range(Date.new(2018,3,5), Date.new(2018,3,10)).length.must_equal 19
  end

  it "returns an empty array if no rooms available for a given date range" do
    20.times do
      @receptionist.add_reservation(Date.new(2018,3,5), Date.new(2018,3,10))
    end

    @receptionist.availability_by_date_range(Date.new(2018,3,5), Date.new(2018,3,10)).must_equal []
    @receptionist.availability_by_date_range(Date.new(2018,3,5), Date.new(2018,3,10)).must_be_empty
  end
end
