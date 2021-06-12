package com.just.controller;

import com.just.pojo.*;
import com.just.service.SysService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
@RequestMapping("/system")
public class SysController {
    @Autowired
    private SysService sysService;

    /*
     * 订单管理
     * */

    /**
     * 征订信息统计与分析
     * @param model
     * @param userName
     * @return
     */
    @RequestMapping("/getSubData")
    public String getSubData(Model model, String userName) {

        // 班级订购率图
        HashMap<String, Integer> classRate = new HashMap<>();
        // 教材订购率
        // TreeMap<String,Integer> tbookRate = new TreeMap<>();
        // 班级信息
        ArrayList<Class1> classList = (ArrayList<Class1>) sysService.getAllClass();
        // 按班级排序
        // num是实际班级订购总数
        // userId是使用教材的种类数量。userId * 班级人数 = 预期订购数量
        List<Order> orderList1 = sysService.getAllOrderinclass();
        // 按
        // List<Order> orderList2 = sysService.getAllOrderInTbookId();
        for (Order order : orderList1) {
            for (int i = 0; i < classList.size(); i++) {
                if (order.getOrderClass().equals(classList.get(i).getClassId())) {
                    int rate = order.getNum() * 100 / (order.getUserId() * classList.get(i).getNum());

                    classRate.put(order.getOrderClass(), rate);
                    // classList.remove(i);
                    // System.out.println(order.getOrderClass() + ":" + rate + "%");
                }
            }
        }
        System.out.println();
        System.out.println("bookRate");
        TreeMap<Integer,Integer> bookActualNumMap = new TreeMap<>();
        TreeMap<Integer,Integer> bookExpectNumMap = new TreeMap<>();
        List<Order> orderList = sysService.getOrderByState(4);
/*        for (Order order :
                orderList) {
            System.out.println(order);
        }*/
        for (Order order : orderList) {
            if (bookActualNumMap.get(order.gettBookId()) != null) {
                // 实际数量
                bookActualNumMap.put(order.gettBookId(), bookActualNumMap.get(order.gettBookId()) + order.getNum());
                // System.out.println("Actual"+order.gettBookId()+":"+ bookActualNumMap.get(order.gettBookId()));
                // 预期数量
                for (int i = 0; i <classList.size(); i++) {
                    if (classList.get(i).getClassId().equals(order.getOrderClass())) {
                        bookExpectNumMap.put(order.gettBookId(), bookExpectNumMap.get(order.gettBookId()) + classList.get(i).getNum());
                    }
                }
                // System.out.println("Expect"+order.gettBookId()+":"+bookExpectNumMap.get(order.gettBookId()));
            }else {
                // System.out.println("new Actual");
                // 实际数量
                bookActualNumMap.put(order.gettBookId(), order.getNum());
                // 预期数量
                // System.out.println("new Expect");
                for (int i = 0; i < classList.size(); i++) {
                    // System.out.println(class1.getClassId()+":"+class1.getNum());
                    if (classList.get(i).getClassId().equals(order.getOrderClass())) {
                        bookExpectNumMap.put(order.gettBookId(), classList.get(i).getNum());
                    }
                }
                // System.out.println(bookExpectNumMap.containsKey(order.gettBookId()));
            }
        }

        // 教材订购率
        // System.out.println(bookActualNumMap.size());
        // System.out.println(bookExpectNumMap.size());
        List<TextBook> textBookList = sysService.getAllTextbook();
        HashMap<String,Integer> bookRate = new HashMap<>();
        for (TextBook textbook : textBookList) {
            if (bookActualNumMap.containsKey(textbook.getBookId())){
                int rate = (bookActualNumMap.get(textbook.getBookId())*100)/bookExpectNumMap.get(textbook.getBookId());
                bookRate.put("'"+ textbook.getBookName()+"'",rate);
                // System.out.println(textbook.getBookName() + ":" + rate + "%");
            }
        }


        // 各个出版社的订购数量
        List<Order> orderListGyPublish = sysService.getAllOrderGyPublish();
        // System.out.println(orderListGyPublish);
        Map<String,Integer> pubMap = new HashMap<>();
        for (Order order :
                orderListGyPublish) {
            pubMap.put("'" + order.getTextBook().getBookName() + "'",order.getNum());
        }

        // 各个年段的订购数量
        // 1.判断当前的大一~大四分别是哪一级
        // 2.计算订购数量

        model.addAttribute("pubMap",pubMap);
        model.addAttribute("bookRate",bookRate);
        model.addAttribute("classRate", classRate);
        return "master/deptDataAnalysis/deptDataAnalysis";
    }

