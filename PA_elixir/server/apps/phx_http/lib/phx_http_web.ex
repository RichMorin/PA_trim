# phx_http_web.ex

defmodule PhxHttpWeb do

  @moduledoc """
  The entrypoint for defining your web interface, such
  as controllers, views, channels and so on.

  This can be used in your application as:

      use PhxHttpWeb, :controller
      use PhxHttpWeb, :view

  The definitions below will be executed for every view,
  controller, etc, so keep them short and clean, focused
  on imports, uses and aliases.

  Do NOT define functions inside the quoted expressions
  below. Instead, define any helper function in modules
  and import those modules here.
  """

  # Public functions

# @spec - ToDo

  def controller do
    quote do
      use Phoenix.Controller, namespace: PhxHttpWeb

      import Plug.Conn
      import PhxHttpWeb.Gettext
      alias PhxHttpWeb.Router.Helpers, as: Routes
    end
  end

# @spec - ToDo

  def view do
    quote do
      use Phoenix.View,
        root: "lib/phx_http_web/templates",
        namespace: PhxHttpWeb

      # Import convenience functions from controllers
      import Phoenix.Controller,
        only: [get_flash: 1, get_flash: 2, view_module: 1]

      # Use all HTML functionality (forms, tags, etc)
      use Phoenix.HTML

      import PhxHttpWeb.ErrorHelpers
      import PhxHttpWeb.Gettext
      alias PhxHttpWeb.Router.Helpers, as: Routes
    end
  end

# @spec - ToDo

  def router do
    quote do
      use Phoenix.Router
      import Plug.Conn
      import Phoenix.Controller
    end
  end

# @spec - ToDo

  def channel do
    quote do
      use Phoenix.Channel
      import PhxHttpWeb.Gettext
    end
  end

  @doc """
  When used, dispatch to the appropriate controller/view/etc.
  """

# @spec - ToDo

  defmacro __using__(which) when is_atom(which) do
    apply(__MODULE__, which, [])
  end

end

