package com.ig.web;
import com.ig.pojo.Activity;
import com.ig.pojo.Dictionary;
import com.ig.pojo.PageBean;
import com.ig.pojo.User;
import com.ig.service.ActivityService;
import com.ig.service.DictionaryService;
import com.ig.service.impl.ActivityServiceImpl;
import com.ig.service.impl.DictionaryServiceImpl;
import com.ig.utils.MyDateConverter;
import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.beanutils.ConvertUtils;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.IOUtils;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.lang.reflect.InvocationTargetException;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * @author 李祥
 * @date 18/12/14
 * @version V1.0
 */
public class ActivityServlet extends BaseServlet {
    DictionaryService dictionaryService = new DictionaryServiceImpl();
    ActivityService service = new ActivityServiceImpl();
    /**
     * 活动分页列表
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    public void activityPageList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        DetachedCriteria dc = DetachedCriteria.forClass(Activity.class);
        PageBean pageBean = pageQuery(request, dc);
        List<Activity> rows = pageBean.getRows();
        SimpleDateFormat format = new SimpleDateFormat("dd-HH");
        for (Activity activity:rows){
            if (activity.getEndtime()!=null){
                Date endtime = activity.getEndtime();
                String timeEndStr = format.format(endtime);
                String timeNowStr = format.format(new Date());
                String[] arrEnd = timeEndStr.split("-");
                String[] arrNow = timeNowStr.split("-");
                int absDay =Math.abs(Integer.parseInt(arrEnd[0])-Integer.parseInt(arrNow[0]));
                int absHour = Math.abs(Integer.parseInt(arrEnd[1])-Integer.parseInt(arrNow[1]));
                activity.setEndTimeStr("距离结束还有"+absDay+"天"+absHour+"小时");
            }
        }
        request.setAttribute("pageBean", pageBean);
        request.getRequestDispatcher("/activitylist.jsp").forward(request, response);
    }

    /**
     * 打分投票
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    public void vote(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String score = request.getParameter("score");
        // todo 用户 星星 活动 关联插入
    }

    /**
     * 报名
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    public void baoming(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //关联用户与活动


        System.out.println(111);
    }

    /**
     * 当前用户已发布的活动
     * @param request
     * @param response
     */
    public void hasPutActivity(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User user = (User) request.getSession().getAttribute("user");
        DetachedCriteria dc = DetachedCriteria.forClass(Activity.class);
        dc.add(Restrictions.eq("createby",user));
        // todo 根据用户Id查找当前用户参与的活动
        PageBean pageBean = pageQuery(request, dc);
        request.setAttribute("pageBean", pageBean);
        request.setAttribute("title","当前用户已发布的活动");
        request.getRequestDispatcher("/privilege/back_member.jsp").forward(request,response);
    }