    @RequestMapping("/orderList")
    public String getAllOrder(Model model, int userType, String userName) {
        List<Order> orderList = sysService.getAllOrder();

        User user = sysService.selectUserByName(userName);

/*        for (Order order :
                orderList) {
            System.out.println(order.toString());
        }*/

        model.addAttribute("user", user);
        model.addAttribute("orderList", orderList);
        return "/admin/orderList";
    }

    @RequestMapping("/editOrder")
    public String editOrder(Model model, Integer id, Integer userId) {

        User user = sysService.findUserById(userId);
        Order order = sysService.getOrderById(id);
        List<TextBook> textBookList = sysService.getAllTextbook();
        model.addAttribute("user", user);
        model.addAttribute("order", order);
        model.addAttribute("textbookList", textBookList);
        return "/order/editOrder";
    }

    @RequestMapping("/teacherEditOrder")
    public String teacherEditOrder(Model model, Integer id, Integer userId) {

        User user = sysService.findUserById(userId);
        Order order = sysService.getOrderById(id);
        List<TextBook> textBookList = sysService.getAllTextbook();
        model.addAttribute("user", user);
        model.addAttribute("order", order);
        model.addAttribute("textbookList", textBookList);
        return "/teacher/editOrder";
    }


    @RequestMapping("/updateOrder")
    @ResponseBody
    public int updateOrder(Order order) {
        System.out.println(order);
        // 订单总额
        TextBook textBook = sysService.getTextbookById(order.gettBookId());
        // textBook.getPrice()*order.getNum()
        order.setSumPrice(BigDecimal.valueOf(textBook.getPrice() * order.getNum()));
        // 修改后的时间
        Date date = new Date(System.currentTimeMillis());
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        String dateStr = sdf.format(date);
        order.setOrderDate(dateStr);

        System.out.println(order);
        int opNum = sysService.updateOrder(order);
        System.out.println(opNum);
        return opNum;
    }


    @RequestMapping("/addOrder")
    public String addOrder(Model model, String userName) {
        List<TextBook> textBookList = sysService.getAllTextbook();
        User userByLogin = sysService.selectUserByName(userName);
        model.addAttribute("textbookList", textBookList);
        model.addAttribute("user", userByLogin);
        return "order/addOrder";
    }

    @RequestMapping("/teacherAddOrder")
    public String teacherAddOrder(Model model, String userName) {
        List<TextBook> textBookList = sysService.getAllTextbook();
        User userByLogin = sysService.selectUserByName(userName);
        model.addAttribute("textbookList", textBookList);
        model.addAttribute("user", userByLogin);
        return "teacher/addOrder";
    }

    @RequestMapping(value = "/insertOrder")
    @ResponseBody
    public int insertOrder(Order order) {

        /*System.out.println(userId+" "+ tBookId + " " + orderClass+ " " + num);
        Order order = new Order();
        order.setUserId(userId);
        order.settBookId(tBookId);
        order.setOrderClass(orderClass);*/
        System.out.println(order);
        // order.setNum(num);
        // 订单总额
        TextBook textBook = sysService.getTextbookById(order.gettBookId());
        System.out.println(textBook);
        // textBook.getPrice()*order.getNum()
        order.setSumPrice(BigDecimal.valueOf(textBook.getPrice() * order.getNum()));
        // 修改后的时间
        Date date = new Date(System.currentTimeMillis());
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        String dateStr = sdf.format(date);
        order.setOrderDate(dateStr);
        System.out.println(order);

        int opNum = sysService.insertOrder(order);

        // System.out.println("opNum"+opNum);
        return opNum;
    }

    @RequestMapping("/passOrderBySec")
    @ResponseBody
    public int passOrderBySec(int id) {
        int opNum = sysService.updateOrderState(id, 1);
        return opNum;
    }

