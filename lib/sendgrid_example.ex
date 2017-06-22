defmodule SendgridExample do
  @moduledoc """
  Documentation for ElixirExample.
  """

  @doc """
  Hello world.

  ## Examples

      iex> ElixirExample.hello
      :world

  """
  def send do
    alias SendGrid.{Mailer, Email}
    image = File.read("./gif.gif")
    {result, encoded_image} = Base.decode64(image)
    attachment = %{
      :content => encoded_image,
      :type => "image/gif",
      :filename => "gif.gif",
      :disposition => "attachment"
    }
    email =
      Email.build()
      |> Email.put_from("from@example.com")
      |> Email.add_to("to@example.com")
      |> Email.put_subject("こんにちは")
      |> Email.put_text("Elixir SendGridパッケージから送信")
      |> Email.put_html("<span>Elixir SendGridパッケージから送信</span>")
      |> Email.add_attachment(attachment)
    Mailer.send(email)
  end
end
