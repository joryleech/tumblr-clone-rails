class CreateTagged < ActiveRecord::Migration[5.1]
  def change
    create_table :taggeds do |t|
    	t.references :post
    	t.string :tag
    end
  end
end