    @RequestMapping("/unPassOrderBySec")
    @ResponseBody
    public int unPassOrderBySec(int id) {
        int opNum = sysService.updateOrderState(id, 3);
        return opNum;
    }

    @RequestMapping("/passOrderByMas")
    @ResponseBody
    public int passOrderByMas(int id) {
        int opNum = sysService.updateOrderState(id, 2);
        return opNum;
    }

    @RequestMapping("/unPassOrderByMas")
    @ResponseBody
    public int unPassOrderByMas(int id) {
        int opNum = sysService.updateOrderState(id, 3);
        return opNum;
    }

    @RequestMapping("/waitOrderList")
    public String waitOrderList(Model model, @RequestParam("userName") String userName) {

        // System.out.println(userName);
        User userInfo = sysService.selectUserByName(userName);
        // System.out.println(userInfo);
        model.addAttribute("user", userInfo);
        List<Order> masterOrderList = sysService.getOrderByStateAndDept(userInfo.getUserDept(), 1);
        model.addAttribute("orderList", masterOrderList);

        return "/master/waitOrderList";
    }

    @RequestMapping("/passedOrderList")
    public String passedOrderList(Model model, @RequestParam("userName") String userName) {

        User userInfo = sysService.selectUserByName(userName);
        model.addAttribute("user", userInfo);

        List<Order> masterOrderList = sysService.getOrderByStateAndDept(userInfo.getUserDept(), 2);
        model.addAttribute("orderList", masterOrderList);
        return "master/passedOrderList";
    }

    @RequestMapping("/teaPassedOrderList")
    public String teaPassedOrderList(Model model, String userName) {

        User userInfo = sysService.selectUserByName(userName);
        model.addAttribute("user", userInfo);

        List<Order> passOrderList = sysService.getOrderByUserAndState(userInfo.getUserId(), 2);
        model.addAttribute("passList", passOrderList);
        return "teacher/teaPassedOrderList";
    }

    @RequestMapping("/teaUnPassOrderList")
    public String teaUnPassOrderList(Model model, String userName) {

        User userInfo = sysService.selectUserByName(userName);
        model.addAttribute("user", userInfo);

        List<Order> unPassOrderList = sysService.getOrderByUserAndState(userInfo.getUserId(), 3);
        model.addAttribute("unpassList", unPassOrderList);
        return "teacher/teaUnPassOrderList";
    }

    @RequestMapping("/secWaitOrderList")
    public String secWaitOrderList(Model model, String userName) {

        User userInfo = sysService.selectUserByName(userName);
        model.addAttribute("user", userInfo);

        List<Order> secOrderList = sysService.getOrderByStateAndDept(userInfo.getUserDept(), 0);
        model.addAttribute("orderList", secOrderList);
        return "secretary/secWaitOrderList";
    }

    @RequestMapping("/manPassedOrderList")
    public String manPassedOrderList(Model model, String userName) {

        User userInfo = sysService.selectUserByName(userName);
        model.addAttribute("user", userInfo);

        List<Order> manOrderList = sysService.getManOrderByState(2);
        for (Order o :
                manOrderList) {
            System.out.println(o.toString());
        }
        List<Order> resultOrderList = new ArrayList<>();
        ArrayList<String> arrayList = new ArrayList<>();
        Order orderTemp = null;
        int i = 0;
        for (Order order :
                manOrderList) {
            System.out.println("this turn id: " + order.getId());
            if (orderTemp == null) {
                System.out.println("  orderId: " + order.getId());
                orderTemp = order;
                orderTemp.setId(i);
                orderTemp.setNote(order.getId().toString());
                //orderIdArr[0] = order.getId().toString()+",";
            } else {
                if (order.gettBookId() == orderTemp.gettBookId()) {
                    orderTemp.setNum(order.getNum() + orderTemp.getNum());
                    orderTemp.setSumPrice(order.getSumPrice().add(orderTemp.getSumPrice()));
                    System.out.println("  now oderTemp.note = " + orderTemp.getNote() + " ");
                    orderTemp.setNote(orderTemp.getNote() + "," + order.getId().toString());
                    System.out.println("  after add orderID" + order.getId() + " orderTemp.note = " + orderTemp.getNote() + " ");
                    //orderIdArr[i] += order.getId().toString()+",";
                } else {
                    i++;
                    resultOrderList.add(orderTemp);
                    orderTemp = order;
                    orderTemp.setNote(order.getId().toString());
                    System.out.println("  orderId: " + order.getId());
                    orderTemp.setId(i);


                    //orderIdArr[i] = order.getId().toString()+",";
                }
            }
        }
        resultOrderList.add(orderTemp);

        //System.out.println(arrayList);


        resultOrderList.remove(0);

        for (Order o :
                resultOrderList) {
            System.out.print(o.getNote() + " ");
        }
        System.out.println();
        model.addAttribute("orderList", resultOrderList);
        return "management/manPassedOrderList";
    }


