module Blog
    class PostsController < BlogController

      # GET /posts
      # GET /posts.json
      def index
       @posts = stroage.list_for(params[:page], params[:tag])
      end
    
      # GET /posts/1
      # GET /posts/1.json
      def show
             @post = stroage.friendly.find(params[:id])
      end
      
        
    before_action :set_locale
    def set_locale
      I18n.locale=params[:locale]||I18n.default_locale
    end
    
      private
      
      def stroage
          Post.yayinlanma
      end
    
    end
end