require 'rails_helper'

RSpec.feature "ProductDetails", type: :feature, js: true do
 
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "user clicks on a product" do
    visit root_path
    # first('a.btn btn-default pull-right').click
    first('article.product').find_link('Details').click
    # commented out b/c it's for debugging only
    sleep(3)
    puts page.html    
    expect(page).to have_css '.products-show'


    save_and_open_screenshot
  end
end
