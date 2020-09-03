class TripsController < ApplicationController
  # POST /trips
  def create
    # binding.pry
    begin
      user = User.find_by(email: trip_params[:email])
      if user.has_role? :driver

        new_month_counter = 0
        new_year_counter = 0

        if user.trips.last.created_at.month == Date.today.month
          new_month_counter = user.month_counter.to_i + 1
        end

        if user.trips.last.created_at.year == Date.today.year
          new_year_counter = user.year_counter.to_i + 1
        end


        @trip = user.trips.create!()

        user.update(
          month_counter: new_month_counter,
          year_counter: new_year_counter,
          all_time_counter: user.all_time_counter.to_i + 1
        )

        render json: @trip, status: :created
      else
        render json: {error: "The user must be driver to continue."}, status: :unprocessable_entity
      end
    rescue Exception
      render json: {error: "The user must be driver to continue."}, status: :unprocessable_entity
    end
  end

  private

    def trip_params
      params.permit(:email, :password)
    end
end
