class ToDoList.Views.TasksIndex extends Backbone.View
  template: JST['tasks/index']
	
  events:
    'submit #new_task': 'createTask'
    
  initialize: ->
    @collection.on('reset', @render, this)
    @collection.on('add', @appendTask, this)
    @collection.on('remove', @render, this)
    
  render: ->
    $(@el).html(@template())
    @collection.each(@appendTask)
    this
    
  createTask: (event) ->
    event.preventDefault()
    attributes = description: $('#new_task_description').val()
    @collection.create attributes,
      wait: true
      success: -> 
        $('#new_task')[0].reset()
        $('.error').html("")
      error: @handleError
    
  appendTask: (task) ->
    view = new ToDoList.Views.Task(model: task)
    $('#tasks').append(view.render().el)
    
  handleError: (task, response) ->
    if response.status == 422
      errors  = $.parseJSON(response.responseText).errors
      for attribute, messages of errors
        $('.error').html "<li> #{attribute} #{message} </li>" for message in messages
        
  
