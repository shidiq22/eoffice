class Admin::MailClassificationsController < Admin::BaseController

  helper_method :sort_column, :sort_direction, :search_params

  before_filter :only => [:new, :create, :edit, :update, :show, :destroy]

  def index
    @q = MailClassification.search(params[:q])
    search_relation = @q.result
    @mail_classifications = search_relation.order(sort_column + " " + sort_direction).references(:mail_classification).page params[:page]
  end

  def new
    @mail_classification = MailClassification.new
  end

  def create
    @mail_classification = MailClassification.new(mail_classification_params)
    if @mail_classification.save
      redirect_to admin_mail_classifications_path, :notice => "MailClassification successfully created."
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @mail_classification.update_attributes(params[:mail_classification].permit(:email))
      redirect_to admin_mail_classifications_path, :notice => "MailClassification successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @mail_classification.destroy
    redirect_to admin_mail_classifications_path, :notice => "MailClassification deleted."
  end

  private

  def mail_classification_params  
    params.require(:mail_classification).permit(:code, :name, :description)
  end

  def sort_column
    MailClassification.column_names.include?(params[:sort]) ? params[:sort] : "name"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end

  def search_params
    { :search => params[:search] }
  end

end
