package graphframes.nodes;

import java.io.Serializable;

public class Day implements Serializable {

	private static final long serialVersionUID = -3166857619161449505L;
	
	private int number;

	public static Day apply(int number) {
		return new Day(number);
	}
	
	public Day(int number) {
		super();
		this.number = number;
	}

	@Override
	public String toString() {
		return "Day [number=" + number + "]";
	}

	public int getNumber() {
		return number;
	}
}
