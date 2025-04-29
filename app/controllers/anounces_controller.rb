class AnouncesController < ApplicationController
  include ImageRemovable
  
  before_action :set_anounce, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :remove_images, only: [:update]

  # GET /anounces
  def index
  @anounces = Anounce.all
  
  # Apply filters if present
 @anounces = @anounces.where("LOWER(title) LIKE ? OR LOWER(description) LIKE ?", "%#{params[:search].downcase}%", "%#{params[:search].downcase}%") if params[:search].present?

  @anounces = @anounces.where(category_id: params[:category_id]) if params[:category_id].present?
  @anounces = @anounces.where(city_id: params[:city_id]) if params[:city_id].present?
  @anounces = @anounces.where("price >= ?", params[:min_price]) if params[:min_price].present?
  @anounces = @anounces.where("price <= ?", params[:max_price]) if params[:max_price].present?
  
  # Apply sorting
  case params[:sort]
  when "price_asc"
    @anounces = @anounces.order(price: :asc)
  when "price_desc"
    @anounces = @anounces.order(price: :desc)
  else
    @anounces = @anounces.order(created_at: :desc) # Default to newest
  end
  
  # Paginate the results
  @anounces = @anounces.page(params[:page]).per(24) # Show 24 announcements per page
  
  # Group announcements by category for the category sections
  if !params[:search].present? && !params[:category_id].present? && !params[:city_id].present? && !params[:min_price].present? && !params[:max_price].present?
    @anounces_by_category = {}
    Category.all.each do |category|
      @anounces_by_category[category.id] = Anounce.where(category_id: category.id)
                                                 .order(created_at: :desc)
                                                 .limit(8) # Show up to 8 announcements per category
    end
  end
end

  # GET /anounces/1
  def show
    @related_anounces = Anounce.where(category_id: @anounce.category_id)
                              .where.not(id: @anounce.id)
                              .limit(4)
  end

  # GET /anounces/new
  def new
    @anounce = Anounce.new
  end

  # GET /anounces/1/edit
  def edit
    authorize_user!
  end

  # POST /anounces
  def create
    @anounce = Anounce.new(anounce_params)
    @anounce.user_id = current_user.id

    if @anounce.save
      redirect_to @anounce, notice: 'Anounce was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /anounces/1
  def update
    authorize_user!
    
    if @anounce.update(anounce_params)
      redirect_to @anounce, notice: 'Anounce was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /anounces/1
  def destroy
    authorize_user!
    @anounce.destroy
    redirect_to anounces_url, notice: 'Anounce was successfully destroyed.'
  end

  def mes_anounces
    @anounces = current_user.anounces.with_attached_images.order(created_at: :desc)
    @page_title = "Mes Annonces"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_anounce
      @anounce = Anounce.find(params[:id])
    end



    # Only allow a list of trusted parameters through.
    def anounce_params
      params.require(:anounce).permit(:title, :description, :price, :city_id, :category_id, images: [])
    end
    
    # Ensure the current user is the owner of the anounce
    def authorize_user!
      unless @anounce.user_id == current_user.id
        redirect_to anounces_path, alert: "You are not authorized to perform this action."
      end
    end

    def remove_images
      if params[:anounce][:remove_images].present?
        params[:anounce][:remove_images].each do |image_id|
          image = ActiveStorage::Attachment.find(image_id)
          image.purge
        end
        params[:anounce].delete(:remove_images)
      end
    end
end