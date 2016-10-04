class MailClassification < ActiveRecord::Base

  belongs_to :created_by, class_name: 'User', foreign_key: 'created_by_id'
  belongs_to :updated_by, class_name: 'User', foreign_key: 'updated_by_id'
                      
  validates :code, 				:presence => true
  validates :name, 				:presence => true
  validates :description, :presence => true

  def to_s
    self.name  
  end
end
