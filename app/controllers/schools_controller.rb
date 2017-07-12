class SchoolsController < ApplicationController

  def index
    @schools = School.all
  end

  def show
    @school = School.find(params[:id])
  end

  def new
    @school = School.new
  end

  def create
    @school = School.new(school_params)
    if @school.save
      flash[:success] = I18n.t('schools.notifications.created')
      redirect_to school_path(@school)
    else
      flash[:error] = I18n.t('schools.notifications.invalid')
      render 'new'
    end
  end

  def edit
    @school = School.find(params[:id])
  end

  def update
    @school = School.find(params[:id])
    if @school.update_attributes(school_params)
      flash[:success] = I18n.t('schools.notifications.updated')
      redirect_to school_path(@school)
    else
      flash[:error] = I18n.t('schools.notifications.invalid')
      render 'edit'
    end
  end

  def destroy
    @school = School.find(params[:id])
    if @school.destroy
      flash[:success] = I18n.t('schools.notifications.deleted')
      redirect_to schools_path
    else
      flash[:error] = I18n.t('schools.notifications.invalid')
      render 'show'
    end
  end

  private

  def school_params
    params.require(:school).permit(:name, :location)
  end

end
