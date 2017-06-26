# SendgridjpElixirExample

本コードはElixir sendgridパッケージの利用サンプルです。

## インストール

```
# サンプルコードをcloneします。
$ git clone http://github.com/sendgridjp/sendgridjp-elixir-example.git
$ cd sendgridjp-elixir-example

# 環境変数にSendGridのAPIキーを設定します。
$ export SENDGRID_API_KEY=SG.********

# サンプルコードの宛先（to）と送信元（from）を編集します。
$ vi sendgridjp_elixir_example.ex
```

## 実行

iexを起動します。

```
$ iex -S mix
```

単一の宛先に1通のメールを送信するサンプルを実行します。

```
iex(1)> SendgridjpElixirExample.send_to_a_single_recipient
:ok
```

複数の宛先にそれぞれ1通のメールを送信するサンプルを実行します。

```
iex(2)> SendgridjpElixirExample.send_to_multiple_recipients
%HTTPoison.Response{body: "",
 headers: [{"Server", "nginx"}, {"Date", "Sun, 25 Jun 2017 06:07:14 GMT"},
  {"Content-Type", "text/plain; charset=utf-8"}, {"Content-Length", "0"},
  {"Connection", "keep-alive"}, {"X-Message-Id", "PyDALIX8RvaFp7dmAlUTRQ"},
  {"X-Frame-Options", "DENY"},
  {"Access-Control-Allow-Origin", "https://sendgrid.api-docs.io"},
  {"Access-Control-Allow-Methods", "POST"},
  {"Access-Control-Allow-Headers",
   "Authorization, Content-Type, On-behalf-of, x-sg-elas-acl"},
  {"Access-Control-Max-Age", "600"},
  {"X-No-CORS-Reason",
   "https://sendgrid.com/docs/Classroom/Basics/API/cors.html"}],
 status_code: 202}
```

バウンスリストを取得するサンプルを実行します。

```
iex(3)> SendgridjpElixirExample.get_bounces
%HTTPoison.Response{body: [],
 headers: [{"Server", "nginx"}, {"Date", "Sun, 25 Jun 2017 06:07:28 GMT"},
  {"Content-Type", "application/json"}, {"Transfer-Encoding", "chunked"},
  {"Connection", "keep-alive"},
  {"Access-Control-Allow-Methods", "HEAD, GET, OPTIONS, DELETE"},
  {"Access-Control-Max-Age", "21600"},
  {"Access-Control-Expose-Headers", "Link"},
  {"Access-Control-Allow-Origin", "*"},
  {"Access-Control-Allow-Headers",
   "AUTHORIZATION, Content-Type, On-behalf-of, x-sg-elas-acl"},
  {"Content-Security-Policy",
   "default-src https://api.sendgrid.com; frame-src 'none'; object-src 'none'"},
  {"X-Content-Type-Options", "nosniff"},
  {"Strict-Transport-Security", "max-age=31536000"},
  {"X-Ratelimit-Remaining", "599"}, {"X-Ratelimit-Limit", "600"},
  {"X-Ratelimit-Reset", "1498370880"}, {"Powered-By", "Mako"}],
 status_code: 200}
```
