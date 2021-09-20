class CreateNums < ActiveRecord::Migration[6.1]
  def change
    create_table :nums do |t|
      t.decimal :number

      t.timestamps
    end
  end
end
