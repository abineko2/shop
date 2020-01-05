module ApplicationHelper
    def page(str)
        text = "ページ"
        str = blank? ? str : text + "#{str}"
     end  
end
