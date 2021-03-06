class Usuario < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  validates_presence_of :nombre
  validates_presence_of :apellido
  validates_presence_of :fecha_de_nacimiento
  validate :validar_edad

  has_many :favors, dependent: :destroy
  has_many :postulacions, dependent: :destroy

  def esta_postulado?(favor)
    return false unless self.postulacions.any?
    favors = self.postulacions.map(&:favor)
    favors.include?(favor)
  end

  private

  def validar_edad
      if fecha_de_nacimiento.present? && fecha_de_nacimiento >= 18.years.ago
          errors.add(:fecha_de_nacimiento, 'Debes ser mayor de 18 años.')
      end
  end
 
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

end