    @RequestMapping("/manSendOrderList")
    @ResponseBody
    public int manSendOrderList(@RequestParam("idStr") String idStr) {

        // System.out.println(idStr);
        String[] strs = idStr.split(",");
        List<Order> orderList = new ArrayList<>();
        int opNum = 0;

        for (String str :
                strs) {
            Order order = sysService.getOrderById(Integer.parseInt(str));
            opNum += sysService.updateOrderState(Integer.parseInt(str), 4);
            orderList.add(order);
        }

        /*for (Order o :
                orderList) {
            System.out.println(o.toString());
        }*/
        // System.out.println();

        return opNum;
    }


    /*
     * 图书管理
     * */

    @RequestMapping("/textbookList")
    public String getAllTextbook(Model model, int userType, String userName) {

        User userByLogin = sysService.selectUserByName(userName);

        List<TextBook> textbookList = sysService.getAllTextbook();
        // System.out.println(textbookList);
        List<PublishHouse> pubList = sysService.getAllPublish();
        // System.out.println(pubList);
        model.addAttribute("user", userByLogin);
        model.addAttribute("textbookList", textbookList);
        model.addAttribute("publishList", pubList);
        return "admin/textbookList";
    }

    @RequestMapping("/editTextbook")
    public String editTextbook(Model model, Integer bookId, String userName) {

        User user = sysService.selectUserByName(userName);

        // System.out.println(bookId);
        TextBook textBook = sysService.getTextbookById(bookId);
        List<PublishHouse> pubList = sysService.getAllPublish();
        // System.out.println(textBook);
        model.addAttribute("user", user);
        model.addAttribute("textbook", textBook);
        model.addAttribute("publishList", pubList);
        return "admin/editTextbook";
    }

    @RequestMapping("/updateTextbook")
    @ResponseBody
    public int updateTextbook(TextBook textBook) {
        // System.out.println(textBook);
        int opNum = sysService.updateTextbook(textBook);
        return opNum;
    }

    @RequestMapping("/addTextbook")
    public String addTextbook(Model model, String userName) {
        User user = sysService.selectUserByName(userName);
        List<PublishHouse> pubList = sysService.getAllPublish();
        model.addAttribute("user", user);
        model.addAttribute("publishList", pubList);
        return "admin/addTextbook";
    }

    @RequestMapping("/insertTextbook")
    @ResponseBody
    public int insertTextbook(TextBook textBook) {

        int opNum = sysService.insertTextbook(textBook);

        return opNum;
    }

    @RequestMapping("/deleteTextbookById")
    @ResponseBody
    public int deleteTextbookById(Integer bookId) {
        System.out.println(bookId);
        int opNum = sysService.deleteTextbookById(bookId);
        return opNum;
    }

    /*
     * 用户管理
     * */

    @RequestMapping("/login")
    public String login() {
        return "login";
    }

    /*
     * 1.成功登录
     * 2.密码错误
     * 3.用户名不存在
     * */
    @RequestMapping("/checkUser")
    @ResponseBody
    public int checkUser(Model model, User user) {
        System.out.println("check" + user.toString());
        User userByLogin = sysService.findUserByLogin(user.getUserName());
        System.out.println(userByLogin);
        int reStr = 0;
        if (userByLogin == null) {
            reStr = 8;
        } else {
            if (userByLogin.getUserState() == 1) {
                if (user.getUserName().equals(userByLogin.getUserName())) {
                    if (user.getPassword().equals(userByLogin.getPassword())) {
                        System.out.println("登录成功，确认权限");
                        reStr = userByLogin.getUserType();
                    } else {
                        reStr = 7;
                    }
                } else {
                    reStr = 8;
                }
            } else {
                reStr = 9;
            }
        }
        System.out.println(reStr);
        return reStr;
    }

