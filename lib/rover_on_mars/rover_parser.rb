module RoverOnMars
  class RoverParser
    attr_reader :file_lines
    attr_accessor :rover_load

    def initialize(file)
      @file_lines = file.map { |l| l }
    end

    def rovers
      file_lines.slice(1, file_lines.size).each_slice(2).map do |e|
        coordinates = e.first.split.map { |e| e  =~ /[0-9]/ ? e.to_i : e }
        { coordinates: coordinates, orders: e[1] }
      end
    end

    def plateu
      file_lines.first.split.map(&:to_i)
    end

    def result
      RoverAdvance.new(plateu, rovers).location
    end
  end
end
