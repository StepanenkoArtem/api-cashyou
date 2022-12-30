class TestController < ApplicationController
  def test 
    render json: { health: :ok }, status: :ok
  end
end