    @RequestMapping("/router")
    public String router(Model model, @RequestParam("role") int role, @RequestParam("userName") String userName) {
        String path = null;
        User userInfo = sysService.selectUserByName(userName);
        model.addAttribute("user", userInfo);
        // System.out.println(userName);
        switch (role) {
            case 1:
                path = "role/admin";
                break;
            case 2:
                path = "role/management";
                break;
            case 3:
                path = "role/master";
                break;
            case 4:
                path = "role/secretary";
                break;
            case 5:
                path = "role/teacher";
                break;
        }
        // System.out.println(path);
        return path;
    }


    @RequestMapping("/signup")
    public String signUp() {
        return "signup";
    }

    @RequestMapping("/insertUser")
    @ResponseBody
    public Integer insertUser(User user) {
        int opNum = 0;
        System.out.println(user.toString());
        if (user.getUserDept() != null &&
                user.getUserName() != null &&
                user.getPassword() != null &&
                user.getSerialId() != null &&
                user.getUserPhone() != null &&
                user.getUserType() != null) {
            System.out.println("insert");
            opNum = sysService.insertUser(user);
            System.out.println("isnert successfully");
        } else {
            opNum = -1;
        }
        System.out.println(opNum);
        return opNum;
    }

    @RequestMapping("/getUser")
    public String selectUser(Model model, @RequestParam("userName") String userName,
                             @RequestParam("userType") int userType, @RequestParam("userId") int userId,
                             @RequestParam("op") Integer op) {
        //System.out.println("getUser"+userName+op);
        User opUser = sysService.selectUserByName(userName);
        model.addAttribute("user", opUser);
        User userInfo = sysService.findUserById(userId);
        model.addAttribute("userInfo", userInfo);
        String path = "";
        switch (userType) {
            case 1:
                path += "admin";
                break;
            case 2:
                path += "management";
                break;
            case 3:
                path += "master";
                break;
            case 4:
                path += "secretary";
                break;
            case 5:
                path += "teacher";
                break;
        }
        if (op == 1) {
            path += "/userInfo";
        } else if (op == 2) {
            path += "/updateInfo";
        } else {
            path = "other/error";
        }
        System.out.println(path);
        return path;
    }

    @RequestMapping("/updateUser")
    @ResponseBody
    public int updateUser(User user) {
        System.out.println(user);
        int opNum = sysService.updateUser(user);
        return opNum;
    }

    @RequestMapping("/deleteUserById")
    @ResponseBody
    public int deleteUserById(int userId) {

        int opNum = sysService.deleteUserById(userId);

        return opNum;
    }

    @RequestMapping("/getPwd")
    public String getPassord(Model model, @RequestParam("userId") Integer userId, @RequestParam("password") String password) {
        User user1 = new User();
        System.out.println(userId + ":" + password);
        user1.setUserId(userId);
        user1.setPassword(password);
        model.addAttribute("user", user1);
        return "user/updatePwd";
    }

    @RequestMapping("/updatePassword")
    public String updatePassord(Model model, String userName, int userType) {
        User user1 = sysService.selectUserByName(userName);
        String path = "";
        switch (userType) {
            case 1:
                path += "admin";
                break;
            case 2:
                path += "management";
                break;
            case 3:
                path += "master";
                break;
            case 4:
                path += "secretary";
                break;
            case 5:
                path += "teacher";
                break;
        }

        model.addAttribute("user", user1);
        return path + "/updatePwd";
    }

    @RequestMapping("/updatePwd")
    @ResponseBody
    public int updatePwd(@RequestParam("userId") Integer userId, @RequestParam String password) {
        int opNum = sysService.updatePwd(userId, password);
        return opNum;
    }

    @RequestMapping("/userList")
    public String userList(Model model, String userName, int userType) {
        User selectedUser = sysService.selectUserByName(userName);
        model.addAttribute("user", selectedUser);

        List<User> userList = sysService.getAllUser();
        System.out.println(userList);
        model.addAttribute("userList", userList);
        return "user/userList";

    }


    /*
     * 出版社管理
     * */

    /*
    * 班级管理
    * */

}

