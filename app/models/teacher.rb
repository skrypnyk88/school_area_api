class Teacher < User
  has_and_belongs_to_many :groups, foreign_key: 'user_id'
  has_one :attachment, as: :attachable, dependent: :destroy
end
