window.ToDoList =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  initialize: ->
    new ToDoList.Routers.Tasks()
    Backbone.history.start()
		
$(document).ready ->
  ToDoList.initialize()
