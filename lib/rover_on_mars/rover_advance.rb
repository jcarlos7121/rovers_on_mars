module RoverOnMars
  class RoverAdvance
    DIRECTION_STATE = {
      N_L: 'W',
      W_L: 'S',
      S_L: 'E',
      E_L: 'N',
      N_R: 'E',
      E_R: 'S',
      S_R: 'W',
      W_R: 'N'
    }

    attr_reader :plateu, :rovers

    def initialize(plateu, rovers)
      @plateu, @rovers  = plateu, rovers
    end

    def location
      rovers.map { |rover| calculate_position(rover) }
    end

    def calculate_position(rover)
      x, y, direction = rover[:coordinates]

      rover[:orders].each_char do |c|
        if c == 'L' || c == 'R'
          direction = calculate_direction(direction, c)
        end

        if c == 'M'
          case direction
          when 'N'
            y = y + 1
          when 'S'
            y = y - 1
          when 'W'
            x = x - 1
          when 'E'
            x = x + 1
          end
        end
      end

      { coordinates: [ x, y, direction ] }
    end

    def calculate_direction(current, c)
      DIRECTION_STATE["#{current}_#{c}".to_sym]
    end
  end
end
