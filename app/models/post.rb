class Post < ActiveRecord::Base
  mount_uploader :attachment, AttachmentUploader
  acts_as_taggable
  acts_as_punchable

  has_many :comments, dependent: :destroy
  belongs_to :user


  validates :content , :presence => true,
                        :length => { minimum: 2 }

  validates :user_id, presence: true


end
