class Favor < ActiveRecord::Base
	belongs_to :usuario

	default_scope -> { order("created_at desc") }
	scope :titulo, -> (titulo) { where("lower(titulo) like ?", "%#{titulo.downcase}%")}
  	scope :ubicacion, -> (ubicacion) { where ubicacion: ubicacion }

	has_many :postulacions, dependent: :destroy
	has_many :comentarios, dependent: :destroy

	def self.filtrar(resueltas,ubicacion,titulo)
		if ( resueltas.present? )
			if resueltas
				favores = Favor.all
			end
		else
			favores = Favor.where resuelta: false
		end
  		favores = favores.ubicacion(ubicacion) if ubicacion.present?
  		favores = favores.titulo(titulo) if titulo.present?
  		return favores

	end

	def tiene_elegido?
		postus = self.postulacions
		postus.each do |p|
			if p.elegido
				return true
			end
		end
		return false
	end

	def get_elegido
		p = self.postulacions.where(elegido: true)
		p.each do |pp|
			if pp.favor_id == self.id
				return pp.usuario_id
			end
			return 0
		end
	end

	def resolver
		self.resuelta = true
		self.postulacions.where(elegido: false).destroy_all
		user = Usuario.find(self.get_elegido)
		user.puntos = user.puntos + 1
		user.save
		self.save
	end
	def no_resolver
		self.resuelta = false
		user = Usuario.find(self.get_elegido)
		user.puntos = user.puntos - 1
		user.save
		Postulacion.where(favor_id: self.id, usuario_id: user.id).destroy_all
		self.save
	end
end
