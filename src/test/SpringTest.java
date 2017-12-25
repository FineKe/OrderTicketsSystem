import com.litesky.controller.LineController;
import com.litesky.dao.LineDao;
import com.litesky.dao.UserDao;
import com.litesky.model.Line;
import com.litesky.model.SysPermission;
import com.litesky.model.SysRole;
import com.litesky.model.User;
import com.litesky.service.LineService;
import com.litesky.service.UserService;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.http.MediaType;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.ResultActions;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestBody;

import javax.annotation.Resource;

/**
 * Created by finefine.com on 2017/12/11.
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations ={"file:src/main/webapp/WEB-INF/spring-mvc.xml","file:src/main/webapp/WEB-INF/applicationContext.xml"} )
@WebAppConfiguration
@Transactional
public class SpringTest {

    @Resource
    LineController lineController;

    MockMvc mockMvc;

    @Before
    public void setup() {
        mockMvc= MockMvcBuilders.standaloneSetup(lineController).build();
    }

    @Resource
    UserDao userDao;

    @Resource
    UserService userService;

    @Resource
    LineService lineService;

    @Resource
    private LineDao lineDao;

    @Test
    public void test() {
        User user=userService.findByUsername("admin");
        for (SysRole role:user.getRoles())
        {
            System.out.println(role.getRole());
            System.out.println(role.getPermissions().size());
            for (SysPermission sysPermission : role.getPermissions()) {
                System.out.println(sysPermission.getPermission());
            }
        }
    }

    @Test
    public void testController() {
        try {
            ResultActions resultActions=mockMvc.perform(MockMvcRequestBuilders.post("/tickets/lines").accept(MediaType.APPLICATION_JSON_UTF8));
            MvcResult mvcResult=resultActions.andReturn();
            String result=mvcResult.getResponse().getContentAsString();
            System.out.println(result);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    @Test
    public void testLineDao() {
//        System.out.println(lineService.deleteById(1l));
        lineDao.delete(0l);

    }
}