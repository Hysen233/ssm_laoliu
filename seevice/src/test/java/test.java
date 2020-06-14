import com.kz.pojo.Columns;
import com.kz.service.ColumnsService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.HashMap;
import java.util.List;
import java.util.Set;

@ContextConfiguration(locations = {"classpath:spring-serice.xml"})
@RunWith(SpringJUnit4ClassRunner.class)
public class test {
    @Autowired
    ColumnsService service;
    @Test
    public void t(){
        HashMap allToMap = service.findAllToMap();
        Set set = allToMap.keySet();
        for (Object o : set) {
            System.out.println((Columns)o);
            System.out.println("---------"+(List<Columns>)allToMap.get(o));
        }
    }
}
