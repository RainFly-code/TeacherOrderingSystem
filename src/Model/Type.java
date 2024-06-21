package Model;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

public class Type {
	private int typeid;
	private String typename;
	
	private String encodeName;

	public int getTypeid() {
		return typeid;
	}

	public void setTypeid(int typeid) {
		this.typeid = typeid;
	}

	public String getTypename() {
		return typename;
	}

	public void setTypename(String typename) {
		this.typename = typename;
	}

	public String getEncodeName() {
		return encodeName;
	}

	public void setEncodeName(String encodeName) {
		this.encodeName = encodeName;
	}

	public void setName(String typename) {
		this.typename = typename;
		try {
			this.encodeName = URLEncoder.encode(typename, "utf-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public Type(int typeid, String typename) {
		super();
		this.typeid = typeid;
		this.typename = typename;
	}
	public Type() {
		super();
	}
	public Type(String typename) {
		super();
		this.typename = typename;
	}
	
}
