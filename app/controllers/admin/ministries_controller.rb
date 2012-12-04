class Admin::MinistriesController < ApplicationController
  before_filter :require_admin

  # GET /ministries
  def index
    @ministries = Ministry.all
  end

  # GET /ministries/1
  def show
    @ministry = Ministry.find(params[:id])
  end

  # GET /ministries/new
  def new
    @ministry = Ministry.new
  end

  # GET /ministries/1/edit
  def edit
    @ministry = Ministry.find(params[:id])
  end

  # POST /ministries
  def create
    @ministry = Ministry.new(params[:ministry])

    if @ministry.save
      redirect_to [:admin, @ministry], notice: 'Ministry was successfully created.'
    else
      render action: "new"
    end
  end

  # PUT /ministries/1
  def update
    @ministry = Ministry.find(params[:id])

    if @ministry.update_attributes(params[:ministry])
      redirect_to [:admin, @ministry], notice: 'Ministry was successfully updated.'
    else
      render action: "edit"
    end
  end

  # DELETE /ministries/1
  def destroy
    @ministry = Ministry.find(params[:id])

    if @ministry.destroy
      redirect_to admin_ministries_url
    else
      redirect_to [:admin, @ministry], alert: @ministry.errors.full_messages.first
    end
  end
end
