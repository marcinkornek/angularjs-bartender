module ListUserRepresenter
  include Roar::Representer::JSON

  property :id
  property :username
  property :created_at
  property :avatar

end
