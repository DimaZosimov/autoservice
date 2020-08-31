package service.auto.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import service.auto.domain.Role;

public interface RoleDao extends JpaRepository<Role, Long>{

}
