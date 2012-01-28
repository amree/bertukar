class Admin::TitlesController < ApplicationController
  # GET /admin/titles
  # GET /admin/titles.json
  def index
    @admin_titles = Admin::Title.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @admin_titles }
    end
  end

  # GET /admin/titles/1
  # GET /admin/titles/1.json
  def show
    @admin_title = Admin::Title.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @admin_title }
    end
  end

  # GET /admin/titles/new
  # GET /admin/titles/new.json
  def new
    @admin_title = Admin::Title.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @admin_title }
    end
  end

  # GET /admin/titles/1/edit
  def edit
    @admin_title = Admin::Title.find(params[:id])
  end

  # POST /admin/titles
  # POST /admin/titles.json
  def create
    @admin_title = Admin::Title.new(params[:admin_title])

    respond_to do |format|
      if @admin_title.save
        format.html { redirect_to @admin_title, notice: 'Title was successfully created.' }
        format.json { render json: @admin_title, status: :created, location: @admin_title }
      else
        format.html { render action: "new" }
        format.json { render json: @admin_title.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /admin/titles/1
  # PUT /admin/titles/1.json
  def update
    @admin_title = Admin::Title.find(params[:id])

    respond_to do |format|
      if @admin_title.update_attributes(params[:admin_title])
        format.html { redirect_to @admin_title, notice: 'Title was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @admin_title.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/titles/1
  # DELETE /admin/titles/1.json
  def destroy
    @admin_title = Admin::Title.find(params[:id])
    @admin_title.destroy

    respond_to do |format|
      format.html { redirect_to admin_titles_url }
      format.json { head :no_content }
    end
  end
end
