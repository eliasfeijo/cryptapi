class CreateCryptoCoins < ActiveRecord::Migration[5.2]
  def change
    create_table :crypto_coins do |t|
      t.string :title
      t.decimal :price

      t.timestamps
    end
  end
end
