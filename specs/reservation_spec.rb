require_relative 'spec_helper'
require 'pry'

describe 'Reservation class' do

  before do
    @new_reservation = Hotel::Reservation.new(Date.new(2018,3,5), Date.new(2018,3,10), 1)

    @room = @new_reservation.assigned_room
  end

    it "creates a new instance of Reservation" do
      @new_reservation.must_be_instance_of Hotel::Reservation
    end

    it "assigns a valid room" do
      Hotel::ROOMS.must_include @room
    end

    it "calculates number of nights" do
      @new_reservation.length_of_stay.must_be_kind_of Integer
      @new_reservation.length_of_stay.must_equal 5

      Hotel::Reservation.new(Date.new(2018,3,2), Date.new(2018,3,10), 1).length_of_stay.must_equal 8

      # Hotel::Reservation.new(Date.new(2018,3,2), Date.new(2018,3,2), 1).length_of_stay.must_equal 0
    end

    describe "date_range" do
      it "calculates accurate date range" do
        @new_reservation.date_range.must_be_kind_of Array
      end
    end
    it "calculatesthe total cost of stay" do
      @new_reservation.total_cost.must_be_kind_of Float

      @new_reservation.total_cost.must_be_within_delta 1000, 0.5
    end

end
