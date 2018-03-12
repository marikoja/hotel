 require_relative 'reception'

require 'pry'
require 'date'

# block is-a reception item
# block inherits from reception

module Hotel
  class Block < Reception

    def initialize(check_in, check_out, number_of_rooms)
      @check_in = check_in
      @check_out = check_out
      @number_of_rooms = number_of_rooms

      availability_by_date_range(check_in, check_out)
    end

    def hold_block

    end
  end
end
