defmodule SendgridjpElixirExample do
  @moduledoc """
  Documentation for SendgridjpElixirExample.
  """

  @doc """
  単一の宛先に1通のメールを送信
  """
  @spec send_to_a_single_recipient :: :ok | { :error, list(String.t) } | { :error, String.t }
  def send_to_a_single_recipient do
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
      |> Email.put_from("from@example.com", "送信者名")
      |> Email.put_subject("[sendgridjp-elixir-example] フクロウのお名前はfullnameさん")
      |> Email.put_text("familyname さんは何をしていますか？\r\n 彼はplaceにいます。")
      |> Email.put_html("<strong> familyname さんは何をしていますか？</strong><br />彼はplaceにいます。")
      |> Email.add_substitution("fullname", "田中 太郎")
      |> Email.add_substitution("familyname", "田中")
      |> Email.add_substitution("place", "中野")
      |> Email.add_header("X-Sent-Using", "SendGrid-API")
      |> Email.add_attachment(attachment)
    Mailer.send(email)
  end

  @doc """
  複数の宛先にそれぞれ1通のメールを送信
  """
  @spec send_to_multiple_recipients :: HTTPoison.Response.t
  def send_to_multiple_recipients do
    image = File.read!("./gif.gif")
    encoded = :base64.encode(image)
    attachment =  %{
      :content => encoded,
      :type => "image/gif",
      :filename => "gif.gif",
      :disposition => "attachment"
    }
    base_url = "/v3/mail/send"
    json = %{
      personalizations: [
        %{
          to: [%{email: "to1@example.com"}],
          substitutions: %{
            "fullname" => "田中 太郎",
            "familyname" => "田中",
            "place" => "office"
          }
        },
        %{
          to: [%{email: "to2@example.com"}],
          substitutions: %{
            "fullname" => "佐藤 次郎",
            "familyname" => "佐藤",
            "place" => "home"
          }
        },
        %{
          to: [%{email: "to3@example.com"}],
          substitutions: %{
            "fullname" => "鈴木 三郎",
            "familyname" => "鈴木",
            "place" => "office"
          }
        }
      ],
      subject: "[sendgrid-elixir-example] フクロウのお名前はfullnameさん",
      from: %{
        email: "from@example.com",
        name: "送信者名"
      },
      content: [
        %{
          type: "text/plain",
          value: "familyname さんは何をしていますか？\r\n 彼はplaceにいます。"
        },
        %{
          type: "text/html",
          value: "<strong> familyname さんは何をしていますか？</strong><br />彼はplaceにいます。"
        }
      ],
      sections: %{
        "office" => "中野",
        "home" => "目黒"
      },
      headers: %{"X-Sent-Using" => "SendGrid-API"},
      attachments: [attachment]
    } |> Poison.encode!
    SendGrid.post!(base_url, json)
  end

  @doc """
  バウンスリストの取得
  """
  @spec get_bounces :: HTTPoison.Response.t
  def get_bounces do
    base_url = "/v3/suppression/bounces"
    SendGrid.get!(base_url)
  end
end
