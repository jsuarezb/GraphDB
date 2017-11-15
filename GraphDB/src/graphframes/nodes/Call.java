package graphframes.nodes;

import java.io.Serializable;
import java.time.LocalTime;

public class Call implements Serializable {

	private static final long serialVersionUID = -3166857619161449505L;
	
	private LocalTime time;
	private int duration;

	public static Call apply(LocalTime time, int duration) {
		return new Call(time, duration);
	}
	
	public Call(LocalTime time, int duration) {
		super();
		this.time = time;
		this.duration = duration;
	}

	@Override
	public String toString() {
		return "Call [time=" + time + ", duration=" + duration + "]";
	}

	public LocalTime getTime() {
		return time;
	}

	public int getDuration() {
		return duration;
	}
}
