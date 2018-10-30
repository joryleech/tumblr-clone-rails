class CreateAttachedImage < ActiveRecord::Migration[5.1]
  def change
    create_table :attached_images do |t|
    	t.references :post
    	t.string :url
    end
  end
end
