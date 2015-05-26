class PeopleYearbooksController < ApplicationController
  before_action :set_people_yearbook, only: [:show, :edit, :update, :destroy]

  # GET /people_yearbooks
  # GET /people_yearbooks.json
  def index
    @people_yearbooks = PeopleYearbook.all
  end

  # GET /people_yearbooks/1
  # GET /people_yearbooks/1.json
  def show
  end

  # GET /people_yearbooks/new
  def new
    @people_yearbook = PeopleYearbook.new
  end

  # GET /people_yearbooks/1/edit
  def edit
  end

  # POST /people_yearbooks
  # POST /people_yearbooks.json
  def create 
    @people_yearbook = PeopleYearbook.new
    person = Person.where(:name => people_yearbook_params[:person_id] )
    respond_to do |format|
      if person[0] == nil
        format.html { render :new }
        format.json { render json: @people_yearbook.errors, status: :unprocessable_entity }
      else
        @people_yearbook.person_id = person[0].id
        @people_yearbook.pdate = people_yearbook_params[:pdate]
        @people_yearbook.place = people_yearbook_params[:place]
        @people_yearbook.event_description = people_yearbook_param[:event_description]
        if @people_yearbook.save
          format.html { redirect_to @people_yearbook, notice: 'People yearbook was successfully created.' }
          format.json { render :show, status: :created, location: @people_yearbook }
        else
          format.html { render :new }
          format.json { render json: @people_yearbook.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PATCH/PUT /people_yearbooks/1
  # PATCH/PUT /people_yearbooks/1.json
  def update
    respond_to do |format|
      if @people_yearbook.update(people_yearbook_params)
        format.html { redirect_to @people_yearbook, notice: 'People yearbook was successfully updated.' }
        format.json { render :show, status: :ok, location: @people_yearbook }
      else
        format.html { render :edit }
        format.json { render json: @people_yearbook.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /people_yearbooks/1
  # DELETE /people_yearbooks/1.json
  def destroy
    @people_yearbook.destroy
    respond_to do |format|
      format.html { redirect_to people_yearbooks_url, notice: 'People yearbook was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_people_yearbook
      @people_yearbook = PeopleYearbook.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def people_yearbook_params
      params[:people_yearbook]
    end
end
