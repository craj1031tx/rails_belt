class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :fn
      t.string :ln
      t.string :email
      t.string :password_digest

      t.timestamps null: false
    end
  end
end
