
do (window) ->

  $scope = $('.task-lists')

  edit = (taskListId) ->
    $taskList = getTaskList taskListId
    $taskList.find('.edit-form').removeClass('hidden')
    $taskList.find('.action-link').addClass('hidden')
    $taskList.find('.edit-btn').addClass('hidden')

  update = (taskListId) ->
    $taskList = $scope.find("[data-task-list='#{taskListId}']")
    {
      to : (content) ->
        $taskList.replaceWith(content)
    }
  
  getTaskList = (taskListId) ->
    $scope.find("[data-task-list='#{taskListId}']")

  window.taskLists = {
    edit: edit,
    update: update
  }

