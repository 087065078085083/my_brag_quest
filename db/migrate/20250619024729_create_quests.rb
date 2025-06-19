class CreateQuests < ActiveRecord::Migration[8.0]
  def change
    create_table :quests do |t|
      t.string :title
      t.string :description
      t.boolean :complete, default: false

      t.timestamps
    end
  end
end
