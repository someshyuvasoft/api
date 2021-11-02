class Api::V1::ArticlesController < ApplicationController

  def index
        articles=Article.all
        render json:{status: "success",message:"loaded articles",data:articles},status:  :ok
  end

 def create

   article=Article.new(article_params)
  if article.save
       render json:{status:"success",message:"loaded articles",data:article},status:  :ok
   else
       render json:{status:"failed",message:"Article not save", data:article.errorss},status:  :unprocessable_entity
   end
 end


private

 def article_params
   params.permit(:title,:body)
 end

end