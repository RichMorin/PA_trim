# controllers/text_controller.ex

defmodule PhxHttpWeb.TextController do

  use PhxHttpWeb, :controller

  def show(conn, _params) do
    conn |> render("home.html")
  end

end
