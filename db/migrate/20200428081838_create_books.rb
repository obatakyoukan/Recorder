class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.integer :user_id, null: false #ユーザー番号
      t.string :title, null: false #本の名前
      t.string :author #著者
      t.string :publisher #出版
      t.date :published , default: Time.current#発売日
      t.string :memo #メモ
      t.string :file_type , default: "pdf"  #pdf or png
      t.string :file_url #file url
      t.string :link #file linker
      t.timestamps
    end
  end
end
