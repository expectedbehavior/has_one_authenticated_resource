class CreateOtherModels < ActiveRecord::Migration
  def self.up
    create_table :other_models do |t|
      t.integer  :account_id
      t.integer  :tracker_project_id
      t.string   :note
      t.timestamps
    end
  end

  def self.down
    drop_table :other_models
  end
end
