import com.kz.dao.ArticleDao;
import com.kz.dao.ColumnsDao;
import com.kz.dao.UserDao;
import com.kz.pojo.Article;
import com.kz.pojo.Columns;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
@ContextConfiguration(locations = {"classpath*:spring-dao.xml"})
@RunWith(SpringJUnit4ClassRunner.class)
public class test {
    @Autowired
    ArticleDao dao;
    @Test
    public void v(){
        /*Article article = new Article();
        article.setTitle("双系统教程");
        article.setContent("hhhhhhhhh");
        article.setTopping(1);
        article.setDispaly(1);
        article.setColumnsid(1);*/
        System.out.println(dao.findAll());
    }
}

