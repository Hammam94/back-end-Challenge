class UsersController < ApplicationController
  def monopolists_list

    ten_percent_trips_all_time_count = Trip.last.id.to_f / 10

    ten_percent_trips_year_count =
      Trip.created_within(Date.today.beginning_of_year, DateTime.now).count.to_f / 10

    ten_percent_trips_month_count =
      Trip.created_within(Date.today.beginning_of_month, DateTime.now).count.to_f / 10

    monopolists = {
      all_time: User.where('all_time_counter >= ?', ten_percent_trips_all_time_count),
      year: User.where('year_counter >= ?', ten_percent_trips_year_count),
      month: User.where('month_counter >= ?', ten_percent_trips_month_count)
    }

    render json: monopolists
  end
end
