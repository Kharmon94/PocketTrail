class CreateUserTickers < ActiveRecord::Migration[5.0]
  def change
    create_table :user_tickers do |t|
      t.integer "user_id"
      t.string	"ticker"
      t.timestamps
    end
  end
end
