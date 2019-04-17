class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user
  has_many :notifications, dependent: :destroy
  validates :content, presence: true, allow_blank: false

  after_create :broadcast_message
  after_create_commit { notify }

  def from?(some_user)
    user == some_user
  end

  def broadcast_message
    # accessing warden
    # warden is the one managing devise who encrypts your password
    renderer = ::ApplicationController.renderer.new
    renderer_env = renderer.instance_eval { @env }
    warden = ::Warden::Proxy.new(renderer_env, ::Warden::Manager.new(Rails.application))
    renderer_env["warden"] = warden

    ActionCable.server.broadcast("post_#{post.id}", {
      comment_partial: renderer.render(partial: "comments/comment", locals: { comment: self, user_is_comments_author: false }
        ),
      current_user_id: user.id
    })
  end

  # def nice_date
  #   date.strftime("%b %d, %a  %I:%M %p") if date
  # end

  private

  def notify
    if self.user.id != self.post.user.id
      Notification.create(event: "commented on your post", comment_id: self.id, user_id: self.post.user.id)
    end
  end
end
