# Define a Mailer. Maybe in lib/my_app/mailer.ex
defmodule BambooExample.Mailer do
  use Bamboo.Mailer, otp_app: :elixir_example
end
