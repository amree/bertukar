class Admin::LocationsController < ApplicationController
  # GET /admin/locations
  # GET /admin/locations.json
  def index
    @admin_locations = Admin::Location.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @admin_locations }
    end
  end

  # GET /admin/locations/1
  # GET /admin/locations/1.json
  def show
    @admin_location = Admin::Location.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @admin_location }
    end
  end

  # GET /admin/locations/new
  # GET /admin/locations/new.json
  def new
    @admin_location = Admin::Location.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @admin_location }
    end
  end

  # GET /admin/locations/1/edit
  def edit
    @admin_location = Admin::Location.find(params[:id])
  end

  # POST /admin/locations
  # POST /admin/locations.json
  def create
    @admin_location = Admin::Location.new(params[:admin_location])

    respond_to do |format|
      if @admin_location.save
        format.html { redirect_to @admin_location, notice: 'Location was successfully created.' }
        format.json { render json: @admin_location, status: :created, location: @admin_location }
      else
        format.html { render action: "new" }
        format.json { render json: @admin_location.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /admin/locations/1
  # PUT /admin/locations/1.json
  def update
    @admin_location = Admin::Location.find(params[:id])

    respond_to do |format|
      if @admin_location.update_attributes(params[:admin_location])
        format.html { redirect_to @admin_location, notice: 'Location was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @admin_location.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/locations/1
  # DELETE /admin/locations/1.json
  def destroy
    @admin_location = Admin::Location.find(params[:id])
    @admin_location.destroy

    respond_to do |format|
      format.html { redirect_to admin_locations_url }
      format.json { head :ok }
    end
  end
end
