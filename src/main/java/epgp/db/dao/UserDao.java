package epgp.db.dao;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import epgp.db.dbo.User;

public interface UserDao {

	@Select("SELECT * FROM user WHERE email = #{email}")
	User read(String email);

	@Insert("INSERT INTO user (email, pass) VALUES ( #{email}, #{pass})")
	void create(@Param("email") String email,
			@Param("pass") String pass);

}
