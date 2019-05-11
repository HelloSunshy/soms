package com.sunshy.soms.controller;

import com.sunshy.soms.poenum.OrderMasterPoem;
import com.sunshy.soms.poenum.UsersEnum;
import com.sunshy.soms.pojo.*;
import com.sunshy.soms.service.*;
import com.sunshy.soms.util.Key;
import com.sunshy.soms.util.ResultVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * Demo Class
 *
 * @author sunshy
 * @date 2019-04-10   22:24
 */
@Controller
@RequestMapping("/user")
public class UserController {


    @Autowired
    private UserService userService;

    @Autowired
    private OrderMasterService orderMasterService;

    @Autowired
    private DoctorService doctorService;

    @Autowired
    private OrderDetailService orderDetailService;

    @Autowired
    private SymptomService symptomService;


    @RequestMapping("/login")
    public ModelAndView login(String username, String password,
                              Map<String,Object> map, HttpSession session,
                              @RequestParam(value = "page",defaultValue = "1") Integer page,
                              @RequestParam(value = "size",defaultValue = "3") Integer size) {

        if (session.getAttribute("id") == null) {


            UserInfo users = userService.userLogin(username, password);

            if (users == null) {

                map.put("msg", UsersEnum.LOGFAIL.getMsg());

                return new ModelAndView("error", map);
            } else {

                PageRequest pageRequest = new PageRequest(page - 1, size);

                Page<OrderMaster> allByPage = orderMasterService.findByUserIdAndAndOrderStatusOrOrderStatusOrderByUpdateTimeDesc(users.getUserId(), pageRequest,1,2);

                List<DoctorInfo> doctorList = new ArrayList<>();

                for (OrderMaster orderMaster : allByPage.getContent()) {

                    doctorList.add(doctorService.findById(orderMaster.getDoctorId()));

                }

                Page<OrderMaster> byUserIdAndOrderStatusOrderByUpdateTimeDesc =
                        orderMasterService.findByUserIdAndOrderStatusOrderByUpdateTimeDesc(users.getUserId(), pageRequest,3);

                map.put("pageMasterlist", allByPage);

                map.put("successMasterlist",byUserIdAndOrderStatusOrderByUpdateTimeDesc);

                map.put("allpage", allByPage.getTotalPages());

                map.put("currentPage", page);

                map.put("doctorlist", doctorList);

                map.put("username", users);

                session.setAttribute("id", users.getUserId());

                session.setAttribute("ordersize",byUserIdAndOrderStatusOrderByUpdateTimeDesc.getTotalElements());

                session.setMaxInactiveInterval(30 * 60);

                return new ModelAndView("student", map);

            }
        }else {

            PageRequest pageRequest = new PageRequest(page - 1, size);

            Page<OrderMaster> allByPage = orderMasterService.
                    findByUserIdAndAndOrderStatusOrOrderStatusOrderByUpdateTimeDesc((String) session.getAttribute("id"), pageRequest,1,2);

            UserInfo oneUser = userService.findOneUser((String) session.getAttribute("id"));

            List<DoctorInfo> doctorList = new ArrayList<>();

            for (OrderMaster orderMaster : allByPage.getContent()) {

                doctorList.add(doctorService.findById(orderMaster.getDoctorId()));

            }

            Page<OrderMaster> byUserIdAndOrderStatusOrderByUpdateTimeDesc =
                    orderMasterService.findByUserIdAndOrderStatusOrderByUpdateTimeDesc((String)session.getAttribute("id"), pageRequest,3);

            map.put("successMasterlist",byUserIdAndOrderStatusOrderByUpdateTimeDesc);

            map.put("pageMasterlist", allByPage);

            map.put("allpage", allByPage.getTotalPages());

            map.put("currentPage", page);

            map.put("doctorlist", doctorList);

            session.setAttribute("ordersize",byUserIdAndOrderStatusOrderByUpdateTimeDesc.getTotalElements());


            map.put("username", oneUser);

            return new ModelAndView("student", map);

        }


    }


    @RequestMapping("/loginout")
    public ModelAndView loginout(HttpSession session){

        session.removeAttribute("id");

       return new ModelAndView("index");
    }


