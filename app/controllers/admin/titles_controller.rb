class Admin::TitlesController < ApplicationController
  # GET /admin/titles
  def index
    @titles = Title.all
  end

  # GET /admin/titles/1
  def show
    @title = Title.find(params[:id])
  end

  # GET /admin/titles/new
  def new
    @title = Title.new
  end

  # GET /admin/titles/1/edit
  def edit
    @title = Title.find(params[:id])
  end

  # POST /admin/titles
  def create
    @title = Title.new(params[:title])

    if @title.save
      redirect_to [:admin, @title], notice: 'Title was successfully created.'

    else
      render action: "new"
    end
  end

  # PUT /admin/titles/1
  def update
    @title = Title.find(params[:id])

    if @title.update_attributes(params[:title])
      redirect_to [:admin, @title], notice: 'Title was successfully updated.'
    else
      render action: "edit"
    end
  end

  # DELETE /admin/titles/1
  def destroy
    @title = Title.find(params[:id])
    @title.destroy

    redirect_to admin_titles_url
  end
end
