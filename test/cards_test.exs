defmodule CardsTest do
  use ExUnit.Case
  doctest Cards

  test "create_deck makes 52 cards" do
    deck_length = length(Cards.create_deck)
    assert deck_length == 52
  end

  test "shuffle changes the order of the deck" do
    deck = Cards.create_deck
    refute deck == Cards.shuffle(deck)
  end

  test "deal returns a list that matches the given hand_size" do
    deck = Cards.create_deck
    {hand, _} = Cards.deal(deck, 5)
    assert length(hand) == 5
  end
end
