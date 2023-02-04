class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    can :read, :all
    can :create, Comment
    can :create, Post
    can :update, Post, author_id: user.id
    can :delete, Post, author_id: user.id
    can :destroy, Comment, author_id: user.id

    if user.role == 'admin'
      can :manage, :all
    end
  end
end
