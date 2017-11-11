package graphframes.nodes;

import java.io.Serializable;

public class City implements Serializable {

	private static final long serialVersionUID = -3166857619161449505L;
	
	private String name;

	public static City apply(String name) {
		return new City(name);
	}
	
	public City(String name) {
		super();
		this.name = name;
	}

	@Override
	public String toString() {
		return "City [name=" + name + "]";
	}

	public String getName() {
		return name;
	}
}
