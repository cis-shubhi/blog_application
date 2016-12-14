class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.references :user
      t.references :blog
      t.boolean    :status, default: false
      t.timestamps
    end
  end
end
