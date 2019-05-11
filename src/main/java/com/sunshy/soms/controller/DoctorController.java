package com.sunshy.soms.controller;

import com.sun.org.apache.xpath.internal.operations.Mod;
import com.sunshy.soms.poenum.UsersEnum;
import com.sunshy.soms.pojo.*;
import com.sunshy.soms.service.*;
import com.sunshy.soms.util.Key;
import com.sunshy.soms.util.ResultVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import sun.misc.Request;

import javax.security.auth.message.callback.PrivateKeyCallback;
import javax.security.auth.message.callback.SecretKeyCallback;
import javax.servlet.http.HttpSession;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * Demo Class
 *
 * @author sunshy
 * @date 2019-04-14   09:45
 */
@Controller
@RequestMapping("/doctor")
public class DoctorController {

    @Autowired
    private DoctorService doctorService;

    @Autowired
    private OrderMasterService orderMasterService;

    @Autowired
    private UserService userService;


    @Autowired
    private OrderDetailService orderDetailService;

    @Autowired
    private DrugCategoryService drugCategoryService;

    @Autowired
    private DrugInfoService drugInfoService;


    @RequestMapping("/login")
    public ModelAndView modelAndView(String username, String password,
                                     HttpSession session, Map<String,Object> map,
                                     @RequestParam(value = "page",defaultValue = "1") Integer page,
                                     @RequestParam(value = "size",defaultValue = "3") Integer size){

       String doctorId = (String) session.getAttribute("doctorId");

       if (doctorId == null){

           DoctorInfo doctorInfo = doctorService.doctorLogin(username, password);

           if (doctorInfo==null){

               map.put("msg", UsersEnum.LOGFAIL.getMsg());

               return new ModelAndView("error",map);
           }else {

               map.put("doctor",doctorInfo);

               Date date = new Date();

               SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-mm-dd");

               map.put("date",simpleDateFormat.format(date));

               PageRequest pageRequest = new PageRequest(page-1,size);

               Page<OrderMaster> allByPage = orderMasterService.findByDoctorIdAndAndOrderStatus(doctorInfo.getDoctorId(),1,pageRequest);

               List<UserInfo> userInfos = new ArrayList<>();

               for (OrderMaster orderMaster : allByPage.getContent()){

                   userInfos.add(userService.findOneUser(orderMaster.getUserId()));

               }

               map.put("alluser",userInfos);

               map.put("allpagemaster",allByPage);

               session.setAttribute("doctorId",doctorInfo.getDoctorId());

               session.setMaxInactiveInterval(30*60);

               return new ModelAndView("doctor",map);

           }

       }else {

           DoctorInfo byId = doctorService.findById(doctorId);

           map.put("doctor",byId);

           Date date = new Date();

           SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");

           String format = simpleDateFormat.format(date);

           map.put("date", format);

           PageRequest pageRequest = new PageRequest(page-1,size);

           Page<OrderMaster> allByPage = orderMasterService.findByDoctorIdAndAndOrderStatus(doctorId,1,pageRequest);

           List<UserInfo> userInfos = new ArrayList<>();

           for (OrderMaster orderMaster : allByPage.getContent()){

               userInfos.add(userService.findOneUser(orderMaster.getUserId()));

           }

           map.put("alluser",userInfos);

           map.put("currentPage",page);

           map.put("allpagemaster",allByPage);

           return new ModelAndView("doctor",map);

       }




    }


    @RequestMapping("/receivermessage")
    public ModelAndView receiverMessage(HttpSession session,String orderMasterId,
                                     Map<String,Object> map){

        String doctorId = (String) session.getAttribute("doctorId");

        if (doctorId == null){

            map.put("msg","请先登陆");

            return new ModelAndView("error",map);
        }else {

            OrderMaster byId = orderMasterService.findById(orderMasterId);

            UserInfo oneUser = userService.findOneUser(byId.getUserId());

            map.put("ordermaster",byId);

            map.put("userinfo",oneUser);

            return new ModelAndView("ormessage",map);

        }


    }


