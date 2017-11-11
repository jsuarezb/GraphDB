package graphframes.nodes;

import java.io.Serializable;

public class Month implements Serializable {

	private static final long serialVersionUID = -3166857619161449505L;
	
	private int number;

	public static Month apply(int number) {
		return new Month(number);
	}
	
	public Month(int number) {
		super();
		this.number = number;
	}

	@Override
	public String toString() {
		return "Month [number=" + number + "]";
	}

	public int getNumber() {
		return number;
	}
}
