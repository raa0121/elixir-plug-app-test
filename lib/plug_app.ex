defmodule PlugApp do
  use Plug.Router

  plug :match
  plug :dispatch

  get "/:command" do
    {result, _} = Code.eval_string URI.decode(command)
    send_resp(conn, 200, "#{result}")
  end

  match _ do
    send_resp(conn, 404, "oops")
  end
end
