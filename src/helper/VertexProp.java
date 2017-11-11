package helper;

import java.io.Serializable;
import java.util.GregorianCalendar; 


public class VertexProp implements Serializable
{
	private String URL;
	private String owner;
	private GregorianCalendar creationDate;
	
	static public VertexProp apply(String anURL, String anOwner, GregorianCalendar aCreationDate)
	{
		return new VertexProp(anURL, anOwner, aCreationDate);
	}
	
	public VertexProp( String anURL, String anOwner, GregorianCalendar aCreationDate)
	{
		URL= anURL;
		owner= anOwner;
		creationDate= aCreationDate;
	}
	
	public String toString()
	{
		return String.format("URL= %s, owner= %s, creationDate= %s",
				URL, owner, creationDate.toString());
	}
	
	
	public String getURL()
	{
		return URL;
	}

	public String owner()
	{
		return owner;
	}

	public GregorianCalendar getDate()
	{
		return creationDate;
	}
}
