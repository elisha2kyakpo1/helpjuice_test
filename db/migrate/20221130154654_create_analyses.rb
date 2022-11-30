class CreateAnalyses < ActiveRecord::Migration[7.0]
  def change
    create_table :analyses do |t|
      t.string :content
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
