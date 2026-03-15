// functions to handle the queue

function enqueue() {
	
	var initialQueueSpot = 0;
	
	// Check the queue
	for (var i = 0; i < array_length(global.queue); i++) {
		if (global.queue[i].in_line) {
			initialQueueSpot++; 
		}
	}
	
	var myQueueSpot = {
		id: id,
		place: initialQueueSpot,
		in_line: true,
	}
	
	array_push(global.queue, myQueueSpot);

	return initialQueueSpot; 
}

function updateMySpot() {
	var new_place = 0;
	for (var i = 0; i < array_length(global.queue); i++) {
		if (global.queue[i].id == id) {
			global.queue[i].place = new_place;
			place = new_place;
		} else {
			if (global.queue[i].place < place && global.queue[i].in_line) {
				new_place++;	
			}
		}
	}
	
	place = new_place;
}

function leaveQueue() {
	// Find my entry in the queue
	for (var i = 0; i < array_length(global.queue); i++) {
		if (global.queue[i].id == id) {
			global.queue[i].in_line = false;
		}
	}
}