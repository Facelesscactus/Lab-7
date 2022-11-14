
package ca.sait.dataaccess;

import ca.sait.models.Role;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.EntityManager;

/**
 *
 * @author jacke
 */
public class RoleDB {
    public List<Role> getAll() throws Exception {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        List<Role> roles = new ArrayList<>();
        roles = em.createNamedQuery("Role.findAll", Role.class).getResultList();

        return roles;
    }
}
