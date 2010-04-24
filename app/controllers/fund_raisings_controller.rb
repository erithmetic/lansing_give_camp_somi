class FundRaisingsController < ApplicationController
  before_filter :require_user
  before_filter :require_admin

  # GET /fund_raisings
  # GET /fund_raisings.xml
  def index
    @fund_raisings = FundRaising.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @fund_raisings }
    end
  end

  # GET /fund_raisings/1
  # GET /fund_raisings/1.xml
  def show
    @fund_raising = FundRaising.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @fund_raising }
    end
  end

  # GET /fund_raisings/new
  # GET /fund_raisings/new.xml
  def new
    @fund_raising = FundRaising.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @fund_raising }
    end
  end

  # GET /fund_raisings/1/edit
  def edit
    @fund_raising = FundRaising.find(params[:id])
  end

  # POST /fund_raisings
  # POST /fund_raisings.xml
  def create
    @fund_raising = FundRaising.new(params[:fund_raising])

    respond_to do |format|
      if @fund_raising.save
        flash[:notice] = 'FundRaising was successfully created.'
        format.html { redirect_to(@fund_raising) }
        format.xml  { render :xml => @fund_raising, :status => :created, :location => @fund_raising }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @fund_raising.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /fund_raisings/1
  # PUT /fund_raisings/1.xml
  def update
    @fund_raising = FundRaising.find(params[:id])

    respond_to do |format|
      if @fund_raising.update_attributes(params[:fund_raising])
        flash[:notice] = 'FundRaising was successfully updated.'
        format.html { redirect_to(@fund_raising) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @fund_raising.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /fund_raisings/1
  # DELETE /fund_raisings/1.xml
  def destroy
    @fund_raising = FundRaising.find(params[:id])
    @fund_raising.destroy

    respond_to do |format|
      format.html { redirect_to(fund_raisings_url) }
      format.xml  { head :ok }
    end
  end
end
