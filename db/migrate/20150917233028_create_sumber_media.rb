class CreateSumberMedia < ActiveRecord::Migration
  def change
    create_table :sumber_media do |t|
    	t.string :link

      t.timestamps
    end
  end
end
