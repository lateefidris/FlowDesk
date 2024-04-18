class ServicesController < ApplicationController
  before_action :set_service, only: %i[ show edit update destroy ]
  before_action :set_categories, only: [:new, :edit, :create, :update]

  # GET /services or /services.json
  def index
    @services = Service.all
  end

  # GET /services/1 or /services/1.json
  def show
  end

  # GET /services/new
  def new
    @service = Service.new
  end

  # GET /services/1/edit
  def edit
  end

  # POST /services or /services.json
  def create
    @service = Service.new(service_params)

    respond_to do |format|
      if @service.save
        format.html { redirect_to service_url(@service), notice: "Service was successfully created." }
        format.json { render :show, status: :created, location: @service }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @service.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /services/1 or /services/1.json
  def update
    respond_to do |format|
      if @service.update(service_params.except(:images))
        attach_new_images(params[:service][:images]) if params[:service][:images]

        if params[:service][:images_to_delete]
          purge_images(params[:service][:images_to_delete])
        end

        format.html { redirect_to service_url(@service), notice: "Service was successfully updated." }
        format.json { render :show, status: :ok, location: @service }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @service.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /services/1 or /services/1.json
  def destroy
    @service.destroy

    respond_to do |format|
      format.html { redirect_to services_url, notice: "Service was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_service
      @service = Service.find(params[:id])
    end

    def set_categories
      # Assuming you have a way to identify the current user's desk
      # and that the Desk has a 'categories' association.
      @categories = current_user.desks.categories if current_user&.desks
    end

    # Only allow a list of trusted parameters through.
    def service_params
      params.require(:service).permit(:name, :description, :price, :time_in_minutes, :category_id, images: [], images_to_delete: [])
    end

    def attach_new_images(images)
      images.each do |image|
        @service.images.attach(image)
      end
    end

    def purge_images(image_ids)
      image_ids.each do |image_id|
        image = @service.images.find_by(id: image_id)
        image.purge if image
      end
    end
end