    @RequestMapping("/lastorder")
    public ModelAndView lastorder(HttpSession session,Map<String,Object> map,
                                  @RequestParam(value = "page",defaultValue = "1") Integer page,
                                  @RequestParam(value = "size",defaultValue = "3") Integer size){

        String id = (String) session.getAttribute("id");

        if (id==null){

            map.put("msg","请先登陆");

            return new ModelAndView("error",map );

        }else {

            PageRequest pageRequest = new PageRequest(page - 1, size);

            Page<OrderMaster> allByPage = orderMasterService.findByUserIdAndOrderStatusOrderByUpdateTimeDesc(id, pageRequest,3);

            UserInfo oneUser = userService.findOneUser(id);

            List<DoctorInfo> all = doctorService.findAll();

            Page<OrderMaster> byUserIdAndOrderStatusOrderByUpdateTimeDesc = orderMasterService.findByUserIdAndOrderStatusOrderByUpdateTimeDesc(oneUser.getUserId(), pageRequest, 3);

            map.put("successMasterlist",byUserIdAndOrderStatusOrderByUpdateTimeDesc);

            map.put("doctorlist",all);

            map.put("username",oneUser);

            map.put("pageMasterlist",allByPage);

            return new ModelAndView("studentlastorder",map);

        }



    }



    @RequestMapping("/toindex")
    public ModelAndView toindex(HttpSession session,Map<String,Object> map){

        String id = (String) session.getAttribute("id");

        if (id == null){

            map.put("msg","请先登陆");

            return new ModelAndView("error", map);

        }else {


            UserInfo oneUser = userService.findOneUser(id);

            oneUser.setUserStatue(1);

            userService.save(oneUser);

            return new ModelAndView("redirect:/user/login");

        }



    }

    @RequestMapping("/order")
    public ModelAndView toOrder(HttpSession session,
                                Map<String,Object> map){

        String id = (String) session.getAttribute("id");

        if (id==null){

            map.put("msg","请先登陆");

            return new ModelAndView("error",map);

        }else {

            UserInfo oneUser = userService.findOneUser(id);

            List<OrderMaster> byUserId = orderMasterService.findByUserId(oneUser.getUserId());

            List<Symptom> allSymptom = symptomService.findALl();

            List<DoctorInfo> doctorInfoList = doctorService.findAll();


            map.put("orderMasterList", byUserId);

            map.put("doctorlist",doctorInfoList);

            map.put("username",oneUser);

            map.put("allSymptom",allSymptom);

            return new  ModelAndView("order");

        }


    }



    @RequestMapping("/create")
    public ModelAndView createOrder(String doctorId,String orderDescription,String userId,String notesname,
                                   String dataname, Map<String,Object> map) {

        try {
            SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd hh:mm");

            Date date = new Date();

            Date parse = simpleDateFormat.parse(dataname);

            OrderMaster orderMaster = new OrderMaster();

            orderMaster.setDoctorId(doctorId);

            orderMaster.setCreateTime(date);

            orderMaster.setOrderStatus(1);

            orderMaster.setUpdateTime(date);

            if (notesname==null){

                orderMaster.setOrderDescription(orderDescription);

            }else {

                orderMaster.setOrderDescription(notesname+orderDescription);

            }


            orderMaster.setUserId(userId);

            orderMaster.setOrderMasterId(Key.timeUuid());

            UserInfo oneUser = userService.findOneUser(userId);

            orderMaster.setOrderTime(parse);

            orderMasterService.createOrderMaster(orderMaster);

            map.put("msg",  oneUser.getUserName());

        }catch (Exception e){

            map.put("msg",OrderMasterPoem.FAIL.getMsg());

            return new ModelAndView("error",map);
        }



        return new ModelAndView("ordersuccess",map);

    }


    @RequestMapping("/tomessage")
    public ModelAndView message(HttpSession session,
                                Map<String,Object> map){

       String id = (String) session.getAttribute("id");

        UserInfo oneUser = userService.findOneUser(id);

        map.put("username",oneUser);

        return new ModelAndView("message",map);

    }

    @RequestMapping("/isok")
    public ModelAndView okMessage(HttpSession session,
                                  Map<String,Object> map){

       String id = (String) session.getAttribute("id");

        UserInfo oneUser = userService.findOneUser(id);

        oneUser.setUserStatue(1);

        try {
            userService.save(oneUser);

        }catch (Exception e){

            map.put("msg","信息确认失败");

            return new ModelAndView("error",map);

        }


        return new ModelAndView("redirect:/user/toindex");


    }



