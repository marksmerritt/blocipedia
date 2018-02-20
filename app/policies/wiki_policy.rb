class WikiPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      wikis_to_return = []
      if user.nil? || user.standard?
        wikis_to_return = scope.where(private: false)
      elsif user.admin? 
        wikis_to_return = scope.all
      else 
        all_wikis = scope.all
        all_wikis.each do |wiki|
          if wiki.private == false || wiki.user == user
            wikis_to_return << wiki
          end
        end
      end
      wikis_to_return
    end
  end
end