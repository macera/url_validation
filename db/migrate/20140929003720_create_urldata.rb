class CreateUrldata < ActiveRecord::Migration
  def change
    create_table :urldata do |t|
      t.string :url
      t.string :text

      t.timestamps
    end
  end
end
