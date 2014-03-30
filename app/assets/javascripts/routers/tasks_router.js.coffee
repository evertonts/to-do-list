class ToDoList.Routers.Tasks extends Backbone.Router
  routes:
    '': 'index'
    'tasks/:id': 'show'

  initialize: ->
    @collection = new ToDoList.Collections.Tasks()
    @collection.fetch(reset: true)

  index: ->
    view = new ToDoList.Views.TasksIndex(collection: @collection)
    $('#container').html(view.render().el)

  show: (id) ->
    console.log "Task #{id}"