class WikiPolicy < ApplicationPolicy
  attr_reader :user, :wiki

  def initialize(user, wiki)
    @user = user
    @wiki = wiki
  end

  def index?
    true
  end

  def show?
    !wiki.private || wiki.user == user || !Collaborator.where(user_id: user.id, wiki_id: wiki.id).empty?
  end

  def create?
    user.present?
  end

  def new?
    create?
  end

  def update?
    user.admin? || wiki.user == user || !Collaborator.where(user_id: user.id, wiki_id: wiki.id).empty?
  end

  def edit?
    update?
  end

  def destroy?
    user.admin? || wiki.user == user
  end

  class Scope < Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      scope
    end
  end
end
