# location: spec/feature/integration_spec.rb
require 'rails_helper'

RSpec.describe 'Creating a book', type: :feature do

  scenario 'valid title and author (minimum inputs)' do
    visit new_book_path
    fill_in 'Title', with: 'Star Wars IV'
    fill_in 'Author', with: 'George Lucas'
    click_on 'Create Book'
    expect(page).to have_content('Star Wars IV')
    expect(page).to have_content('George Lucas')
  end

  scenario 'valid title, author, price' do
    visit new_book_path
    fill_in 'Title', with: 'Star Wars IV'
    fill_in 'Author', with: 'George Lucas'
    fill_in 'Price', with: 999.98
    click_on 'Create Book'
    expect(page).to have_content('Star Wars IV')
    expect(page).to have_content('George Lucas')
    expect(page).to have_content(999.98)
  end

  scenario 'valid inputs filled' do
    visit new_book_path
    fill_in 'Title', with: 'Star Wars IV'
    fill_in 'Author', with: 'George Lucas'
    fill_in 'Price', with: 999.98
    fill_in 'Published date', with: '06-02-2301'
    click_on 'Create Book'
    expect(page).to have_content('Star Wars IV')
    expect(page).to have_content('George Lucas')
    expect(page).to have_content(999.98)
    expect(page).to have_content('2301-02-06')
  end

  scenario 'invalid inputs' do
    visit new_book_path
    fill_in 'Title', with: nil
    fill_in 'Author', with: nil
    fill_in 'Price', with: -123
    click_on 'Create Book'
    expect(page).to have_content('Title can\'t be blank')
    expect(page).to have_content('Author can\'t be blank')
    expect(page).to have_content('Price must be greater than or equal to 0')
  end

  scenario 'mixed valid and invalid inputs' do
    visit new_book_path
    fill_in 'Title', with: nil
    fill_in 'Author', with: 'nil'
    fill_in 'Price', with: -123
    fill_in 'Published date', with: '06-02-2301'
    click_on 'Create Book'
    expect(page).to have_content('Title can\'t be blank')
    expect(page).not_to have_content('nil')
    expect(page).to have_content('Price must be greater than or equal to 0')
    expect(page).not_to have_content('2301-02-06')
  end

end
