package com.ig.web;
import com.ig.pojo.Activity;
import com.ig.service.TestService;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import java.util.List;

public class TestWeb {

    public static void main(String[]args){
        TestService cs = new TestService();
        //模糊查询+查询
        select(cs);
    }

    public static void select(TestService cs){
        //2判断查询条件是否不为空
        DetachedCriteria dc = DetachedCriteria.forClass(Activity.class);
        String title = "";
        if(title!=null && !"".equals(title)){
            dc.add(Restrictions.like("atitle", "%"+title+"%"));
        }
        //不为空=>添加条件
        //3 调用Service查询所有客户
        List<Activity> list = cs.getAll(dc);
        System.out.println(list.get(0).getAtitle());
    }
}
