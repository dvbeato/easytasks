do (window) ->
	
	setTotalFavoriteTaskList = (total) ->
		$('.total-favorite-task-list').text(total)

	window.profile = {
		favoriteTaskLists: {
			setTotal: setTotalFavoriteTaskList
		}
	}