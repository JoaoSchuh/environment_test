class AddAttributes < ActiveRecord::Migration[6.1]
  def change
    remove_columns(:books, :created_at, :updated_at)
    
    add_column(:books, :author, :string)
    add_column(:books, :price, :float)
    add_column(:books, :published_date, :datetime)
    add_column(:books, :created_at, :datetime)
    add_column(:books, :updated_at, :datetime)

  end
end
