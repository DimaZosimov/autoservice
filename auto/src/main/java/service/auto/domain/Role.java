package service.auto.domain;

import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.security.core.GrantedAuthority;

@Entity
@Table(name = "sv_role")
public class Role implements GrantedAuthority{

	@Id
	@Column(name = "role_id")
	private Long roleId;
	@Column(name = "name", nullable = false)
	private String name;
	@Transient
	@ManyToMany(mappedBy = "roles")
	private Set<User> users;
	
	public Role() {
	}
	
	public Role(Long roleId) {
		this.roleId = roleId;
	}
	
	public Role(Long roleId, String name) {
		this.roleId = roleId;
		this.name = name;
	}

	public Long getRoleId() {
		return roleId;
	}

	public void setRoleId(Long roleId) {
		this.roleId = roleId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Set<User> getUsers() {
		return users;
	}

	public void setUsers(Set<User> users) {
		this.users = users;
	}

	@Override
	public String getAuthority() {
		return getName();
	}
	
}
