
do (window) ->

  $scope = $('.task-lists')

  edit = (taskListId) ->
    $taskList = getTaskList( taskListId ) 
    $taskList.find('.edit-form').removeClass('hidden')
    $taskList.find('.action-link').addClass('hidden')
    $taskList.find('.edit-btn').addClass('hidden')
    $taskList.find('#task_list_name').focus().select()

  update = (taskListId) ->
    $taskList = getTaskList( taskListId ) 
    {
      to : (content) ->
        $taskList.find(".task-list-info").html( content )
    }
  
  remove = (taskListId) ->
    getTaskList( taskListId ).remove()

  getTaskList = (taskListId) ->
    $scope.find("[data-task-list='#{taskListId}']")

  window.taskLists = {
    edit: edit,
    update: update,
    remove: remove
  }

