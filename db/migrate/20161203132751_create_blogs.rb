class CreateBlogs < ActiveRecord::Migration[5.0]
  def change
    create_table :blogs do |t|
      t.string :title
      t.string :description
      t.belongs_to :user, index: true
      t.timestamps
    end
  end
end
