class ToDoList.Views.Task extends Backbone.View
  template: JST['tasks/task']
  className: 'row'
  
  events:
    'change [type=checkbox]' : 'toggleDone'
    'click .delete' : 'deleteTask'
  
  render: ->
    $(@el).html(@template(task: @model))
    this
    
  toggleDone: (event) ->
    task = this.model
    task.set('done', !task.get('done'))
    task.save()
  
  deleteTask: (event) ->
    task = this.model
    task.destroy();