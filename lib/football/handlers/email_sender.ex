defmodule Football.Handlers.EmailSender do
  @moduledoc false

  use Commanded.Event.Handler,
    application: Football.Commanded.Application,
    name: "Football.Handlers.EmailSender",
    consistency: :eventual,
    start_from: :current

  import Swoosh.Email

  require Logger

  alias Football.Events, as: E

  def handle(%E.MatchCreated{id: id} = event, _metadata) do
    Logger.info("Sending email for match with id #{id}")

    %{name: "Luca", email: "contact@lucazulian.it"}
    |> compose(id)
    |> Football.Mailer.deliver()
  end

  def compose(user, id) do
    new()
    |> to({user.name, user.email})
    |> from({"Football App", "football@app.com"})
    |> subject("Hello")
    |> html_body("<h1>A new match with id #{id} has been submitted</h1>")
    |> text_body("A new match with id #{id} has been submitted\n")
  end
end
