class Compra < ActiveRecord::Base
	default_scope -> { order("created_at desc") }
	
	belongs_to :usuario
end
