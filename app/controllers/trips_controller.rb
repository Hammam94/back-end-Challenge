class TripsController < ApplicationController
  # POST /trips
  def create
    # binding.pry
    user = User.find_by(email: trip_params[:email])
    if user.has_role? :driver
      @trip = user.trips.create!()

      new_month_counter = user.month_counter.to_i + 1
      new_year_counter = user.year_counter.to_i + 1
      new_all_time_counter = user.all_time_counter.to_i + 1

      user.update(
        month_counter: user.month_counter.to_i + 1,
        year_counter: user.year_counter.to_i + 1,
        all_time_counter: user.all_time_counter.to_i + 1
      )

      render json: @trip, status: :created
    else
      render status: :unprocessable_entity
    end
  end

  private

    def trip_params
      params.permit(:email, :password)
    end
end
