class Role < ActiveRecord::Base
  has_and_belongs_to_many :users, :join_table => :users_roles
  belongs_to :resource, :polymorphic => true

  validates :resource_type,
            :inclusion => { :in => Rolify.resource_types },
            :allow_nil => true

  scopify
  def self.user
    self.possible_roles[0]
  end
  def self.fachschaft
    self.possible_roles[1]
  end
  def self.manager
    self.possible_roles[2]
  end
  def self.admin
    self.possible_roles[3]
  end

  #Our possible roles array
  def self.possible_roles
    ["User", "Fachschaft","Manager","Admin"]
  end
  #Gets the role models
  def self.get_roles
    Role.all.limit(6)
  end
  #Gets the name of the role. A bit of Java love :)
  def to_string
    self.name
  end
end
