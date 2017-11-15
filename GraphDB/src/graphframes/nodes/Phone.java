package graphframes.nodes;

import java.io.Serializable;

public class Phone implements Serializable {

	private static final long serialVersionUID = -3166857619161449505L;
	
	private String number;

	public static Phone apply(String number) {
		return new Phone(number);
	}
	
	public Phone(String number) {
		super();
		this.number = number;
	}

	@Override
	public String toString() {
		return "Phone [number=" + number + "]";
	}

	public String getNumber() {
		return number;
	}
}
