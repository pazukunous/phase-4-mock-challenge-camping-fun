class SignupsController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :render_not_found
rescue_from ActiveRecord::RecordInvalid, with: :render_invalid
    def create
        signup = Signup.create!(signup_params)
        render json: signup.activity, status: :created
    end

    private

    def signup_params
        params.permit(:time, :camper_id, :activity_id)
    end

    def render_invalid
        render json: {"errors": ["validation errors"] }, status: :unprocessable_entity
    end
    def render_not_found
        render json: {error: "Camper not found"}, status: :not_found
    end
end
