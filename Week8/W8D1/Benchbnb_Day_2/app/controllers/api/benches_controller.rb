class Api::BenchesController < ApplicationController

  def index
    @benches = Bench.all
    render :index
  end

  def create
    @bench = Bench.new(bench_params)
    if @bench.save
      # render :show
    else
      render json: @bench.errors.full_messages, status: 401
    end
  end

  private

  def bench_params
    params.permit(:bench).require(:description, :lat, :lng)
  end
end
