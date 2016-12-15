class ChangeColumnImage < ActiveRecord::Migration[5.0]
  def change
  	change_column  :blogs, :image, :text, :limit => 1073741824
  end
end
