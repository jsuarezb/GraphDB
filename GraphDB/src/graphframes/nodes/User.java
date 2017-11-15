package graphframes.nodes;

import java.io.Serializable;

public class User implements Serializable {

	private static final long serialVersionUID = -3166857619161449505L;
	
	private String username;

	public static User apply(String username) {
		return new User(username);
	}
	
	public User(String username) {
		super();
		this.username = username;
	}

	@Override
	public String toString() {
		return "User [username=" + username + "]";
	}

	public String getUsername() {
		return username;
	}
}
