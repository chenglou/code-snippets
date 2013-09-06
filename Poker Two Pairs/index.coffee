# Output a Two Pair in Poker

suits = ['heart', 'diamond', 'spade', 'clubs']
ranks = 'A 2 3 4 5 6 7 8 9 10 Jack Queen King'.split ' '

twoPairs = ->
  _ranks = ranks.slice()

  firstTwoCardsSuits = suits.slice()
  firstTwoCardsRanks = _pickAndRemoveAtRandom _ranks
  card1 = [firstTwoCardsRanks, _pickAndRemoveAtRandom firstTwoCardsSuits]
  card2 = [firstTwoCardsRanks, _pickAndRemoveAtRandom firstTwoCardsSuits]


  nextTwoCardsSuits = suits.slice()
  nextTwoCardsRanks = _pickAndRemoveAtRandom _ranks
  card3 = [nextTwoCardsRanks, _pickAndRemoveAtRandom nextTwoCardsSuits]
  card4 = [nextTwoCardsRanks, _pickAndRemoveAtRandom nextTwoCardsSuits]

  card5 = [_pickAndRemoveAtRandom(_ranks), _pickAndRemoveAtRandom suits.slice()]

  return [card1, card2, card3, card4, card5]

_pickAndRemoveAtRandom = (arr) ->
  return arr.splice(Math.floor(Math.random() * arr.length), 1)

module.exports = twoPairs
