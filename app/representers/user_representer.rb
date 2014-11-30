module UserRepresenter
  include Roar::Representer::JSON

  property :id
  property :username
  property :email
  property :created_at
  property :avatar
  property :role
end


# property :user, extend: UserRepresenter
# {id: 1, title: 'asd', user: {username: 'korkeorpekrp'} }

# module UserRepresenter
 # include Roar::Representer::JSON
 #  property :username
# end

  # collection :comments
# {id: 1, title: 'asd', comments: [{id: 1, body: 'comment1'},{},{}]}
