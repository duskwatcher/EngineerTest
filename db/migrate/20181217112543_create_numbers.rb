class CreateNumbers < ActiveRecord::Migration[5.2]
  def change
    create_table :numbers do |t|
      t.bigint :value

      t.timestamps
    end
  end
end
