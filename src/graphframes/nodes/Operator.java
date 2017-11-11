package graphframes.nodes;

import java.io.Serializable;

public class Operator implements Serializable {

	private static final long serialVersionUID = -3166857619161449505L;
	
	private String name;

	public static Operator apply(String name) {
		return new Operator(name);
	}
	
	public Operator(String name) {
		super();
		this.name = name;
	}

	@Override
	public String toString() {
		return "Operator [name=" + name + "]";
	}

	public String getName() {
		return name;
	}
}
