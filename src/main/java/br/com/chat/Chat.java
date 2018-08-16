package br.com.chat;


import java.io.IOException;
import java.io.StringWriter;
import java.util.Collections;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;

import javax.json.*;
import javax.websocket.server.ServerEndpoint;
import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;

import sun.org.mozilla.javascript.internal.json.JsonParser;
@ServerEndpoint("/Chat")
public class Chat {
static Set<Session> chatroomUsers = Collections.synchronizedSet(new HashSet<Session>());
 @OnOpen
 public void handleOpen(Session userSession){
	 chatroomUsers.add(userSession);
 }
@OnMessage
public void handleMessage(String message,Session userSession) throws IOException{
	String username = (String) userSession.getUserProperties().get("username");
	if(username == null){
		userSession.getUserProperties().put("username", message);
		userSession.getBasicRemote().sendText(buildJsonData("","usuario: "+message));
	} else{
		Iterator<Session> iterator = chatroomUsers.iterator();
		while(iterator.hasNext())iterator.next().getBasicRemote().sendText(buildJsonData(username, message));
	}
}
@OnClose
public void handleClose(Session userSession){
	chatroomUsers.remove(userSession);
}
private String buildJsonData(String username,String message) {
	JsonObject jsonObject = Json.createObjectBuilder().add("message",username+": "+message).build();
	StringWriter stringWriter = new StringWriter();
	try(JsonWriter jsonWriter = Json.createWriter(stringWriter)){jsonWriter.write(jsonObject);}
	return stringWriter.toString();
}


}
