# TODO: Refactor this model to use an internal Game Model instead
# of containing the game logic directly.
class window.App extends Backbone.Model
  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()
    @get 'playerHand'
          .on 'stand', (-> @get('dealerHand').AI(); undefined), @
    @get 'playerHand'
          .on 'end', (-> @checkWin(); undefined), @
    @get 'dealerHand'
          .on 'end', (-> @checkWin(); undefined), @
    return

  checkWin: ->
    if @get('playerHand').bestScore() > 21
      alert 'you lose'
    else if @get('dealerHand').bestScore() > 21
      alert 'you win'
    else if @get('playerHand').bestScore() == @get('dealerHand').bestScore()
     alert 'tie!'
    else if @get('playerHand').bestScore() > @get('dealerHand').bestScore()
      alert 'you win'
    else
      alert 'you lose'
