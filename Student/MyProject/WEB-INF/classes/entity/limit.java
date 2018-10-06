package entity;

public class Limit {
	private String username;
	private String password;
	private String name;
	private String level;

	public Limit() {
		super();
	}

	public Limit(String username, String password) {
		this.username = username;
		this.password = password;
		name = null;
		level = null;
	}

	public Limit(String username, String password, String name, String level) {
		this.username = username;
		this.password = password;
		this.name = name;
		this.level = level;
	}

	public boolean canDo(int control) {
		switch (level) {
		case "系统管理员":
			if (control >= 1)
				return true;
		case "卫生检察员":
			if (control >= 2)
				return true;
		case "班级负责人":
			if (control >= 3)
				return true;
		case "学生":
			if (control == 4)
				return true;
			break;
		}
		return false;
	}

	public int getIntLevel() {
		switch (level) {
		case "学生":
			return 1;
		case "班级负责人":
			return 2;
		case "卫生检查员":
			return 3;
		case "系统管理员 ":
			return 4;
		}
		return 0;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
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

	public String getLevel() {
		return level;
	}

	public void setLevel(String level) {
		this.level = level;
	}

	@Override
	public String toString() {
		return "Limit [username=" + username + ", password=" + password + ", name=" + name + ", level=" + level + "]";
	}

}
