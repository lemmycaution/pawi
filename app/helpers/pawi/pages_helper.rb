module Pawi
  module PagesHelper
    
    def render_page(page)
      get_content(page) || ""
    end

    def render_widgets(page)
      buffer = ""    
      widgets = page.widgets.order("position ASC")
      unless widgets.nil?
        widgets.each do |widget|

          buffer << (get_content(widget) || "")

        end
      end
      buffer    
    end

    private

    def get_content(obj)
      unless obj.body.nil?
        
        ERB.new(%{#{obj.body}}.gsub(/^  /, '')).result(binding)
        
        # unless obj.body.index(/render '.*'/).nil?
        
        # unless obj.body.index(/%{render ".*"}/).nil?
        #     split_content = obj.body.split(/%{render ".*"}/)
        #     renders =  obj.body.scan(/%{render ".*"}/)
        #     raw_content = ""
        #     split_content.each_with_index do |s,i|
        #       raw_content = raw_content + s + ( renders[i] ? eval(renders[i].sub("%{","").sub("}","")) : "" )
        #     end
        #     raw raw_content
        #     # raw split_content[0] + eval(obj.body[/%{render ".*"}/].sub("%{","").sub("}","")) + split_content[1]
        #   else
        #     raw obj.body
        #   end
        
      end
    end

  end
end