    @RequestMapping("/receiverorder")
    public ModelAndView receiveOrder(HttpSession session,String orderMasterId,
                                     Map<String,Object> map){


        String  doctorId = (String) session.getAttribute("doctorId");

        if (doctorId==null){

            map.put("msg","请先登陆");

            return new ModelAndView("error",map);

        }else {

            OrderMaster byId = orderMasterService.findById(orderMasterId);

            byId.setOrderStatus(2);

            try {

                OrderMaster orderMaster = orderMasterService.createOrderMaster(byId);



            }catch (Exception e){

                map.put("msg","接收预约失败");

                return new ModelAndView("error",map);

            }





            return new ModelAndView("redirect:/doctor/tostatue");


        }


    }


    @RequestMapping("/tostatue")
    public ModelAndView toStatue(HttpSession session, Map<String,Object> map,
                                 @RequestParam(value = "page",defaultValue = "1") Integer page,
                                 @RequestParam(value = "size",defaultValue = "3") Integer size){


        String doctorId = (String) session.getAttribute("doctorId");

        if (doctorId == null){


                map.put("msg", "请先登陆");

                return new ModelAndView("error",map);




        }else {

            DoctorInfo byId = doctorService.findById(doctorId);

            map.put("doctor",byId);

            Date date = new Date();

            SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");

            String format = simpleDateFormat.format(date);

            map.put("date", format);

            PageRequest pageRequest = new PageRequest(page-1,size);

            Page<OrderMaster> allByPage = orderMasterService.findByDoctorIdAndAndOrderStatus(doctorId,2,pageRequest);

            List<UserInfo> userInfos = new ArrayList<>();

            for (OrderMaster orderMaster : allByPage.getContent()){

                userInfos.add(userService.findOneUser(orderMaster.getUserId()));

            }

            map.put("alluser",userInfos);

            map.put("currentPage",page);

            map.put("allpagemaster",allByPage);

            return new ModelAndView("statue",map);

        }



    }


    @RequestMapping("/diagnose")
    public ModelAndView diagnose(HttpSession session, String orderMasterId,
                                 String notes,String ids,
                                   Map<String,Object> map){


        String doctorId = (String) session.getAttribute("doctorId");

        if (doctorId == null){


            map.put("msg", "请先登陆");

            return new ModelAndView("error",map);




        }else {

            String[] s1 = ids.split(" ");

            String [] name = new String[50];

            int k =0;

            for (int i =0; i< s1.length;i+=2){

                String[] split = s1[i].split(",");

                name[k++] = split[0];


            }

            int [] quentity = new int[50];

            int y =0;

            for (int i = 1; i < s1.length; i+=2){

//                String substring = s1[i].substring(3, s1[i].length()-1);


                String[] split = s1[i].split(":");

                String[] split1 = split[1].split("\r");


                quentity[y++] = Integer.parseInt(split1[0]);

            }

            List<DrugInfo> drugInfoList = new ArrayList<>();


            for (int i = 0; i <k; i++ ){

                DrugInfo byName = drugInfoService.findByName(name[i]);

                drugInfoList.add(byName);

            }

            BigDecimal totla = new BigDecimal("0");

            for (int i = 0;  i< drugInfoList.size(); i++){

                DrugInfo drugInfo = drugInfoList.get(i);

                drugInfo.setDrugInfoQuenity(drugInfo.getDrugInfoQuenity()-quentity[i]);

                drugInfoService.createOrSave(drugInfo);

                OrderDetail orderDetail = new OrderDetail();

                orderDetail.setDrugQuentily(quentity[i]);

                orderDetail.setDrugId(drugInfo.getDrugInfoId());

                orderDetail.setDrugName(drugInfo.getDrugInfoName());

                orderDetail.setOrderMasterId(orderMasterId);

                orderDetail.setCreateTime(new Date());

                orderDetail.setOrderDetailId(Key.uuid());

                orderDetail.setUpdateTime(new Date());

                orderDetail.setOrderDetailStatus(1);

                orderDetail.setOrderDetailPrice(drugInfo.getDrugInfoPrice().multiply(BigDecimal.valueOf(quentity[i])));

                 BigDecimal price =  drugInfo.getDrugInfoPrice();

                 BigDecimal quen = BigDecimal.valueOf(quentity[i]);

                BigDecimal multiply = price.multiply(quen);



                totla =  totla.add(multiply);

                OrderDetail orderDetail1 = orderDetailService.createOrderDetail(orderDetail);

            }

            OrderMaster byId = orderMasterService.findById(orderMasterId);

            byId.setOrderStatus(3);

            byId.setOrderPrice(totla);

            byId.setOrderNotes(notes);

            byId.setPayStatus(1);

            orderMasterService.createOrderMaster(byId);

            return new ModelAndView("redirect:/doctor/success");

        }


    }


