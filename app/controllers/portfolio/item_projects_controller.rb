require_dependency "portfolio/application_controller"

module Portfolio
  class ItemProjectsController < ApplicationController
    before_action :set_item_project, only: [:show, :edit, :update, :destroy]
    before_action :set_item
    before_action Portfolio.auth_action

    layout 'portfolio/admin'

    # GET /item_projects
    def index
      @item_projects = @item.item_projects.all
    end

    # GET /item_projects/1
    def show
    end

    # GET /item_projects/new
    def new
      @item_project = ItemProject.new item: @item
    end

    # GET /item_projects/1/edit
    def edit
      @image = ItemProjectImage.new item_project: @item_project
    end

    # POST /item_projects
    def create
      @item_project = ItemProject.new(item_project_params)

      if @item_project.save
        redirect_to item_item_projects_path(@item), notice: 'Item project was successfully created.'
      else
        render :new
      end
    end

    # PATCH/PUT /item_projects/1
    def update
      if @item_project.update(item_project_params)
        redirect_to item_item_projects_path(@item), notice: 'Item project was successfully updated.'
      else
        render :edit
      end
    end

    # DELETE /item_projects/1
    def destroy
      @item_project.destroy
      redirect_to item_item_projects_path, notice: 'Item project was successfully destroyed.'
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_item_project
        @item_project = ItemProject.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def item_project_params
        params.require(:item_project).permit(:item_id, :name, :description, :url)
      end

      def set_item
        @item = Item.find params[:item_id]
      end
  end
end
