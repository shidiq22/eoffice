class CreateMailClassifications < ActiveRecord::Migration
  def change
    create_table :mail_classifications do |t|
      t.string :code
      t.string :name
      t.text :description
      
      # track user
      t.references :created_by
      t.references :updated_by

      t.timestamps
    end
    add_index :mail_classifications, :created_by_id
    add_index :mail_classifications, :updated_by_id 
  end
end
