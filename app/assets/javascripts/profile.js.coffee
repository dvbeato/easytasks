do (window) ->
	
	setTotalFavoriteTaskLists = (total) ->
		$('.total-favorite-task-lists').text(total)

	setTotalTaskLists = (total) ->
		$('.total-task-lists').text(total)

	window.profile = {
		favoriteTaskLists: {
			setTotal: setTotalFavoriteTaskLists
		},
		taskLists: {
			setTotal: setTotalTaskLists
		}
	}