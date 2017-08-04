require 'spec_helper'

describe RoverOnMars do
  let(:file_read) { File.open('spec/fixtures/input.txt', 'r') }

  subject { RoverOnMars::RoverParser.new(file_read) }

  let(:expected_result) do
    [
      { coordinates: [1, 3, "N"] },
      { coordinates: [5, 1, "E"] }
    ]
  end

  its(:result) { is_expected.to eq expected_result }
end
