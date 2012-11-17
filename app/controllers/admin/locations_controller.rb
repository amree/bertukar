class Admin::LocationsController < ApplicationController
  # GET /admin/locations
  def index
    @locations = Location.all
  end

  # GET /admin/locations/1
  def show
    @location = Location.find(params[:id])
  end

  # GET /admin/locations/new
  def new
    @location = Location.new
  end

  # GET /admin/locations/1/edit
  def edit
    @location = Location.find(params[:id])
  end

  # POST /admin/locations
  def create
    @location = Location.new(params[:location])

    if @location.save
      redirect_to [:admin, @location], notice: 'Location was successfully created.'
    else
      render action: "new"
    end
  end

  # PUT /admin/locations/1
  def update
    @location = Location.find(params[:id])

    if @location.update_attributes(params[:location])
      redirect_to [:admin, @location], notice: 'Location was successfully updated.'
    else
      render action: "edit"
    end
  end

  # DELETE /admin/locations/1
  def destroy
    @location = Location.find(params[:id])

    if @location.destroy
      redirect_to admin_locations_url
    else
      redirect_to [:admin, @location], alert: @location.errors.full_messages.first
    end
  end
end
