require 'representable/json/collection'

module ProductsRepresenter
  include Representable::JSON::Collection

  items extend: ProductRepresenter

end
