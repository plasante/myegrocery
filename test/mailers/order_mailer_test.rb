#---
# Excerpted from "Agile Web Development with Rails 6",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose.
# Visit http://www.pragmaticprogrammer.com/titles/rails6 for more book information.
#---
require 'test_helper'

class OrderMailerTest < ActionMailer::TestCase
  test "received" do
    mail = OrderMailer.received(orders(:one))
    assert_equal "eGrocery Store Order Confirmation", mail.subject
    assert_equal ["pierre@example.org"], mail.to
    assert_equal ["egrocery@example.com"], mail.from
    #assert_match /Dear Pierre Lasante/, mail.body.encoded
  end

  test "shipped" do
    mail = OrderMailer.shipped(orders(:one))
    assert_equal "eGrocery Store Order Shipped", mail.subject
    assert_equal ["pierre@example.org"], mail.to
    assert_equal ["egrocery@example.com"], mail.from
    #assert_match /Dear Pierre Lasante/, mail.body.encoded
  end

end