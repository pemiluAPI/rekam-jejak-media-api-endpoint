class CreateRekamJejaks < ActiveRecord::Migration
  def change
    create_table :rekam_jejaks do |t|
    	t.integer :paslon_id
    	t.integer :sumber_media_id
    	t.string 	:judul
    	t.string 	:link
    	t.text 	 	:content_media

      t.timestamps
    end
  end
end
