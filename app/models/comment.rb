class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user
  has_many :notifications
  validates :content, presence: true, allow_blank: false

  after_create :broadcast_message
  after_create_commit { notify }

  def from?(some_user)
    user == some_user
  end

  def broadcast_message
    ActionCable.server.broadcast("post_#{post.id}", {
      comment_partial: ApplicationController.renderer.render(partial: "comments/comment", locals: { comment: self, user_is_comments_author: false }
        ),
      current_user_id: user.id
    })
  end

  # def nice_date
  #   date.strftime("%b %d, %a  %I:%M %p") if date
  # end

  private

  def notify
    Notification.create(event: "commented on your post", comment_id: self.id, user_id: self.post.user.id)
  end
end
