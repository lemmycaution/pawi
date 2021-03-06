module Pawi
  class PagesController < ::ApplicationController
    
    # caches_page :show

    def show
      
      response.headers['Cache-Control'] = 'no-cache'
      
      format = "#{request.format.to_sym}"
      format = Pawi.default_format unless Pawi.available_formats.include?(format)

      @page = Page.find_by_slug_and_format(params[:id],format)

      redirect_to '/404' and return if @page.nil? 
      
      respond_to do |format|
        format.html { render :layout => false if request.xhr? }
        format.xml  { render :xml => @page }
        format.json  { render :json => @page }
      end
    end
  
  end
end
