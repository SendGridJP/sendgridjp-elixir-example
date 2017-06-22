defmodule SendgridExample do
  @moduledoc """
  Documentation for SendgridExample.
  """

  @doc """
  Send an email.

  ## Examples

      iex> SendgridExample.send
      :ok

  """
  def send do
    alias SendGrid.{Mailer, Email}
    image = File.read!("./gif.gif")
    encoded = :base64.encode(image)
    attachment =  %{
      :content => encoded,
      :type => "image/gif",
      :filename => "gif.gif",
      :disposition => "attachment"
    }
    email =
      Email.build()
      |> Email.add_to("to@example.com")
      |> Email.put_from("from@example.com")
      |> Email.put_subject("[sendgrid-elixir-example] フクロウのお名前はfullnameさん")
      |> Email.put_text("familyname さんは何をしていますか？\r\n 彼はplaceにいます。")
      |> Email.put_html("<strong> familyname さんは何をしていますか？</strong><br />彼はplaceにいます。")
      |> Email.add_substitution("fullname", "田中 太郎")
      |> Email.add_substitution("familyname", "田中")
      |> Email.add_substitution("place", "中野")
      |> Email.add_header("X-Sent-Using", "SendGrid-API")
      |> Email.add_attachment(attachment)
    Mailer.send(email)
  end
end
