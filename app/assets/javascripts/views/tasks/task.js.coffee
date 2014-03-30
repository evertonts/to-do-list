class ToDoList.Views.Task extends Backbone.View
  template: JST['tasks/task']
  tagName: 'li'
  
  events:
    'change input' : 'toggleDone'
    'click .delete' : 'deleteTask'
  
  render: ->
    $(@el).html(@template(task: @model))
    this
    
  toggleDone: (event) ->
    console.log(this.model.get('description'))
    task = this.model
    task.set('done', !task.get('done'))
    task.save()
  
  deleteTask: (event) ->
    task = this.model
    task.destroy();