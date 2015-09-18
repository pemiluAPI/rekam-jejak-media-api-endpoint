class CreatePaslons < ActiveRecord::Migration
  def change
    create_table :paslons do |t|
    	t.string :nama_calon
    	t.string :nama_wakil_calon
    	t.string :qwords

      t.timestamps
    end
  end
end
