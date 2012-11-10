var session;
var speakRequestsSet = { };
var data;

function handleOpenTok(dt){
	data = dt;
	var publisher;
	
	var apiKey = data.apiKey;
	var sessionId = data.sessionId;
	var token = data.token;
	var userRole = data.role;

	//TODO - this should change in production
	TB.setLogLevel(TB.DEBUG);

	session = TB.initSession(sessionId);      
	session.addEventListener('sessionConnected', sessionConnectedHandler);
	session.addEventListener('streamCreated', streamCreatedHandler);
	session.addEventListener("signalReceived", raiseHandHandler);
	session.connect(apiKey, token);
}


function switchPublishingUser(userRole, connectionId){
	if (userRole === 'teacher') {
		//remove from set so that the student can ask other questions
		speakRequestsSet[connectionId] = false;
		var btnId = "#requestButton" + connectionId;
		$(btnId).remove();
		alert("done");
	}
}

function raisehand(){
	session.signal();
/*	var stateManager = session.getStateManager();
	stateManager.addEventListener("changed:raiseHand", testRaiseHandHandler);
	stateManager.set("raiseHand", "bar");*/
}

//TODO - fix raiseHand event
function raiseHandHandler(event){
	var connectionId = event.fromConnection.connectionId;
	//ignore request if already registered
	if (!(connectionId in speakRequestsSet) ||
			(speakRequestsSet[connectionId] === false)){
		speakRequestsSet[connectionId] = true;

		var rqstParams = "'" + data.role + "', '" + connectionId + "'";
		var btnId = "requestButton" + connectionId;
		var element = '<input class="dashboardButton" ';
		element += 'id="' + btnId + '"';
		element += 'type="image" src="images/opentok/face.png" title="student speak request"';
			element += 'onclick="switchPublishingUser(' + rqstParams + ')"';
		element += '>';
		$('#speakRequests').append(element);
	}
}

function testRaiseHandHandler(event){
	alert("success");
}

function subscribeToStreams(streams) {
	//display a generic message if professor is not connected yet
	if (streams.length == 0 &&
			data.role != "teacher"){
		$('#subscribers').append("<h4 id=\"noSession\">Waiting for instructor to start the session.</h4>");
	} else {
		$('#noSession').remove();
		for (var i = 0; i < streams.length; i++) {
			// Create the div to put the subscriber element in to
			var div = document.createElement('div');
			div.setAttribute('id', 'stream' + streams[i].streamId);
			$('#subscribers').append(div);

			// Subscribe to the stream
			var subscribeProps = {width:400, height:225};
			session.subscribe(streams[i], div.id, subscribeProps);
		}
		generateUserDashBoard(data.role);
	}
}

function accessAllowedHandler(event){
	//make the publisher img invisible after receiving access
	$("#myPublisherDiv").addClass("invisible");
}

function sessionConnectedHandler(event) {
	//only a teacher can publish when connecting to the session
	if(data.role == "teacher"){
		var div = document.createElement('div');
		div.setAttribute('id', 'publisher');
		$('#myPublisherDiv').append(div);
		publisher = TB.initPublisher(data.apiKey, div);

		//TODO - only add publisher if camera and mic detected

		publisher.addEventListener('accessAllowed', accessAllowedHandler);
		session.publish(publisher);
	}

	// Subscribe to streams that were in the session when we connected
	subscribeToStreams(event.streams);
}

function streamCreatedHandler(event) {
	// Subscribe to any new streams that are created
	subscribeToStreams(event.streams);
}