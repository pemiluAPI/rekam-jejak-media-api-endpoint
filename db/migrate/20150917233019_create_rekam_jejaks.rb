class CreateRekamJejaks < ActiveRecord::Migration
  def change
    create_table :rekam_jejaks do |t|
    	t.references :paslon
    	t.references :sumber_media
      t.string  :link
    	t.text 	  :judul
    	t.text 	 	:content_media

      t.timestamps
    end
  end
end
