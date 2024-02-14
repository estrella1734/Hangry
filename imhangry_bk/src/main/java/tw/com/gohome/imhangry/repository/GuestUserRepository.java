package tw.com.gohome.imhangry.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import tw.com.gohome.imhangry.domain.GuestUser;

public interface GuestUserRepository extends JpaRepository<GuestUser, Integer> {

    boolean existsByEmail(String email);

    boolean existsByPhone(String phone);

    List<GuestUser> findByEmail(String email);

    Optional<GuestUser> findById(Integer id);

}
