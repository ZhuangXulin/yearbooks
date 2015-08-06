#encoding:UTF-8
class PeopleYearbooksController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_people_yearbook, only: [:show, :edit, :update, :destroy]

  # GET /people_yearbooks
  # GET /people_yearbooks.json
  def index
    @people_yearbooks = PeopleYearbook.index(params[:page],params[:person_name])
    @person_name = params[:person_name]
  end

  # GET /people_yearbooks/1
  # GET /people_yearbooks/1.json
  def show
    people_yearbook = PeopleYearbook.show(params[:id])
    if people_yearbook.count > 0
      @yearbook = people_yearbook[0]
    else
      @yearbook = nil
    end
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
    @people_yearbook = PeopleYearbook.new(people_yearbook_params)
    person = Person.where(:name => params[:person_name])
    respond_to do |format|
      if person[0] == nil
        @notice = 'There is no people name.'
        format.html { render :new }
        format.json { render json: @people_yearbook.errors, status: :unprocessable_entity }
      else
        @people_yearbook.event_date = people_yearbook_params[:event_date]
        @people_yearbook.person_id = person[0].id
        @people_yearbook.place = people_yearbook_params[:place]
        @people_yearbook.event_description = people_yearbook_params[:event_description]
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


  #对比两份年谱
  def contrast
      #if params[:person_name] != nil
      #person_name = params[:person_name].split(/&/)
      #if person_name.size == 2
      #  @person_name_one = person_name[0]
      #  @person_name_two = person_name[1]
      #  @people_yearbooks_one = PeopleYearbook.index_contrast(person_name[0])
      #  @people_yearbooks_two = PeopleYearbook.index_contrast(person_name[1])
      #end
      #end
      @person_name_one = params[:person_name_one]
      @person_name_two = params[:person_name_two]
      if @person_name_one != nil
        @people_yearbooks_one = PeopleYearbook.index_contrast(@person_name_one)
      end
      if @person_name_two != nil
        @people_yearbooks_two = PeopleYearbook.index_contrast(@person_name_two)
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
      params.require(:people_yearbook).permit(:person_id, :event_date, :place, :event_description, :tag, :photo)
    end
end
