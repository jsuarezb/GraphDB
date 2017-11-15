package helper;

import java.io.Serializable;
import java.sql.Date;
import java.util.GregorianCalendar;

public class NewVertexProp implements Serializable
{
	private String URL;
	private String owner;
	private int year;
	
	static public NewVertexProp apply(String anURL, String anOwner, int aYear)
	{
		return new NewVertexProp(anURL, anOwner, aYear);
	}
	
	public NewVertexProp(String anURL, String anOwner, int aYear)
	{
		URL= anURL;
		owner= anOwner;
		year= aYear;
	}
	
	public String toString()
	{
		return String.format("URL= %s, owner= %s, year= %d",
				URL, owner, year);
	}


	public String getURL()
	{
		return URL;
	}

	public String owner()
	{
		return owner;
	}

	public int getYear()
	{
		return year;
	}

}
