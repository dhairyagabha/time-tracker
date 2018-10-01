class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable, :lockable, :timeoutable, :trackable

  has_one :workspace
  after_create_commit :create_default_workspace


  def projects
    projects = Project.all.where(client_id: self.workspace.clients.map{|c| c.id})
  end

  private
  def create_default_workspace
    workspace_name = self.name.present? ? self.name : self.email.split('@').first
    Workspace.create(name: workspace_name, user: self)
  end

end
