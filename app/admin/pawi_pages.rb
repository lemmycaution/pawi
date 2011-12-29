ActiveAdmin.register Pawi::Page do
  
  menu :parent => "Pawi"
  
  controller do
    cache_sweeper Pawi::Sweeper
  end
  
  index do
    column :id
    column :format    
    column :name, :sortable => :name
    column :created_at, :sortable => :name
    column :updated_at, :sortable => :name
    default_actions
  end
  
  form do |f|
    f.inputs do
      f.input :name
      f.input :format      
      f.input :body
    end
    f.inputs do    
      f.input :widgets, :as => :check_boxes, :collection => Pawi::Widget.all
    end
    
    f.buttons
  end
end