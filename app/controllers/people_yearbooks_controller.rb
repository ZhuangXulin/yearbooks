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
      
      case @yearbook.year
      when 'begin_year' then
        @yearbook.year = '年初'
      when 'middle_year' then
        @yearbook.year = '年中'
      when 'end_year' then
        @yearbook.year = '年末'
      when 'spring' then
        @yearbook.year = '春'
      when 'summer' then
        @yearbook.year = '夏'
      when 'fall' then
        @yearbook.year = '秋'
      when 'winter' then
        @yearbook.year = '冬'
      end
      
      case @yearbook.month
      when 'begin_month' then
        @yearbook.month = '月初(上旬)'
      when 'middle_month' then
        @yearbook.month = '月中(中旬)'
      when 'end_month' then
        @yearbook.month = '月末(下旬)'
      end
      
      case @yearbook.day
      when 'midnight' then
        @yearbook.day = '凌晨'
      when 'early_day' then
        @yearbook.day = '早上'
      when 'morning' then
        @yearbook.day = '上午'
      when 'noon' then
        @yearbook.day = '中午'
      when 'afternoon' then
        @yearbook.day = '下午'
      when 'evening' then
        @yearbook.day = '晚上'
      when 'night' then
        @yearbook.day = '夜里'
      end
      
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
        puts('------------')
        puts(people_yearbook_params[:isfuzzydate])
        puts(people_yearbook_params[:year])
        puts(people_yearbook_params[:month])
        puts(people_yearbook_params[:day])
        puts(people_yearbook_params[:pdate])
        
        puts('------------')
        if people_yearbook_params[:isfuzzydate] == "true" then
          @people_yearbook.year = people_yearbook_params[:year]
          @people_yearbook.month = people_yearbook_params[:month]
          @people_yearbook.day = people_yearbook_params[:day]
        else
          @people_yearbook.pdate  = people_yearbook_params[:pdate]
        end
        @people_yearbook.isfuzzydate = people_yearbook_params[:isfuzzydate]
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
    if params[:person_name] != nil
      person_name = params[:person_name].split(/&/)
      if person_name.size == 2
        @people_yearbooks_one = PeopleYearbook.index_contrast(person_name[0])
        @people_yearbooks_two = PeopleYearbook.index_contrast(person_name[1])
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
      params.require(:people_yearbook).permit(:person_id, :pdate, :place, :event_description, :isfuzzydate, :year, :fuzzy_year, :month, :fuzzy_month, :day, :fuzzy_day, :tag, :isfuzzydatequantum, :fuzzy_date_quantum)
    end
end
