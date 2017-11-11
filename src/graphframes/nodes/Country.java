package graphframes.nodes;

import java.io.Serializable;

public class Country implements Serializable {

	private static final long serialVersionUID = -3166857619161449505L;
	
	private String name;

	public static Country apply(String name) {
		return new Country(name);
	}
	
	public Country(String name) {
		super();
		this.name = name;
	}

	@Override
	public String toString() {
		return "Country [name=" + name + "]";
	}

	public String getName() {
		return name;
	}
}
