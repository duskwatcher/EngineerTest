class CreateNumberRunnings < ActiveRecord::Migration[5.2]
  def change
    create_table :number_runnings do |t|
      t.bigint :counter

      t.timestamps
    end
  end
end
