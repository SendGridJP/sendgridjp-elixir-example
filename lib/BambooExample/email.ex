# Define your emails
defmodule BambooExample.Email do
  import Bamboo.Email

  def email do
    new_email(
      to: "to@example.com",
      from: "from@eample.com",
      subject: "Welcome to the app.",
      html_body: "<strong>Thanks for joining!</strong>",
      text_body: "Thanks for joining!"
    )

    # or pipe using Bamboo.Email functions
    # new_email
    # |> to("wataru@kke.co.jp")
    # |> from("awwa@ason.sgncsfn9.aodaruma.com")
    # |> subject("Welcome!!!")
    # |> html_body("<strong>Welcome</strong>")
    # |> text_body("welcome")
  end
end

# # In a controller or some other module
# Email.welcome_email |> Mailer.deliver_now
#
# # You can also deliver emails in the background with Mailer.deliver_later
# Email.welcome_email |> Mailer.deliver_later
