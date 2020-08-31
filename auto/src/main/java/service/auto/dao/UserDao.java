package service.auto.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import service.auto.domain.User;

@Repository
public interface UserDao extends JpaRepository<User, Long>{

	User findByUsername(String username);

	@Modifying
	@Query(name = "update username", 
			value = "UPDATE User SET username = :newUsername WHERE userId = :userId")
	int updateUsername(@Param("userId") Long userId, @Param("newUsername") String username);
	
	@Modifying
	@Query(name = "update password",
			value = "UPDATE User SET password = :newPassword WHERE userId = :userId")
	int updatePassword(@Param("newPassword") String encode, @Param("userId") Long userId);
	
	

}
