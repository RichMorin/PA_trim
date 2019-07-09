# phx_http/mix.exs

defmodule PhxHttp.MixProject do

  use Mix.Project

  # Public functions

  @spec project() :: [key: atom]

  def project() do
    [
      app:                :phx_http,
      version:            "0.1.0",

      build_path:         "../../_build",
      config_path:        "../../config/config.exs",
      deps_path:          "../../deps",
      lockfile:           "../../mix.lock",

      elixir:             "~> 1.9",
      elixirc_paths:      elixirc_paths(Mix.env()),
      compilers:          [:phoenix, :gettext] ++ Mix.compilers(), #?
      start_permanent:    Mix.env() == :prod,
      deps:               deps()
    ]
  end

  # Configuration for the OTP application.
  #
  # Type `mix help compile.app` for more information.

  @spec application() :: [key: atom]

  def application() do
    [
      mod:                    {PhxHttp.Application, []},
      extra_applications:     [:logger, :runtime_tools],
    ]
  end

  # Specifies which paths to compile per environment.

  @spec elixirc_paths(any) :: [ String.t ]

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_),     do: ["lib"]

  # Specifies your project dependencies.
  #
  # Type `mix help deps` for examples and options.

  @spec deps() :: [ tuple ]

  defp deps() do
    [ # default
      { :phoenix,              "~> 1.4" },
      { :phoenix_pubsub,       "~> 1.1" },

      { :phoenix_html,         "~> 2.13.3" },
      { :phoenix_live_reload,  "~> 1.2", only: :dev },
      { :gettext,              "~> 0.16" },
      { :jason,                "~> 1.1" },
      { :plug_cowboy,          "~> 2.0" },
    ]
  end
end
