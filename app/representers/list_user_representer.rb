module ListUserRepresenter
  include Roar::Representer::JSON

  property :id
  property :username
  property :created_at
  property :role
  property :avatar

end
