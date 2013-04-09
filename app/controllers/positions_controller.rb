class PositionsController < ApplicationController
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
    @conceptual = @position.responsibilities.find(:all, :conditions => {:indicator => 1})
    @implementation = @position.responsibilities.find(:all, :conditions => {:indicator => 2})
    @support = @position.responsibilities.find(:all, :conditions => {:indicator => 3})
    @compliance = @position.responsibilities.find(:all, :conditions => {:indicator => 4})

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @position }
    end
  end

  # GET /positions/new
  # GET /positions/new.json
  def new
    @position = Position.new
    @functional = Dictionary.find(:all, :conditions => { :indicator => 2 })
    @method = Dictionary.find(:all, :conditions => { :indicator => 3 })
    @leadership = Dictionary.find(:all, :conditions => { :indicator => 4 })
    @social = Dictionary.find(:all, :conditions => { :indicator => 5 })

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @position }
    end
  end

  # GET /positions/1/edit
  def edit
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

  # POST /positions
  # POST /positions.json
  def create
    @position = Position.new(params[:position])

    respond_to do |format|
      if @position.save
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
      if @position.update_attributes(params[:position])
        format.html { redirect_to @position, notice: 'Position was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @position.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /positions/1
  # DELETE /positions/1.json
  def destroy
    @position = Position.find(params[:id])
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
        format.html { redirect_to steal_position_path(@position), notice: 'Position was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @position.errors, status: :unprocessable_entity }
      end
    end
  end
end
