defmodule ElixirExample do
  @moduledoc """
  Documentation for ElixirExample.
  """

  @doc """
  Hello world.

  ## Examples

      iex> ElixirExample.hello
      :world

  """
  # def hello do
  #   :world
  # end
  def send do
    BambooExample.Email.email |> BambooExample.Mailer.deliver_now
  end

end
