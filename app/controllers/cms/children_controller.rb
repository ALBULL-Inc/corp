class Cms::ChildrenController < Cms::ApplicationController
  before_action :set_cms_child, only: [:show, :edit, :update, :destroy]

  # GET /cms/children
  # GET /cms/children.json
  def index
    @children = Child.all
  end

  # GET /cms/children/1
  # GET /cms/children/1.json
  def show
  end

  # GET /cms/children/new
  def new
    @child = Child.new
    @child.build_family
  end

  # GET /cms/children/1/edit
  def edit
  end

  # POST /cms/children
  # POST /cms/children.json
  def create
    p_params = cms_child_params
    p_params.delete('family_attributes') if p_params['family_id'].present?
    @child = Child.new(p_params)

    respond_to do |format|
      if @child.save
        format.html { redirect_to [:cms,@child], notice: 'Child was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /cms/children/1
  def update
    respond_to do |format|
      if @child.update(cms_child_params)
        format.html { redirect_to [:cms,@child], notice: 'Child was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /cms/children/1
  # DELETE /cms/children/1.json
  def destroy
    @child.destroy
    respond_to do |format|
      format.html { redirect_to cms_children_url, notice: 'Child was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cms_child
      @child = Child.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cms_child_params
      params.require(:child).permit(
        :family_id, :place_id, :first_name, :first_name_kana, :nickname, :birthday,
        family_attributes: [:title]
      )
    end
end