    @RequestMapping("/logout")
    public ModelAndView logout(HttpSession session){

        session.removeAttribute("doctorId");

        return new ModelAndView("index");

    }


    @RequestMapping("/success")
    public ModelAndView tosuccess(HttpSession session, Map<String,Object> map,
                                      @RequestParam(value = "page",defaultValue = "1") Integer page,
                                      @RequestParam(value = "size",defaultValue = "3") Integer size){

        String doctorId = (String) session.getAttribute("doctorId");

        if (doctorId == null){


            map.put("msg", "请先登陆");

            return new ModelAndView("error",map);




        }else {

            DoctorInfo byId = doctorService.findById(doctorId);

            map.put("doctor",byId);

            Date date = new Date();

            SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");

            String format = simpleDateFormat.format(date);

            map.put("date", format);

            PageRequest pageRequest = new PageRequest(page-1,size);

            Page<OrderMaster> allByPage = orderMasterService.findByDoctorIdAndAndOrderStatus(doctorId,3,pageRequest);

            List<UserInfo> userInfos = new ArrayList<>();

            for (OrderMaster orderMaster : allByPage.getContent()){

                userInfos.add(userService.findOneUser(orderMaster.getUserId()));

            }

            map.put("alluser",userInfos);

            map.put("currentPage",page);

            map.put("allpagemaster",allByPage);

            return new ModelAndView("toend",map);

        }


    }


    @RequestMapping("/todiagnose")
    public ModelAndView todiagnose(HttpSession session, String orderMasterId,
                                 Map<String,Object> map){


        String doctorId = (String) session.getAttribute("doctorId");

        if (doctorId == null){


            map.put("msg", "请先登陆");

            return new ModelAndView("error",map);




        }else {

            OrderMaster byId = orderMasterService.findById(orderMasterId);

            UserInfo oneUser = userService.findOneUser(byId.getUserId());

            List<DrugCategory> all = drugCategoryService.findAll();

            map.put("drugCategory",all);

            map.put("orderMaster",byId);

            map.put("userInfo",oneUser);

            return new ModelAndView("diagnose");

        }


    }


    @RequestMapping("/drug")
    @ResponseBody
    public ResultVo getDrugByCategoryId(String drugCategoryId,
                                        Map<String,Object> map){

        List<DrugInfo> allByCategoryId = drugInfoService.findByDrugInfoTypeAndDrugInfoStatue(drugCategoryId,2);

        map.put("allDrugInfo",allByCategoryId);

        return ResultVo.success(allByCategoryId);


    }


    @RequestMapping("/toordermessage")
    public ModelAndView toordermessage(HttpSession session,String orderMasterId,Map<String,Object> map){


        String doctorId = (String) session.getAttribute("doctorId");

        if (doctorId ==null){


            map.put("msg", "请先登陆");

            return new ModelAndView("error",map);

        }


        List<OrderDetail> orderDetailList = orderDetailService.findByOrderMasterId(orderMasterId);

        OrderMaster byId = orderMasterService.findById(orderMasterId);

        DoctorInfo doctorInfo = doctorService.findById(byId.getDoctorId());

        UserInfo oneUser = userService.findOneUser(byId.getUserId());

        map.put("username",oneUser);

        map.put("doctorInfo",doctorInfo);

        map.put("orderMaster",byId);

        map.put("orderDetailList",orderDetailList);


        return new ModelAndView("orderdtealmessage");

    }


}
