ActiveAdmin.register Pawi::Widget do
  
  menu :parent => "Pawi"
  
  controller do
    cache_sweeper Pawi::Sweeper
  end
  
  index do
    column :id
    column :name, :sortable => :name
    column :created_at, :sortable => :name
    column :updated_at, :sortable => :name
    default_actions
  end
  
  form do |f|
    f.inputs do
      f.input :name
      f.input :body      
      f.input :position       
    end
    f.inputs do    
      f.input :pages, :as => :check_boxes, :collection => Pawi::Page.all
    end
    
    f.buttons
  end  
end
