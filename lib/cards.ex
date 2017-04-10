defmodule Cards do
  @moduledoc """
    Provides methods for creating and handling a deck of cards
  """

  @doc """
    Deals a hand from a freshly shuffled deck with provided hand size
  """
  def create_hand(hand_size) do
    create_deck()
    |> shuffle
    |> deal(hand_size)
  end

  def create_deck do
    for suit <- suits(), value <- values() do
      "#{value} of #{suit}"
    end
  end

  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  @doc """
    Divides a deck into a hand and the remainder of the deck.
    The `hand_size` indicates how many cards should be dealt

  ## Examples
      iex> deck = Cards.create_deck
      iex> {hand, deck} = Cards.deal(deck, 1)
      iex> hand
      ["Ace of Spades"]
  """
  def deal(deck, hand_size) do
    Enum.split(deck, hand_size)
  end

  def save(deck, filename) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename, binary)
  end

  def load(filename) do
    case File.read(filename) do
      {:ok, binary} -> :erlang.binary_to_term(binary)
      {:error, _}   -> "That file doesn't exist"
    end
  end

  @doc """
    Determines whether a deck contains a given card

    ## Examples
      iex> deck = Cards.create_deck
      iex> Cards.contains?(deck, "Ace of Hearts")
      true
  """
  def contains?(deck, card) do
    Enum.member?(deck, card)
  end

  defp values do
    ~w(Ace Two Three Four Five Six Seven Eight Nine Ten Jack Queen King)
  end

  defp suits do
    ~w(Spades Clubs Hearts Diamonds)
  end
end
