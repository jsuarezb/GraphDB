package helper;

import java.io.Serializable;


public class EdgeProp implements Serializable
{
	private String label;
	private int count;
	
	static public EdgeProp apply(String aLabel, int aCount)
	{
		return new EdgeProp(aLabel, aCount);
	}

	public EdgeProp(String aLabel, int aCount)
	{
		label= aLabel;
		count=aCount;
	}
	
	public String toString()
	{
		return String.format("label= %s, count= %d",
				label, count);
	}
	

	public String getLabel()
	{
		return label;
	}
	
	public int getCount()
	{
		return count;
	}
}
