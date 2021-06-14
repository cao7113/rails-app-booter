Trestle.resource(:notes) do
  menu do
    item :notes, icon: "fa fa-star"
  end

  # Customize the table columns shown on the index view.
  table do
    column :id
    column :title
    column :body
    column :publish_at, align: :center
    column :created_at, align: :center
    actions
  end

  # Customize the form fields shown on the new/edit views.
  form do |note|
    text_field :title
    text_area :body, cols: 10
    datetime_field :publish_at
  
    row do
      col { static_field :created_at }
      col { static_field :updated_at }
    end
  end

  # By default, all parameters passed to the update and create actions will be
  # permitted. If you do not have full trust in your users, you should explicitly
  # define the list of permitted parameters.
  #
  # For further information, see the Rails documentation on Strong Parameters:
  #   http://guides.rubyonrails.org/action_controller_overview.html#strong-parameters
  #
  # params do |params|
  #   params.require(:note).permit(:name, ...)
  # end
end
