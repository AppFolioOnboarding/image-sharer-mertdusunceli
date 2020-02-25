module Api
  class FeedbacksController < ApplicationController
    def create
      @feedback = Feedback.new(name: params[:name], comment: params[:comment])
      if @feedback.save
        render status: :ok, json: { msg: 'Successfully saved!' }
      else
        render status: :unprocessable_entity, json: { msg: 'Could not save feedback' }
      end
    end
  end
end
