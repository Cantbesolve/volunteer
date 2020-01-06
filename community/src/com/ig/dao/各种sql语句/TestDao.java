//package com.ig.dao.各种sql语句;
//
//import java.util.Arrays;
//import java.util.List;
//import org.hibernate.Criteria;
//import org.hibernate.Query;
//import org.hibernate.SQLQuery;
//import org.hibernate.Session;
//import org.hibernate.Transaction;
//import org.hibernate.criterion.DetachedCriteria;
//import org.hibernate.criterion.Order;
//import org.hibernate.criterion.Projection;
//import org.hibernate.criterion.Projections;
//import org.hibernate.criterion.Restrictions;
//import org.hibernate.engine.spi.SessionEventListenerManager;
//import org.junit.Test;
//import cn.lx.domain.Customer;
//import cn.lx.domain.LinkMan;
//import cn.lx.domain.Role;
//import cn.lx.domain.User;
//import cn.lx.utils.HibernateUtils;
//
//public class TestDao {
//	@Test
//	public void fun1() {
//		Session session = HibernateUtils.getCurrentSession();
//		Transaction transaction = session.beginTransaction();
//		Customer customer = session.get(Customer.class, 1l);
//		customer.setCust_name("微软公司");
//		customer.setCust_name("腾讯公司");
//		transaction.commit();
//	}
//
//	@Test
//	public void fun2(){
//		Session session = HibernateUtils.getCurrentSession();
//		Transaction transaction = session.beginTransaction();
//		Customer customer = new Customer();
//		customer.setCust_id(1l);//托管|游离
//		customer.setCust_name("网易公司");
//		session.update(customer);//custom被放入session缓存了
//
//		Customer customer2 = session.get(Customer.class, 1l);
//		transaction.commit();
//	}
//
//	@Test
//	public void fun3(){
//		Session session = HibernateUtils.getCurrentSession();
//		Transaction transaction = session.beginTransaction();
//		String hql = "from Customer";
//		Query createQuery = session.createQuery(hql);
//		List<Customer> list = createQuery.list();
//		System.out.println(list);
//		transaction.commit();
//	}
//
//	@Test
//	public void fun4(){
//		Session session = HibernateUtils.getCurrentSession();
//		Transaction beginTransaction = session.beginTransaction();
//		Customer customer = new Customer();
//		customer.setCust_name("360公司");
//		session.save(customer);
//		beginTransaction.commit();
//	}
//
//	@Test
//	public void fun5(){
//		Session session = HibernateUtils.getCurrentSession();
//		Transaction beginTransaction = session.beginTransaction();
//
//		String hql = "from Customer where cust_id = 1";
//		Query query = session.createQuery(hql);
//		Customer customer = (Customer) query.uniqueResult();
//
//		System.out.println(customer);
//		beginTransaction.commit();
//	}
//
//	//------------------------------------------------------------------->>>>>>setParameter()无法使用
//	@Test
//	public void fun6(){
//		Session currentSession = HibernateUtils.getCurrentSession();
//		Transaction beginTransaction = currentSession.beginTransaction();
//		String hql = "from Customer where cust_id = ?";
//		Query query = currentSession.createQuery(hql);
////		query.setParameter("cust_id", 1l);
//		query.setLong(0, 1l);
//		Customer customer = (Customer) query.uniqueResult();
//		System.out.println(customer);
//		beginTransaction.commit();
//	}
//	//------------------------------------------------------------------->>>>>>setParameter()无法使用
//	@Test
//	public void fun7(){
//		Session currentSession = HibernateUtils.getCurrentSession();
//		Transaction beginTransaction = currentSession.beginTransaction();
//		String hql = "from Customer where cust_id =
//
//		";
//		Query query = currentSession.createQuery(hql);
//		query.setParameter("cust_id", 1l);
//		Customer customer = (Customer) query.uniqueResult();
//		System.out.println(customer);
//		beginTransaction.commit();
//	}
//
//	@Test
//	public void fun8(){
//		Session currentSession = HibernateUtils.getCurrentSession();
//		Transaction beginTransaction = currentSession.beginTransaction();
//		String hql = "from Customer";
//		Query query = currentSession.createQuery(hql);
//		query.setFirstResult(1);
//		query.setMaxResults(1);
//		List<Customer> list = query.list();
//		System.out.println(list);
//		beginTransaction.commit();
//
//
//	}
//
//
//	@Test
//	public void fun9(){
//		Session session = HibernateUtils.getCurrentSession();
//		Transaction transaction = session.beginTransaction();
//		Criteria criteria = session.createCriteria(Customer.class);
//		List<Customer> list = criteria.list();
//		System.out.println(list);
//
//		transaction.commit();
//	}
//
//
//	@Test
//	public void fun10(){
//		Session session = HibernateUtils.getCurrentSession();
//		Transaction transaction = session.beginTransaction();
//		Criteria criteria = session.createCriteria(Customer.class);
//		//添加查询参数=》>查询cust_id为1的Customer对象
//		criteria.add(Restrictions.eq("cust_id", 1l));
//		Customer customer = (Customer) criteria.uniqueResult();
//		System.out.println(customer);
//		transaction.commit();
//	}
//
//	@Test
//	public void fun11(){
//		Session session = HibernateUtils.getCurrentSession();
//		Transaction transaction = session.beginTransaction();
//		Criteria criteria = session.createCriteria(Customer.class);
//		criteria.setFirstResult(1);
//		criteria.setMaxResults(1);
//		List<Customer> list = criteria.list();
//		System.out.println(list);
//		transaction.commit();
//	}
//
//	@Test
//	public void fun12(){
//		Session session = HibernateUtils.getCurrentSession();
//		Transaction transaction = session.beginTransaction();
//		Criteria criteria = session.createCriteria(Customer.class);
//		criteria.setProjection(Projections.rowCount());
//		Long count = (Long) criteria.uniqueResult();
//		System.out.println(count);
//		transaction.commit();
//	}
//
//	@Test
//	public void fun13(){
//		Session session = HibernateUtils.getCurrentSession();
//		Transaction transaction = session.beginTransaction();
//		String sql = "select * from cst_customer";
//		SQLQuery sqlQuery = session.createSQLQuery(sql);
//		List<Object[]> list = sqlQuery.list();
////		for(Object[] objects : list){
//////			System.out.println(Arrays.toString(objects));
////			for(Object object : objects){
////				System.out.println(object.toString());
////			}
////		}
//
//		transaction.commit();
//
//	}
//
//	@Test
//	public void fun14(){
//		Session session = HibernateUtils.getCurrentSession();
//		Transaction transaction = session.beginTransaction();
//		String sql = "select *from cst_customer ";
//		SQLQuery sqlQuery = session.createSQLQuery(sql);
//		sqlQuery.addEntity(Customer.class);
//		List<Customer> list = sqlQuery.list();
//		System.out.println(list);
//		transaction.commit();
//	}
//
//	@Test
//	public void fun15(){
//		Session session = HibernateUtils.getCurrentSession();
//		Transaction transaction = session.beginTransaction();
//		String sql = "select * from cst_customer where cust_id = ?";
//		SQLQuery query = session.createSQLQuery(sql);
//		query.setLong(0, 1l);
//		query.addEntity(Customer.class);
//		List<Customer> list = query.list();
//		System.out.println(list);
//		transaction.commit();
//	}
//
//	@Test
//	public void fun16(){
//		Session session = HibernateUtils.getCurrentSession();
//		Transaction transaction = session.beginTransaction();
//		String sql = "select * from cst_customer limit ?,?";
//		SQLQuery query = session.createSQLQuery(sql);
//		query.setParameter(0, 1);
//		query.setParameter(1, 1);
//		query.addEntity(Customer.class);
//		List<Customer> list = query.list();
//		System.out.println(list);
//		transaction.commit();
//	}
////	=======================================================================================================||
//
//	@Test
//	public void fun17(){
//		//1 获得session
//		Session session = HibernateUtils.openSession();
//		//2 开启事务
//		Transaction tx = session.beginTransaction();
//		//-------------------------------------------------
//		//3操作
//		Customer c = new Customer();
//		c.setCust_name("传智播客");
//
//		LinkMan lm1 = new LinkMan();
//		lm1.setLkm_name("黎活明");
//
//		LinkMan lm2 = new LinkMan();
//		lm2.setLkm_name("刘悦东");
//
//		//表达一对多,客户下有多个联系人
//		c.getLinkMans().add(lm1);
//		c.getLinkMans().add(lm2);
//
//		//表达对对对,联系人属于哪个客户
//		lm1.setCustomer(c);
//		lm2.setCustomer(c);
//
////		inverse="true" linkman自己的属性最好是自己来维护，而不是Custom去维护
//		session.save(c);
//		session.save(lm1);
//		session.save(lm2);
//		//-------------------------------------------------
//		//4提交事务
//		tx.commit();
//		//5关闭资源
//		session.close();
//	}
//
//	@Test
//	public void fun18(){
//		Session session = HibernateUtils.openSession();
//		Transaction transaction = session.beginTransaction();
//		Customer customer = session.get(Customer.class, 1l);//打印一遍查询语句
//		LinkMan linkMan1 = new LinkMan();
//		linkMan1.setLkm_name("李祥祥");
//		customer.getLinkMans().add(linkMan1);//打印一遍查询子表，更新子表
//		linkMan1.setCustomer(customer);
//		session.save(linkMan1);//打印插入子表
//		transaction.commit();
//		session.close();
//	}
//
//	@Test
//	public void fun19(){//仅仅删除外键
//		Session session = HibernateUtils.openSession();
//		Transaction transaction = session.beginTransaction();
//		Customer customer = session.get(Customer.class, 1l);
//		LinkMan linkMan = session.get(LinkMan.class, 3l);
//		customer.getLinkMans().remove(linkMan);
//		linkMan.setCustomer(null);
//		transaction.commit();
//		session.close();
//	}
//
////	cascade-save-update
//	@Test
//	public void fun20(){
//		Session session = HibernateUtils.openSession();
//		Transaction transaction = session.beginTransaction();
//		Customer customer = new Customer();
//		customer.setCust_name("传智播客");
//		LinkMan linkMan1 = new LinkMan();
//		linkMan1.setLkm_name("马云");
//		LinkMan linkMan2 = new LinkMan();
//		linkMan2.setLkm_name("马化腾");
//		customer.getLinkMans().add(linkMan1);
//		customer.getLinkMans().add(linkMan2);
//		linkMan1.setCustomer(customer);
//		linkMan2.setCustomer(customer);
//		session.save(customer);
//		transaction.commit();
//		session.close();
//	}
//
////	cascade-delete
//	@Test
//	public void fun21(){
//		Session session = HibernateUtils.openSession();
//		Transaction transaction = session.beginTransaction();
//		Customer customer = session.get(Customer.class, 1l);
//		session.delete(customer);
//		transaction.commit();
//		session.close();
//	}
//
//	@Test
//	public void fun22(){
//		Session session = HibernateUtils.openSession();
//		Transaction transaction = session.beginTransaction();
//		Customer customer = new Customer();
//		customer.setCust_name("北大青鸟");
//		LinkMan linkMan = new LinkMan();
//		linkMan.setLkm_name("李总");
//		customer.getLinkMans().add(linkMan);
//		linkMan.setCustomer(customer);
//		session.save(customer);
//		transaction.commit();
//		session.close();
//	}
//
//
//	@Test
//	public void fun23(){
//		Session session = HibernateUtils.openSession();
//		Transaction transaction = session.beginTransaction();
//		Customer customer = new Customer();
//		customer.setCust_name("腾讯");
//		LinkMan linkMan = new LinkMan();
//		linkMan.setLkm_name("绝地求生");
//		LinkMan linkMan2 = new LinkMan();
//		linkMan2.setLkm_name("王者荣耀");
//		//必须要有一方去维护关系，应该是多的一方
//		linkMan.setCustomer(customer);
//		linkMan2.setCustomer(customer);
//		//表达一对多，客户有多个联系人
//		//如果客户放弃维护与联系人之间的关系，维护关系的代码可以省略
//		//c.getLinkMans().add(linkMan)
//		//c.getLinkMans().add(linkMan2)
//
//		session.save(customer);
//		session.save(linkMan);
//		session.save(linkMan2);
//
//		transaction.commit();
//		session.close();
//	}
//
//	@Test
//	public void fun24(){
//		Session session = HibernateUtils.openSession();
//		Transaction transaction = session.beginTransaction();
//
//		User user = new User();
//		user.setUser_name("王健林");
//		User user2 = new User();
//		user2.setUser_name("王思聪");
//
//		Role role = new Role();
//		role.setRole_name("董事长");
//
//		Role role2 = new Role();
//		role2.setRole_name("副董事长");
//
//		user.getRoles().add(role);
//		user.getRoles().add(role2);
//		user2.getRoles().add(role);
//		user2.getRoles().add(role2);
//		//因为inverse(false);只有User去维护外键关系
//		session.save(user2);
//		session.save(user);
//		//因为开启级联更新，所以少写两行save();
//		transaction.commit();
//		session.close();
//	}
//
//	@Test
//	public void fun25(){
//		//为王思聪增加一个新角色
//		Session session = HibernateUtils.openSession();
//		Transaction transaction = session.beginTransaction();
//
//		User user = session.get(User.class, 1l);
//		Role role = new Role();
//		role.setRole_name("IG下路");
//		user.getRoles().add(role);
//
//		transaction.commit();
//		session.close();
//	}
//
//	@Test
//	public void fun26(){
//		Session session = HibernateUtils.openSession();
//		Transaction transaction = session.beginTransaction();
//
//		User user = session.get(User.class, 1l);
//		Role role = session.get(Role.class, 1l);
//		Role role2 = session.get(Role.class, 3l);
//
//		user.getRoles().remove(role);
//		user.getRoles().remove(role2);
//
//		transaction.commit();
//		session.close();
//	}
//
////	========================================================================================================|||||
//
//	@Test
//	public void fun27(){
//		Session session = HibernateUtils.openSession();
//		Transaction transaction = session.beginTransaction();
////		---------------------------------------------------------
//		String hql = " from cn.lx.domain.Customer";
//		String hql2 = " from Customer";
//		String hql3 = " from java.lang.Object";
//
//		Query query = session.createQuery(hql3);
//		List<Customer> list = query.list();
//		System.out.println(list);
////		---------------------------------------------------------
//		transaction.commit();
//		session.close();
//	}
//
//	@Test
//	public void fun28(){
//		Session session = HibernateUtils.openSession();
//		Transaction transaction = session.beginTransaction();
////		---------------------------------------------------------
//		String hql1 = "from Customer order by cust_id desc";
//		Query query = session.createQuery(hql1);
//		List<Customer> list = query.list();
//		System.out.println(list);
////		---------------------------------------------------------
//		transaction.commit();
//		session.close();
//	}
//
//
//	@Test
//	public void fun29(){
//		Session session = HibernateUtils.openSession();
//		Transaction transaction = session.beginTransaction();
////		---------------------------------------------------------
//
//		String hql = "from Customer where cust_id = ?";
//		Query query = session.createQuery(hql);
//		query.setParameter(0, 2l);
//		List<Customer> list = query.list();
//		System.out.println(list);
////		---------------------------------------------------------
//		transaction.commit();
//		session.close();
//	}
//	@Test
//	public void fun30(){
//		Session session = HibernateUtils.openSession();
//		Transaction transaction = session.beginTransaction();
////		---------------------------------------------------------
//		String hql = "from Customer ";
//		Query query = session.createQuery(hql);
//		//当前页数-1）*每页数量
//		query.setFirstResult(1);
//		query.setMaxResults(2);
//		List<Customer> list = query.list();
//		System.out.println(list);
////		---------------------------------------------------------
//		transaction.commit();
//		session.close();
//	}
//
//
//	@Test
//	public void fun31(){
//		Session session = HibernateUtils.openSession();
//		Transaction transaction = session.beginTransaction();
////		---------------------------------------------------------
//		String hql1 = "select count(*) from Customer ";
//		String hql2 = "select sum(cust_id) from Customer ";
//		String hql3 = "select avg(*) from Customer ";
//		String hql4 = "select max(*) from Customer ";
//		String hql5 = "select min(*) from Customer ";
//		Query query = session.createQuery(hql2);
//		Number number = (Number) query.uniqueResult();
//		System.out.println(number);
////		---------------------------------------------------------
//		transaction.commit();
//		session.close();
//	}
//
//	@Test
//	public void fun32(){
//		Session session = HibernateUtils.openSession();
//		Transaction transaction = session.beginTransaction();
////		---------------------------------------------------------
//		String hql1 = "select cust_name from Customer";
//		String hql2 = "select cust_name,cust_id from Customer";
//		String hql3 = "select new Customer(cust_id,cust_name) from Customer";
//		Query query = session.createQuery(hql3);
//
//		List<Customer> list = query.list();
//		System.out.println(list);
////		---------------------------------------------------------
//		transaction.commit();
//		session.close();
//	}
//	@Test
//	public void fun33(){
//		Session session = HibernateUtils.openSession();
//		Transaction transaction = session.beginTransaction();
////		---------------------------------------------------------
//		String hql = "from Customer c inner join c.linkMans";
//		Query query = session.createQuery(hql);
//		List<Object[]> list = query.list();
//		for(Object[] objects : list){
//			System.out.println(Arrays.toString(objects));
//		}
////		---------------------------------------------------------
//		transaction.commit();
//		session.close();
//	}
//
//
//	@Test
//	public void fun34(){
//		Session session = HibernateUtils.openSession();
//		Transaction transaction = session.beginTransaction();
////		---------------------------------------------------------
//		String qhl = "from Customer c inner join fetch c.linkMans";
//		Query query = session.createQuery(qhl);
//		List<Customer> list = query.list();
//		System.out.println(list);
////		---------------------------------------------------------
//		transaction.commit();
//		session.close();
//	}
//	@Test
//	public void fun35(){
//		Session session = HibernateUtils.openSession();
//		Transaction transaction = session.beginTransaction();
////		---------------------------------------------------------
//		String hql = "from Customer c left join c.linkMans";
//		Query query = session.createQuery(hql);
//		List<Object[]> list = query.list();
//		for(Object[] objects : list){
//			System.out.println(Arrays.toString(objects));
//		}
//
//
//
////		---------------------------------------------------------
//		transaction.commit();
//		session.close();
//	}
//
//	@Test
//	public void fun36(){
//		Session session = HibernateUtils.openSession();
//		Transaction transaction = session.beginTransaction();
////		---------------------------------------------------------
//		Criteria criteria = session.createCriteria(Customer.class);
//		List<Customer> list = criteria.list();
//		System.out.println(list);
//
////		---------------------------------------------------------
//		transaction.commit();
//		session.close();
//	}
//
//
//	@Test
//	public void fun37(){
//		Session session = HibernateUtils.openSession();
//		Transaction transaction = session.beginTransaction();
////		---------------------------------------------------------
//		Criteria criteria = session.createCriteria(Customer.class);
//		criteria.add(Restrictions.eq("cust_id", 2l));
//
//		Customer customer = (Customer) criteria.uniqueResult();
//		System.out.println(customer);
////		---------------------------------------------------------
//		transaction.commit();
//		session.close();
//	}
//	@Test
//	public void fun38(){
//		Session session = HibernateUtils.openSession();
//		Transaction transaction = session.beginTransaction();
////		---------------------------------------------------------
//		Criteria criteria = session.createCriteria(Customer.class);
//		criteria.setFirstResult(0);
//		criteria.setMaxResults(2);
//		List<Customer> list = criteria.list();
//		System.out.println(list);
//
////		---------------------------------------------------------
//		transaction.commit();
//		session.close();
//	}
//
//
//	@Test
//	public void fun39(){
//		Session session = HibernateUtils.openSession();
//		Transaction beginTransaction = session.beginTransaction();
//
//		Criteria criteria = session.createCriteria(Customer.class);
//		criteria.addOrder(Order.desc("cust_id"));
//		List<Customer> list = criteria.list();
//		System.out.println(list);
//
//
//		beginTransaction.commit();
//		session.close();
//	}
//
//
//	@Test
//	public void fun40(){
//		Session session = HibernateUtils.openSession();
//		Transaction transaction = session.beginTransaction();
////		---------------------------------------------------------
//		Criteria criteria = session.createCriteria(Customer.class);
//		criteria.setProjection(Projections.rowCount());
//		Number number = (Number) criteria.uniqueResult();
//		System.out.println(number);
////		---------------------------------------------------------
//		transaction.commit();
//		session.close();
//	}
//	//离线Criteria
//	@Test
//	public void fun41(){
////		---------------------------------------------------------
//		DetachedCriteria criteria = DetachedCriteria.forClass(Customer.class);
//		criteria.add(Restrictions.idEq(1l));
//
//
//		Session session2 = HibernateUtils.openSession();
//		Transaction transaction = session2.beginTransaction();
//
//		Criteria criteria2 = criteria.getExecutableCriteria(session2);
//		Customer customer = (Customer) criteria2.uniqueResult();
//		System.out.println(customer);
//
////		---------------------------------------------------------
//		transaction.commit();
//		session2.close();
//	}
//	//离线Criteria
//	@Test
//	public void fun42(){
////		---------------------------------------------------------
//
//		Session session2 = HibernateUtils.openSession();
//		Transaction transaction = session2.beginTransaction();
//		Customer customer = session2.get(Customer.class, 1l);
//		LinkMan linkMan = new LinkMan();
//		linkMan.setLkm_name("天天酷跑");
//		linkMan.setCustomer(customer);
//
//		session2.save(linkMan);
////		---------------------------------------------------------
//		transaction.commit();
//		session2.close();
//	}
//
//	@Test
//	public void fun43(){
//		Session session = HibernateUtils.openSession();
//		Transaction transaction = session.beginTransaction();
//		String hql = "from LinkMan ";
//		Query query = session.createQuery(hql);
//		List<LinkMan> list = query.list();
//		System.out.println(list);
//		transaction.commit();
//		session.close();
//	}
//
//
//
//}
