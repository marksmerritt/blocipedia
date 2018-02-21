class WikiPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      wikis = []
      if user.role == "admin"
        wikis = scope.all
      elsif user.role == "premium"
        all_wikis = scope.all 
        all_wikis.each do |wiki|
          if wiki.public? || wiki.user == user || wiki.users.include?(user)
            wikis << wiki
          end
        end
      else
        all_wikis = scope.all 
        wikis = []
        all_wikis.each do |wiki|
          if !wiki.private? || wiki.users.include?(user)
            wikis << wiki
          end
        end
      end
      wikis
    end
  end
end