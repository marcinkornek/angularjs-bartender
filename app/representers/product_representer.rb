module ProductRepresenter
  include Roar::Representer::JSON

  property :id
  property :name
  property :description
  property :image
  property :category
  property :size_type
  collection :product_details

end


# property :user, extend: UserRepresenter
# {id: 1, title: 'asd', user: {username: 'korkeorpekrp'} }

# module UserRepresenter
 # include Roar::Representer::JSON
 #  property :username
# end

  # collection :comments
# {id: 1, title: 'asd', comments: [{id: 1, body: 'comment1'},{},{}]}
