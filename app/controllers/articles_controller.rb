class ArticlesController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  MAX_IMAGE = 2 * 1024 * 1024
  # GET /articles
  # GET /articles.json
  def index
    @articles = Article.paginate(:page  =>  params[:page],  :per_page =>  10)
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
  end

  # GET /articles/new
  def new
    @article = Article.new
    select_option
  end

  # GET /articles/1/edit
  def edit
    select_option
  end

  def select_option
    @article_type = $ARTICLE_TYPE
  end
  # POST /articles
  # POST /articles.json
  def create
    @article = Article.new(article_params)
    @article.user_id = current_user.id
    @article.article_type = params["article_type"].to_i
    @article.aritle_read_times = 0
    respond_to do |format|
      if @article.save
        format.html { redirect_to @article, notice: 'Article was successfully created.' }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /articles/1
  # PATCH/PUT /articles/1.json
  def update
    params["article"]["article_type"] = params["article_type"]
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to @article, notice: 'Article was successfully updated.' }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    @article.destroy
    respond_to do |format|
      format.html { redirect_to articles_url, notice: 'Article was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def upload_image
    file = params["imageData"]
    success = true
    msg = "image_upload_success"
    file_real_path = ''
    unless file.content_type.match(/^image\/(gif|png||jpg||jpeg|){1}$/)
      success = false
      msg = "#{file.original_filename}:只支持上传JPG,JPEG,PNG格式图片"
    end
    if file.size > MAX_IMAGE
      success = false
      msg = "#{file.original_filename}:图片太大，请上传小于2M的图片"
    end    
    file_real_path = save_file(file) if success
    #logger.info file_real_path
    render json: {:success=>success, :msg=>msg, :file_path=>"/#{file_real_path}" }
  end

  private
  # def content_type
  #   split(".")[1].to_S
  # end
  def save_file(file)
    extname = file.content_type.match(/^image\/(gif|png|jpg|jpeg){1}$/).to_a[1]
    filename = File.basename(file.original_filename,'.*')
    uri = File.join('uploads','images',"#{DateTime.now.strftime('%Y/%m%d/%H%M%S')}_#{SecureRandom.hex(4)}_#{current_user.id}.#{extname}")
    save_path = Rails.root.join('public',uri)
    file_dir = File.dirname(save_path)
 
    FileUtils.mkdir_p(file_dir) unless Dir.exists?(file_dir)
    File.open save_path, 'wb' do |f|
      f.write(file.read)
    end
    return uri
  end
  # Use callbacks to share common setup or constraints between actions.
  def set_article
    @article = Article.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def article_params
    params.require(:article).permit(:article_title, :article_type, :article_content, :aritle_read_times, :user_id)
  end
end
