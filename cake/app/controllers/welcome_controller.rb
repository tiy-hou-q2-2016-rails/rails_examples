require 'csv'

class WelcomeController < ApplicationController

  class Birthdate
    attr_accessor :year, :month, :day, :births

    def initialize(year, month, day, births)
      @year = year
      @month = month
      @day = day
      @births = births
    end
  end

  def fetch_day_array(records)

    dates = {}

    total_births = records.map {|d| d.births}.reduce(:+)

    (1..12).each do |month|
      (1..31).each do |day|
        this_date_total = records.select {|b| b.month == month && b.day == day}.map{|b| b.births}.reduce(:+)
        percent = this_date_total.to_i / total_births.to_f

        dates["#{month}-#{day}"] = percent if this_date_total.to_i > 0
       end
     end

     dates

  end

  def dashboard

    @number_of_people = params[:number_of_people].to_i

    @dates = []

    CSV.foreach("#{Rails.root}/data.csv", headers: true) do |row|
      hash = row.to_hash
      year = row["year"].to_i
      month = row["month"].to_i
      day = row["date_of_month"].to_i
      births = row["births"].to_i

      @dates << Birthdate.new(year, month, day, births)
    end

    @total_births = @dates.map {|d| d.births}.reduce(:+)

    @day_of_years = fetch_day_array(@dates)

    today = Date.today

    @chance = @number_of_people * @day_of_years["#{today.month}-#{today.day}"]

    # I am inverting so i can find which dates for a particular percent
    values = @day_of_years.values.sort
    inverted = @day_of_years.invert
    @most_likely_day = inverted[values.reverse.first]
    @least_likely_day = inverted[values.first]

    @ten_least_likely_births = inverted.values_at *values.take(10)
    @ten_most_likely_births = inverted.values_at *values.reverse.take(10)

    @most_likely_day_start = "2016-#{@most_likely_day}".to_date - 40.weeks
    @least_likely_day_start = "2016-#{@least_likely_day}".to_date - 40.weeks

  end


end
