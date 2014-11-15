class window.Hand extends Backbone.Collection
  model: Card

  initialize: (array, @deck, @isDealer) ->

  isBust: ->
    @scores()[0] > 21


  stand: ->
    @trigger('stand', @)

  hit: ->
    poppedItem = @deck.pop()
    @add(poppedItem)
    if @isBust() or @bestScore() == 21
      @end()

    poppedItem

  end: ->
   @trigger('end', @)

  AI: ->
    @models[0].flip()
    while @scores()[0] < 17
      @hit()
    @end()
    undefined

  hasAce: -> @reduce (memo, card) ->
    memo or card.get('value') is 1
  , 0

  minScore: -> @reduce (score, card) ->
    score + if card.get 'revealed' then card.get 'value' else 0
  , 0

  scores: ->
    # The scores are an array of potential scores.
    # Usually, that array contains one element. That is the only score.
    # when there is an ace, it offers you two scores - the original score, and score + 10.
    [@minScore(), @minScore() + 10 * @hasAce()]

  bestScore: ->
    if @scores()[1] == undefined || @scores()[1] > 21
      @scores()[0]
    else
      @scores()[1]


