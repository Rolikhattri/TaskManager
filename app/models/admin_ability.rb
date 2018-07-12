class AdminAbility
    include CanCan::Ability

    def initialize(user)

    user ||= User.new # guest user (not logged in)
    can :read, :all
    if user.admin
        can :access, :rails_admin       # only allow admin users to access Rails Admin
        can :read, :dashboard         
        can :manage, :all
    end
    if user.team_lead
        can :access, :rails_admin       # only allow admin users to access Rails Admin
        can :read, :all
        can :manage, Task           # included in :read
    end
  end
end