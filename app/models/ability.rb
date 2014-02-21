class Ability
  include CanCan::Ability

  def initialize(user)

      user ||= User.new # guest user (not logged in)

      entities = [User, MobileDevice, MobileUser, BlockLaboratory]
      
      if user.has_role? :admin
        can :manage, :all
      elsif user.has_role? :block
        can :manage, entities
       
      end
  end
end
