package graphframes.nodes;

import java.io.Serializable;

public class Year implements Serializable {

	private static final long serialVersionUID = -3166857619161449505L;
	
	private int number;

	public static Year apply(int number) {
		return new Year(number);
	}
	
	public Year(int number) {
		super();
		this.number = number;
	}

	@Override
	public String toString() {
		return "Year [number=" + number + "]";
	}

	public int getNumber() {
		return number;
	}
}
