# firehose track 4, lesson 29 - file created 28 jun 17 for use of stripe for accepting payments (lesson 29)

Rails.configuration.stripe = {
  publishable_key: ENV['PUBLISHABLE_KEY'],
  secret_key: ENV['SECRET_KEY']
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]
