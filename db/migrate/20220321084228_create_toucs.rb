class CreateToucs < ActiveRecord::Migration[6.1]
  def change
    create_table :toucs do |t|
      t.text :touc

      t.timestamps
    end
  end
end
