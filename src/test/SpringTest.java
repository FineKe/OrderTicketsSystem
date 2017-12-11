import com.litesky.dao.UserDao;
import com.litesky.model.User;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import javax.annotation.Resource;

/**
 * Created by finefine.com on 2017/12/11.
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations ={"file:src/main/webapp/WEB-INF/spring-mvc.xml","file:src/main/webapp/WEB-INF/applicationContext.xml"} )
public class SpringTest {

    @Resource
    UserDao userDao;

    @Test
    public void test() {
        User user=new User();
        user.setName("张三");
        user.setPwd("123");
        User user1=userDao.save(user);
        System.out.println(user1.toString());
    }
}