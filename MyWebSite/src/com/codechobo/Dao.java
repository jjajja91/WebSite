package com.codechobo;

import java.util.HashMap;
import java.util.Iterator;

public class Dao {
	
	private static Dao instance;
	
	public static Dao getInstance() {
		if(instance==null) {
			instance = new Dao();
		}
		return instance;
	}
	
	private HashMap<String, User> userMap = new HashMap<>();
	
	public void create(User user) {
		userMap.put(user.getId(), user);
	}
	
	public boolean checkId(String id) {
		Iterator<String> it = userMap.keySet().iterator();
		while(it.hasNext()) {
			String idTmp = it.next();
			if(idTmp.equals(id)) {
				return true;
			}
		}
		return false;
	}
	
	public User readOne(String id) {
		if(checkId(id)){
			return userMap.get(id);
		}
		return null;
	}

}
