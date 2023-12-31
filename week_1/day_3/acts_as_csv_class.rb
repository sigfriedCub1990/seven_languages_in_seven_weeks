# frozen_string_literal: true

class ActAsCsv
  attr_reader :headers

  def self.act_as_csv
    define_method 'read' do
      file = File.new("#{self.class.to_s.downcase}.txt")
      @headers = file.gets.chomp.split(', ')

      file.each do |row|
        @result << row.chomp.split(', ')
      end
    end

    define_method 'csv_contents' do
      @result
    end

    define_method 'initialize' do
      @result = []
      read
    end
  end
end

class RubyCsv < ActAsCsv
  act_as_csv
end

m = RubyCsv.new
puts m.headers.inspect
puts m.csv_contents.inspect
