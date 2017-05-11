class Attachment < ApplicationRecord
  belongs_to :attachable, polymorphic: true

  has_attached_file :file,
                    styles: {
                      thumb: '150x150#'
                    }

  validates_attachment :file,
                       presence: true,
                       content_type: {
                         content_type: ['image/jpeg', 'image/gif', 'image/png']
                       },
                       size: { in: 0..5.megabytes }
end
