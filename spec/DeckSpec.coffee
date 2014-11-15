assert = chai.assert

describe 'deck', ->
  deck = null
  hand = null

  beforeEach ->
    deck = new Deck()
    hand = deck.dealPlayer()

  describe 'hit', ->
    it 'should give the last card from the deck', ->

      assert.strictEqual deck.length, 50
      assert.strictEqual deck.last(), hand.hit()
      assert.strictEqual deck.length, 49

  describe 'stand', ->
    it 'should not alter the length of the deck', ->
      hand.hit()
      hand.stand()
      assert.strictEqual deck.length, 49

  describe 'dealer', ->
    it 'should allow flip()', ->
      dealerHand = deck.dealDealer()
      assert.strictEqual deck.length, 48




