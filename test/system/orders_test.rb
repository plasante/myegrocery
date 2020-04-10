require "application_system_test_case"

class OrdersTest < ApplicationSystemTestCase
  setup do
    @order = orders(:one)
  end

  test "visiting the index" do
    # visit localhost:3000/orders
    visit orders_url
    # find <h1>Orders</h1> in the page
    assert_selector "h1", text: "Orders"
  end

  test "destroying a Order" do
    visit orders_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Order was successfully destroyed"
  end

  test "check routing number" do
    visit store_index_url

    click_on "Add to Cart", match: :first

    click_on 'Checkout'

    fill_in 'order_name', with: 'Pierre'
    fill_in 'order_address', with: '2592 ch Ste-Marie'
    fill_in 'order_email', with: 'pierre@email.com'

    assert_no_selector "#order_routing_number"

    select 'Check', from: 'Pay type'

    assert_selector "#order_routing_number"
  end

  test "check po number" do
    visit store_index_url

    click_on "Add to Cart", match: :first

    click_on 'Checkout'

    fill_in 'order_name', with: 'Pierre'
    fill_in 'order_address', with: '2592 ch Ste-Marie'
    fill_in 'order_email', with: 'pierre@email.com'

    assert_no_selector "#order_po_number"

    select 'Purchase order', from: 'Pay type'

    assert_selector "#order_po_number"
  end
end
