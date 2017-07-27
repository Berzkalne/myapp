class SubjectsController < ApplicationController

  def index
    @subjects = Subject.all
  end

  def show
    @subject = Subject.find(params[:id])
  end

  def new
    @subject = Subject.new
  end

  def create
    @subject = Subject.new(subject_params)
    if @subject.save
      flash[:success] = I18n.t('subjects.notifications.created')
      redirect_to subject_path(@subject)
    else
      flash[:error] = I18n.t('subjects.notifications.invalid')
      render 'new'
    end
  end

  def edit
    @subject = Subject.find(params[:id])
  end

  def update
    @subject = Subject.find(params[:id])
    if @subject.update_attributes(subject_params)
      flash[:success] = I18n.t('subjects.notifications.updated')
      redirect_to subjects_path
    else
      flash[:error] = I18n.t('subjects.notifications.invalid')
      render 'edit'
    end
  end

  def destroy
    @subject = Subject.find(params[:id])
    if @subject.destroy
      flash[:success] = I18n.t('subjects.notifications.deleted')
      redirect_to subjects_path
    else
      flash[:error] = I18n.t('subjects.notifications.invalid')
      render 'show'
    end
  end

  private

  def subject_params
    params.require(:subject).permit(:name, :room)
  end

end