    @RequestMapping("/touserMessage")
    public ModelAndView toMessage(String orderMasterId,Map<String,Object> map,
                                  HttpSession session){

        String id = (String) session.getAttribute("id");


        if (id == null){

            map.put("msg","请先登陆");

            return new ModelAndView("error",map);

        }else {


            OrderMaster byId = orderMasterService.findById(orderMasterId);

            DoctorInfo byId1 = doctorService.findById(byId.getDoctorId());

            List<OrderDetail> byOrderMasterId = orderDetailService.findByOrderMasterId(orderMasterId);

            map.put("orderMaster",byId);

            map.put("doctorIndo",byId1);

            map.put("orderMasterlist",byOrderMasterId);

            return new ModelAndView("userordertail",map);


        }



    }


    @RequestMapping("/doctor")
    @ResponseBody
    public ResultVo getAllDctor(String doctorId){

        DoctorInfo byId = doctorService.findById(doctorId);

        return ResultVo.success(byId);

    }


    @RequestMapping("/payOrder")
    public ModelAndView payOrder(String orderMasterId,Map<String,Object> map,
                                 HttpSession session){

        String id = (String) session.getAttribute("id");


        if (id == null){

            map.put("msg","请先登陆");

            return new ModelAndView("error",map);

        }else {

            OrderMaster byId = orderMasterService.findById(orderMasterId);

            byId.setPayStatus(2);

            orderMasterService.createOrderMaster(byId);

            UserInfo oneUser = userService.findOneUser(byId.getUserId());

            map.put("msg",oneUser.getUserName());

            map.put("username",oneUser);

            return new ModelAndView("paysuccess",map);



        }

    }


    @RequestMapping("/reimburse")
    public ModelAndView reimburse(HttpSession session,Map<String,Object> map){

        String id = (String) session.getAttribute("id");


        if (id == null){

            map.put("msg","请先登陆");

            return new ModelAndView("error",map);

        }else {

            List<OrderMaster> byUserIdAndPayStatus = orderMasterService.findByUserIdAndPayStatus(id, 2);

            UserInfo oneUser = userService.findOneUser(id);

            map.put("byUserIdAndPayStatus", byUserIdAndPayStatus);

            map.put("username", oneUser);





            return new ModelAndView("reimburse", map);
        }

    }



    @RequestMapping("/toreimburse")
    public ModelAndView toreburse(String orderMasterId,HttpSession session,Map<String,Object> map){

        String id = (String) session.getAttribute("id");


        if (id == null){

            map.put("msg","请先登陆");

            return new ModelAndView("error",map);

        }else {

            OrderMaster byId = orderMasterService.findById(orderMasterId);

            byId.setPayStatus(3);

            byId.setOrderStatusToup(1);

            orderMasterService.createOrderMaster(byId);

            UserInfo oneUser = userService.findOneUser(id);

            map.put("username",oneUser);

            map.put("msg",oneUser.getUserName());

            return new ModelAndView("reimbursesuccess",map);


        }


    }



    @RequestMapping("/callerror")
    public ModelAndView callerror(HttpSession session,Map<String,Object> map){

        String id = (String) session.getAttribute("id");

        if (id==null){

            map.put("msg","请先登陆");

            return new ModelAndView("error");

        }else {


            UserInfo oneUser = userService.findOneUser(id);

            oneUser.setUserStatue(2);

            userService.save(oneUser);

            map.put("msg",oneUser.getUserName());

            map.put("username",oneUser);

            return new ModelAndView("callerorsuccess",map);

        }

    }



    @GetMapping("/cancel")
    public ModelAndView cancel(String orderMasterId,Map<String,Object> map,HttpSession session){



        try {

            orderMasterService.delete(orderMasterId);


        }catch (Exception e){

            map.put("msg","订单取消失败");

            return new ModelAndView("error",map);


        }

        map.put("msg","订单取消成功");

        String id = (String) session.getAttribute("id");

        UserInfo oneUser = userService.findOneUser(id);

        map.put("username",oneUser);

        return new ModelAndView("cancelsuccess",map);

    }




    @RequestMapping("/createsure")
    @ResponseBody
    public  ResultVo findByIdAndStatue(HttpSession session){

     String id = (String) session.getAttribute("id");

        List<OrderMaster> byUserIdAndOrderStatus = orderMasterService.findByUserIdAndOrderStatusOrOrderStatus(id, 1,2);

        return ResultVo.success(byUserIdAndOrderStatus);

    }


}
