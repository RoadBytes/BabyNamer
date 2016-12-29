# This models users/people of the app
class User < ActiveRecord::Base
  validates :email, presence: true
  has_many  :baby_names
  has_many  :comments, as: :commentable
  has_many  :votes

  has_attached_file :profile_pic,
                    styles: { medium: '300x300>',
                              thumb: '100x100>' },
                    default_url: '/images/:style/missing.png'
  validates_attachment :profile_pic,
                       content_type: {
                         content_type: [
                           'image/jpeg', 'image/png',
                           'image/gif', 'image/jpg'
                         ]
                       },
                       size: { in: 0..2.megabytes }

  has_secure_password

  def handle
    name.blank? ? email : name
  end

  def received_comments
    comments.order('created_at DESC')
  end
end
