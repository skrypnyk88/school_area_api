# Make Ruby 2.4 preserve the timezone of the receiver when calling `to_time`.
ActiveSupport.to_time_preserves_timezone = true

# Require `belongs_to` associations by default. Previous versions had false.
Rails.application.config.active_record.belongs_to_required_by_default = true

# Do not halt callback chains when a callback returns false. Previous versions
# had true.
ActiveSupport.halt_callback_chains_on_return_false = false

Rails.application.config.ssl_options = { hsts: { subdomains: true } }
