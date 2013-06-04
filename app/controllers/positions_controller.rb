class PositionsController < ApplicationController
  before_filter :authenticate_user!, :except => [:sort]
  # GET /positions
  # GET /positions.json
  def index
    @positions = Position.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @positions }
    end
  end

  # GET /positions/1
  # GET /positions/1.json
  def show
    @position = Position.find(params[:id])
    @dictionary = Dictionary.find(:all)
    @conceptual = @position.responsibilities.find(:all, :order => "r_position", :conditions => {:indicator => 1})
    @implementation = @position.responsibilities.find(:all, :order => "i_position", :conditions => {:indicator => 2})
    @support = @position.responsibilities.find(:all, :order => "s_position", :conditions => {:indicator => 3})
    @compliance = @position.responsibilities.find(:all, :order => "c_position", :conditions => {:indicator => 4})

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @position }
      format.pdf do
        pdf = PositionPdf.new(@position, @dictionary, @conceptual, @implementation, @support, @compliance)
        send_data pdf.render, filename: "JD_#{@position.job_title}",
                                      type: "application/pdf",
                                      disposition: "inline"
      end
    end
  end

  # GET /positions/new
  # GET /positions/new.json
  def new
    @position = Position.new
    @organisational = Dictionary.find(:all, :conditions => {:indicator => 1})
    @functional = Dictionary.find(:all, :conditions => { :indicator => 2 })
    @method = Dictionary.find(:all, :conditions => { :indicator => 3 })
    @leadership = Dictionary.find(:all, :conditions => { :indicator => 4 })
    @social = Dictionary.find(:all, :conditions => { :indicator => 5 })

    1.times { @position.organisationals.build }

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @position }
    end
  end

  # GET /positions/1/edit
  def edit
    @position = Position.find(params[:id])
    @conceptual = @position.responsibilities.find(:all, :order => "r_position", :conditions => { :indicator => 1})
    @implementation = @position.responsibilities.find(:all, :conditions => { :indicator => 2})
    @support = @position.responsibilities.find(:all, :conditions => { :indicator => 3})
    @compliance = @position.responsibilities.find(:all, :conditions => { :indicator => 4})
    @organisational = Dictionary.find(:all, :conditions => {:indicator => 1})
    @functional = Dictionary.find(:all, :conditions => { :indicator => 2 })
    @method = Dictionary.find(:all, :conditions => { :indicator => 3 })
    @leadership = Dictionary.find(:all, :conditions => { :indicator => 4 })
    @social = Dictionary.find(:all, :conditions => { :indicator => 5 })
  end

  # POST /positions
  # POST /positions.json
  def create
    @position = Position.new(params[:position])

    respond_to do |format|
      if @position.save
        Activity.create(content: "#{@position.job_title}", action: "created", office: "#{@position.office}", user_name: "#{@position.user_name}", link: "#{@position.id}")
        format.html { redirect_to @position, notice: 'Position was successfully created.' }
        format.json { render json: @position, status: :created, location: @position }
      else
        format.html { render action: "new" }
        format.json { render json: @position.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /positions/1
  # PUT /positions/1.json
  def update
    @position = Position.find(params[:id])

    respond_to do |format|
      if params[:sign_button]
        @position.update_attributes(params[:position])
        Activity.create(content: "#{@position.job_title}", action: "signed off", office: "#{@position.office}", user_name: "#{@position.user_name}", link: "#{@position.id}")
        format.html { redirect_to positions_path, notice: 'Position was successfully signed off and added to the database. Nice job!' }
        format.json { head :no_content }
      elsif params[:pdf_button]
        @position.update_attributes(params[:position])
          format.html { redirect_to @position }
          format.json { head :no_content }
      elsif params[:session_button]
        @position.update_attributes(params[:position])
          format.html { redirect_to edit_position_path(@position) }
          format.json { head :no_content }
      else
        if @position.update_attributes(params[:position])
          Activity.create(content: "#{@position.job_title}", action: "updated", office: "#{@position.office}", user_name: "#{@position.user_name}", link: "#{@position.id}")
          format.html { redirect_to @position, notice: 'Position was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: "edit" }
          format.json { render json: @position.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # DELETE /positions/1
  # DELETE /positions/1.json
  def destroy
    @position = Position.find(params[:id])
    Activity.create(content: "#{@position.job_title}", action: "deleted", office: "#{@position.office}", user_name: "#{@position.user_name}", link: "#{@position.id}")
    @position.destroy

    respond_to do |format|
      format.html { redirect_to positions_url }
      format.json { head :no_content }
    end
  end

  def steal
    @position = Position.find(params[:id])
    @conceptual = @position.responsibilities.find(:all, :conditions => { :indicator => 1})
    @implementation = @position.responsibilities.find(:all, :conditions => { :indicator => 2})
    @support = @position.responsibilities.find(:all, :conditions => { :indicator => 3})
    @compliance = @position.responsibilities.find(:all, :conditions => { :indicator => 4})
    @functional = Dictionary.find(:all, :conditions => { :indicator => 2 })
    @method = Dictionary.find(:all, :conditions => { :indicator => 3 })
    @leadership = Dictionary.find(:all, :conditions => { :indicator => 4 })
    @social = Dictionary.find(:all, :conditions => { :indicator => 5 })
  end

  def updatesteal
    @position = Position.find(params[:id]).amoeba_dup

    respond_to do |format|
      if @position.save
        Activity.create(content: "#{@position.job_title}", action: "stolen", office: "#{@position.office}", user_name: "#{@position.user_name}", link: "#{@position.id}")
        format.html { redirect_to steal_position_path(@position), notice: 'Position was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @position.errors, status: :unprocessable_entity }
      end
    end
  end

  def sign
    @position = Position.find(params[:id])
  end

  def internal
    @position = Position.find(params[:id])
    @dictionary = Dictionary.find(:all)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @position }
      format.xlsx
    end
  end

  def editpdf
    @position = Position.find(params[:id])
    @conceptual = @position.responsibilities.find(:all, :conditions => { :indicator => 1})
    @implementation = @position.responsibilities.find(:all, :conditions => { :indicator => 2})
    @support = @position.responsibilities.find(:all, :conditions => { :indicator => 3})
    @compliance = @position.responsibilities.find(:all, :conditions => { :indicator => 4})
    @functional = Dictionary.find(:all, :conditions => { :indicator => 2 })
    @method = Dictionary.find(:all, :conditions => { :indicator => 3 })
    @leadership = Dictionary.find(:all, :conditions => { :indicator => 4 })
    @social = Dictionary.find(:all, :conditions => { :indicator => 5 })
  end

  def csort
    params[:responsibility].each_with_index do |id, index|
      Responsibility.update_all({r_position: index+1}, {id: id})
    end
    @position = Position.find(params[:id])
    respond_to do |format|
      format.html { redirect_to @position }
      format.json { head :no_content }
    end
  end

  def isort
    params[:responsibility].each_with_index do |id, index|
      Responsibility.update_all({i_position: index+1}, {id: id})
    end
    @position = Position.find(params[:id])
    respond_to do |format|
      format.html { redirect_to @position }
      format.json { head :no_content }
    end
  end

  def ssort
    params[:responsibility].each_with_index do |id, index|
      Responsibility.update_all({s_position: index+1}, {id: id})
    end
    @position = Position.find(params[:id])
    respond_to do |format|
      format.html { redirect_to @position }
      format.json { head :no_content }
    end
  end

  def comsort
    params[:responsibility].each_with_index do |id, index|
      Responsibility.update_all({c_position: index+1}, {id: id})
    end
    @position = Position.find(params[:id])
    respond_to do |format|
      format.html { redirect_to @position }
      format.json { head :no_content }
    end
  end

  def fsort
    params[:functional].each_with_index do |id, index|
      Functional.update_all({f_position: index+1}, {id: id})
    end
    @position = Position.find(params[:id])
    respond_to do |format|
      format.html { redirect_to @position }
      format.json { head :no_content }
    end
  end

  def msort
    params[:methodrelation].each_with_index do |id, index|
      Methodrelation.update_all({m_position: index+1}, {id: id})
    end
    @position = Position.find(params[:id])
    respond_to do |format|
      format.html { redirect_to @position }
      format.json { head :no_content }
    end
  end

  def socsort
    params[:social].each_with_index do |id, index|
      Social.update_all({s_position: index+1}, {id: id})
    end
    @position = Position.find(params[:id])
    respond_to do |format|
      format.html { redirect_to @position }
      format.json { head :no_content }
    end
  end

  def lsort
    params[:leadership].each_with_index do |id, index|
      Leadership.update_all({l_position: index+1}, {id: id})
    end
    @position = Position.find(params[:id])
    respond_to do |format|
      format.html { redirect_to @position }
      format.json { head :no_content }
    end
  end

  def asort
    params[:attitude].each_with_index do |id, index|
      Attitude.update_all({a_position: index+1}, {id: id})
    end
    @position = Position.find(params[:id])
    respond_to do |format|
      format.html { redirect_to @position }
      format.json { head :no_content }
    end
  end

  def consort
    params[:condition].each_with_index do |id, index|
      Condition.update_all({c_position: index+1}, {id: id})
    end
    @position = Position.find(params[:id])
    respond_to do |format|
      format.html { redirect_to @position }
      format.json { head :no_content }
    end
  end
end
