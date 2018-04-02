package vo;

public class Users {
	
	private String id;
	private String password;
	private String name;
	private String email;
	private String email2;
	private String birthday;
	private String phone;
	private String admin;
	public Users() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Users(String id, String password, String name, String email, String email2, String birthday, String phone,
			String admin) {
		super();
		this.id = id;
		this.password = password;
		this.name = name;
		this.email = email;
		this.email2 = email2;
		this.birthday = birthday;
		this.phone = phone;
		this.admin = admin;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getEmail2() {
		return email2;
	}
	public void setEmail2(String email2) {
		this.email2 = email2;
	}
	public String getBirthday() {
		return birthday;
	}
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAdmin() {
		return admin;
	}
	public void setAdmin(String admin) {
		this.admin = admin;
	}
	@Override
	public String toString() {
		return "Users [id=" + id + ", password=" + password + ", name=" + name + ", email=" + email + ", email2="
				+ email2 + ", birthday=" + birthday + ", phone=" + phone + ", admin=" + admin + "]";
	}
	
	
	
	

}