    public PageBean pageQuery(HttpServletRequest request,DetachedCriteria dc){
        String currentPageStr = request.getParameter("currentPage");
        if (currentPageStr == null) {
            currentPageStr = "1";
        }
        int currentPage = Integer.parseInt(currentPageStr);
        int pagesize = 6;
        PageBean pageBean = new PageBean();
        pageBean.setCurrentPage(currentPage);
        pageBean.setDetachedCriteria(dc);
        pageBean.setPageSize(pagesize);
        return service.pageQueryActivity(pageBean);
    }
    /**
     * 当前用户已参加活动
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    public void hasInActivity(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

//        DetachedCriteria dc = DetachedCriteria.forClass(Activity.class);
//        dc.
//        pageQuery(request,dc);

        request.setAttribute("title","当前用户已参加活动");
        request.getRequestDispatcher("/privilege/back_member.jsp").forward(request,response);
    }

    /**
     * 当前用户去发布活动
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    public void postActivity(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("title","当前用户去发布活动");
        request.getRequestDispatcher("/privilege/back_create.jsp").forward(request,response);
    }

    /**
     * 当前用户已投票的活动
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    public void hasVoteActivity(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("title","当前用户已投票的活动");
        request.getRequestDispatcher("/privilege/back_member.jsp").forward(request,response);
    }


    /**
     * 获取活动类型列表
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    public void getActivityType (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Dictionary> dictionaryList = dictionaryService.getActivityType();
        String[] excludes = {"parentid","atype","transport"};
        Object2JsonUtils.java2Json(dictionaryList,excludes,response);
    }
    /**
     * 获取交通方式
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    public void getActivityTransport (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Dictionary> dictionaryList = dictionaryService.getActivityTransport();
        String[] excludes = {"parentid","atype","transport"};
        Object2JsonUtils.java2Json(dictionaryList,excludes,response);
    }

    /**
     * 添加活动
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    public void insertActivity (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Activity activity = new Activity();
        User user = (User) request.getSession().getAttribute("user");
        try {
            Map<String, String[]> map = request.getParameterMap();
            ConvertUtils.register(new MyDateConverter(),Date.class);
            BeanUtils.populate(activity, map);
        } catch (Exception e) {

        }
        UUID uuid = UUID.randomUUID();
        activity.setAcode(uuid.toString());
        activity.setCreateby(user);
        activity.setBan(false);
        activity.setReport(false);
        activity.setCreatetime(new Date());
        activity.setStatus(8);
        Dictionary dictionary = new Dictionary();
        dictionary.setId(Integer.parseInt(request.getParameter("atype")));
        activity.setAtype(dictionary);
        Dictionary dictionary1 = new Dictionary();
        dictionary1.setId(Integer.parseInt(request.getParameter("transport")));
        activity.setTransport(dictionary1);
        service.insert(activity);
        response.sendRedirect(request.getContextPath()+"/privilege/back_create.jsp");
    }
    private Map<String, Object> getUploadFileItem(HttpServletRequest request) throws FileUploadException, IOException {
        Map map = new HashMap();
        //创建磁盘文件项工厂
        DiskFileItemFactory factory = new DiskFileItemFactory();
        //创建文件上传核心对象
        ServletFileUpload upload = new ServletFileUpload(factory);
        //解析request获得上传文件项集合
        List<FileItem> fileItems = upload.parseRequest(request);
        for (FileItem fileItem : fileItems) {
            //判断是否为普通变表单
            boolean formField = fileItem.isFormField();
            if (formField) {
                String fieldName = fileItem.getFieldName();
                String fieldValue = fileItem.getString("utf-8");
                map.put(fieldName, fieldValue);
            } else {
                String fileName = fileItem.getName();
                String realPath = this.getServletContext().getRealPath("upload");
                InputStream input = fileItem.getInputStream();
                OutputStream output = new FileOutputStream(realPath + "/" + fileName);
                IOUtils.copy(input, output);
                input.close();
                output.close();
                fileItem.delete();
                map.put("picture", "upload/" + fileName);
            }
        }
        return map;
    }

    /**
     * 编辑活动
     * @param request
     * @param response
     */
    public void toEditActivity (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idStr = request.getParameter("id");
        int id = Integer.parseInt(idStr);
        Activity activity = service.findOneActivity(id);
        request.setAttribute("activity",activity);
        request.getRequestDispatcher("/privilege/back_edit.jsp").forward(request,response);
    }
    /**
     * 编辑活动
     * @param request
     * @param response
     */
    public void editActivity (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        Map<String, String[]> parameterMap = request.getParameterMap();
        Activity activity = new Activity();
        try {
            ConvertUtils.register(new MyDateConverter(), Date.class);
            BeanUtils.populate(activity, parameterMap);
        } catch (Exception e) {
            e.printStackTrace();
        }
        User user = new User();
        user.setId(Integer.parseInt(request.getParameter("createby")));
        activity.setCreateby(user);
        Dictionary dictionary = new Dictionary();
        String parameter = request.getParameter("atype");
        dictionary.setId(Integer.parseInt(parameter));
        activity.setAtype(dictionary);
        Dictionary dictionary1 = new Dictionary();
        dictionary1.setId(Integer.parseInt(request.getParameter("transport")));
        activity.setTransport(dictionary1);
        service.editActivity(activity);
        hasPutActivity(request,response);
    }

    public void delActivity (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idStr = request.getParameter("id");
        int id = Integer.parseInt(idStr);
        service.delete(id);
        hasPutActivity(request,response);
    }
    public void allActivity (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        DetachedCriteria dc = DetachedCriteria.forClass(Activity.class);
        PageBean pageBean = pageQuery(request, dc);
        request.setAttribute("pageBean", pageBean);
        request.getRequestDispatcher("/back_member.jsp").forward(request, response);
    }

}