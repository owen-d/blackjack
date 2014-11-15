class window.CardView extends Backbone.View
  className: 'card'

  template: _.template '<img src="img/cards/<%= rankName %>-<%= suitName %>.png" height="100%" width="100%"/>'

  initialize: -> @render()

  render: ->
    @$el.children().detach()
    @$el.html @template @model.attributes
    @$el.addClass 'covered' unless @model.get 'revealed'
    if (@$el.hasClass 'covered')
      @$el.html '<img src="img/card-back.png" height="100%" width="100%"/>';
      undefined


