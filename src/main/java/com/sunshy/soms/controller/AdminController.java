package com.sunshy.soms.controller;

import com.sun.org.apache.xpath.internal.operations.Mod;
import com.sunshy.soms.pojo.*;
import com.sunshy.soms.service.*;
import com.sunshy.soms.util.Key;
import com.sunshy.soms.util.ResultVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * Demo Class
 *
 * @author sunshy
 * @date 2019-04-18   22:16
 */

@Controller
@RequestMapping("/admin")
public class AdminController {


    @Autowired
    private AdminService adminService;

    @Autowired
    private OrderMasterService orderMasterService;
    
    @Autowired
    private UserService userService;

    @Autowired
    private DoctorService doctorService;

    @Autowired
    private OrderDetailService orderDetailService;

    @Autowired
    private DrugInfoService drugInfoService;

    @Autowired
    private DrugCategoryService drugCategoryService;

    @RequestMapping("/login")
    public ModelAndView login(String username, String password, HttpSession session, Map<String,Object> map,
                              @RequestParam(value = "page",defaultValue = "1") Integer page,
                              @RequestParam(value = "size",defaultValue = "3") Integer size){

        Integer adminId = (Integer) session.getAttribute("adminId");

        if (adminId == null){

            if (username == null || password ==null ){

                map.put("msg","请先登录");

                return new ModelAndView("error",map);

            }else {

                Admin login = adminService.login(username, password);

                if (login == null){

                    map.put("msg","账号或者密码不正确");

                    return new ModelAndView("error",map);

                }else {

                    PageRequest request = new PageRequest(page-1,size);
                    
                    

                    Page<OrderMaster> byOrderStatus = orderMasterService.findByOrderStatus(2, request);

                    Date date = new Date();

                    SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");

                    String format = simpleDateFormat.format(date);

                    List<UserInfo> all = userService.findAll();

                    map.put("date",format);

                    map.put("alluser",all);

                    map.put("admin",login);

                    map.put("currentPage",page);

                    map.put("allpagemaster",byOrderStatus);

                    session.setAttribute("adminId",login.getId());

                    session.setMaxInactiveInterval(30*60);

                    return new ModelAndView("admin",map);

                }

            }

        }else {


            Admin byId = adminService.findById(adminId);

            PageRequest request = new PageRequest(page-1,size);

            Page<OrderMaster> byOrderStatus = orderMasterService.findByOrderStatus(2, request);

            Date date = new Date();

            SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");

            String format = simpleDateFormat.format(date);

            List<UserInfo> all = userService.findAll();

            map.put("alluser",all);

            map.put("admin",byId);

            map.put("currentPage",page);

            map.put("date",format);

            map.put("allpagemaster",byOrderStatus);

            return new ModelAndView("admin",map);

        }



    }



    @RequestMapping("/logout")
    public ModelAndView logout(HttpSession session){

        session.removeAttribute("adminId");

        return new ModelAndView("index");

    }




    @RequestMapping("/tostatue")
    public ModelAndView tostatue(HttpSession session, Map<String,Object> map,
                                 @RequestParam(value = "page",defaultValue = "1") Integer page,
                                 @RequestParam(value = "size",defaultValue = "3") Integer size){



        Integer adminId = (Integer) session.getAttribute("adminId");

        if (adminId == null){

                map.put("msg","请先登录");

                return new ModelAndView("error",map);

            }else {

            Admin byId = adminService.findById(adminId);

            PageRequest request = new PageRequest(page-1,size);

            Page<OrderMaster> byOrderStatus = orderMasterService.findByOrderStatus(2, request);

            Date date = new Date();

            SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");

            String format = simpleDateFormat.format(date);

            List<UserInfo> all = userService.findAll();


            List<DoctorInfo> allDoctor = doctorService.findAll();

            map.put("alluser",all);

            map.put("admin",byId);

            map.put("currentPage",page);

            map.put("allDoctor",allDoctor);

            map.put("date",format);

            map.put("allpagemaster",byOrderStatus);

            return new ModelAndView("admintostatue",map);


        }


    }




    @RequestMapping("/success")
    public ModelAndView success(HttpSession session, Map<String,Object> map,
                                 @RequestParam(value = "page",defaultValue = "1") Integer page,
                                 @RequestParam(value = "size",defaultValue = "3") Integer size){



        Integer adminId = (Integer) session.getAttribute("adminId");

        if (adminId == null){

            map.put("msg","请先登录");

            return new ModelAndView("error",map);

        }else {

            Admin byId = adminService.findById(adminId);

            PageRequest request = new PageRequest(page-1,size);

            Page<OrderMaster> byOrderStatus = orderMasterService.findByOrderStatus(3, request);

            Date date = new Date();

            SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");

            String format = simpleDateFormat.format(date);

            List<UserInfo> all = userService.findAll();

            map.put("alluser",all);

            map.put("admin",byId);

            map.put("currentPage",page);

            map.put("date",format);

            map.put("allpagemaster",byOrderStatus);

            return new ModelAndView("adminsuccess",map);


        }


    }



    @RequestMapping("/receivermessage")
    public ModelAndView receivermessage(HttpSession session, Map<String,Object> map,String orderMasterId,
                                @RequestParam(value = "page",defaultValue = "1") Integer page,
                                @RequestParam(value = "size",defaultValue = "3") Integer size){



        Integer adminId = (Integer) session.getAttribute("adminId");

        if (adminId == null){

            map.put("msg","请先登录");

            return new ModelAndView("error",map);

        }else {


            OrderMaster byId = orderMasterService.findById(orderMasterId);

            UserInfo oneUser = userService.findOneUser(byId.getUserId());

            DoctorInfo byId1 = doctorService.findById(byId.getDoctorId());

            List<OrderDetail> orderDetailList = orderDetailService.findByOrderMasterId(orderMasterId);

            map.put("orderMaster",byId);

            map.put("username",oneUser);

            map.put("doctor",byId1);

            map.put("orderDetailList",orderDetailList);


            return new ModelAndView("adminordermesage",map);


        }


    }


    @RequestMapping("/drugmanage")
    public ModelAndView drugManager(HttpSession session,Map<String,Object> map,
                                    @RequestParam(value = "page",defaultValue = "1") Integer page,
                                    @RequestParam(value = "size",defaultValue = "5") Integer size){


        Integer adminId = (Integer) session.getAttribute("adminId");

        if (adminId == null){

            map.put("msg","请先登录");

            return new ModelAndView("error",map);

        }else {

            PageRequest request = new PageRequest(page - 1, size);

            Page<DrugInfo> all = drugInfoService.findAllOrderByUpdateTimeDesc(request);

            List<DrugCategory> all1 = drugCategoryService.findAll();


            map.put("drugList", all);

            map.put("drugCategory", all1);

            map.put("currentPage", page);

            return new ModelAndView("admindrug");
        }

    }


    @GetMapping("changedrugon")
    public ModelAndView changedrugon(String drugId,HttpSession session,Map<String,Object> map){


        Integer adminId = (Integer) session.getAttribute("adminId");

        if (adminId == null){

            map.put("msg","请先登录");

            return new ModelAndView("error",map);

        }else {


            DrugInfo byId = drugInfoService.findById(drugId);

            byId.setDrugInfoStatue(2);

            drugInfoService.createOrSave(byId);

            return new ModelAndView("redirect:/admin/drugmanage");


        }

    }

    @GetMapping("changedrugoff")
    public ModelAndView changedrugoff(String drugId,HttpSession session,Map<String,Object> map){


        Integer adminId = (Integer) session.getAttribute("adminId");

        if (adminId == null){

            map.put("msg","请先登录");

            return new ModelAndView("error",map);

        }else {


            DrugInfo byId = drugInfoService.findById(drugId);

            byId.setDrugInfoStatue(1);

            drugInfoService.createOrSave(byId);

            return new ModelAndView("redirect:/admin/drugmanage");


        }

    }

    @RequestMapping("/doctormanage")
    public ModelAndView doctormanage(HttpSession session,Map<String,Object> map,
                                     @RequestParam(value = "page",defaultValue = "1") Integer page,
                                     @RequestParam(value = "size",defaultValue = "10") Integer size){

        PageRequest pageRequest = new PageRequest(page-1,size);

        Page<DoctorInfo> all = doctorService.findAll(pageRequest);

        Integer adminId = (Integer) session.getAttribute("adminId");

        Admin byId = adminService.findById(adminId);

        Date date = new Date();

        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");

        String format = simpleDateFormat.format(date);

        map.put("date",format);

        map.put("admin",byId);

        map.put("alldoctorList",all);

        map.put("currentPage",page);

        return new ModelAndView("/doctormanage",map);

    }


    @RequestMapping("/doctorrequire")
    public ModelAndView doctorrequire(HttpSession session,Map<String,Object> map,String doctorId){


        DoctorInfo byId = doctorService.findById(doctorId);

        map.put("doctor",byId);


        return new ModelAndView("/doctorrequire",map);

    }

    @RequestMapping("/userrequire")
    public ModelAndView userrequire(HttpSession session,Map<String,Object> map,String userId){

        if (userId!=null){

            UserInfo byId = userService.findOneUser(userId);

            map.put("user",byId);
            return new ModelAndView("/userrequire",map);
        }else {

            return new ModelAndView("/userrequire",map);
        }

    }


    @RequestMapping("/deletedoctorId")
    public ModelAndView deletedoctorId(String doctorId,Map<String,Object> map){

        try {

            doctorService.delete(doctorId);
        }catch (Exception e){

            map.put("msg","删除失败");
            return new ModelAndView("error",map);


        }
        map.put("msg","删除成功");

        map.put("url","/admin/doctormanage");

        return new ModelAndView("adminsuccessstatue",map);

    }


    @RequestMapping("/deleteuserId")
    public ModelAndView delete(String userId,Map<String,Object> map){


        try {

            userService.deleteUserId(userId);

        }catch (Exception e){

            map.put("msg","删除失败");

            return new ModelAndView("error",map);


        }
        map.put("msg","删除成功");

        map.put("url","/admin/usermanage");

        return new ModelAndView("adminsuccessstatue",map);

    }


    @RequestMapping("/usermanage")
    public  ModelAndView usermanage(HttpSession session,Map<String,Object> map,
                                    @RequestParam(value = "page",defaultValue = "1") Integer page,
                                    @RequestParam(value = "size",defaultValue = "10") Integer size){


        PageRequest pageRequest = new PageRequest(page-1,size);

        Page<UserInfo> all = userService.findAll(pageRequest);

        Integer adminId = (Integer) session.getAttribute("adminId");

        Admin byId = adminService.findById(adminId);

        map.put("admin",byId);

        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");

        Date date = new Date();

        String format = simpleDateFormat.format(date);

        map.put("date",format);

        map.put("alldoctorList",all);

        map.put("currentPage",page);


        return new ModelAndView("/usermanage",map);

    }



    @RequestMapping("/savedoctor")
    public ModelAndView savedoctor(DoctorInfo doctorInfo,Map<String,Object> map) {

        if (!doctorInfo.getDoctorId().equals("")) {


            try {

                DoctorInfo byId = doctorService.findById(doctorInfo.getDoctorId());

                doctorInfo.setCreateTime(byId.getCreateTime());

                Date date = new Date();

                doctorInfo.setUpdateTime(date);

                DoctorInfo save = doctorService.save(doctorInfo);

                if (save == null) {

                    map.put("msg", "医生信息更新失败");

                    return new ModelAndView("error", map);
                }
            } catch (Exception e) {


                map.put("msg", "医生信息更新失败");

                return new ModelAndView("error", map);

            }

            map.put("msg", "医生信息更新成功");

            map.put("url", "/admin/doctormanage");

            return new ModelAndView("adminsuccessstatue");

        }else {

            try{


            Date date = new Date();

            doctorInfo.setUpdateTime(date);

            doctorInfo.setCreateTime(date);

            doctorInfo.setDoctorId(Key.uuid());

            doctorService.save(doctorInfo);

            }catch (Exception e ) {

                map.put("msg","添加医生失败");

                return new ModelAndView("error",map);

            }
            map.put("msg", "添加医生成功");

            map.put("url", "/admin/doctormanage");

            return new ModelAndView("adminsuccessstatue",map);


        }



    }



    @PostMapping("/saveuser")
    public ModelAndView saveuser(UserInfo userInfo,Map<String,Object> map) {

        if (!userInfo.getUserId().equals("")) {

            try {

                UserInfo oneUser = userService.findOneUser(userInfo.getUserId());

                if (oneUser.getUserStatue().equals(2)){

                    userInfo.setUserStatue(3);
                }else {

                    userInfo.setUserStatue(oneUser.getUserStatue());

                }

                userInfo.setUserImg(oneUser.getUserImg());

                UserInfo save = userService.save(userInfo);

                if (save == null) {

                    map.put("msg", "学生信息更新失败");

                    return new ModelAndView("error", map);

                }


            } catch (Exception e) {

                map.put("msg", "学生信息更新失败");

                return new ModelAndView("error", map);

            }

            map.put("msg", "学生信息更新成功");

            map.put("url", "/admin/usermanage");

            return new ModelAndView("adminsuccessstatue", map);

        } else {

            try {


                userInfo.setUserImg("1");

                userInfo.setUserStatue(3);

                userInfo.setUserId(Key.uuid());

                UserInfo createuserInfo = userService.save(userInfo);

                if (createuserInfo == null) {

                    map.put("msg", "学生信息添加失败");

                    return new ModelAndView("error", map);

                }

            } catch (Exception e) {

                map.put("msg", "学生信息添加失败");

                return new ModelAndView("error", map);


            }


            map.put("msg", "学生信息添加成功");

            map.put("url", "/admin/usermanage");

            return new ModelAndView("adminsuccessstatue", map);


        }
    }


    @RequestMapping("handlemessage")
    public ModelAndView handlemessage(HttpSession session,Map<String,Object> map,
                                      @RequestParam(value = "page",defaultValue = "1") Integer page,
                                      @RequestParam(value = "size",defaultValue = "10") Integer size){

        PageRequest pageRequest = new PageRequest(page-1,size);


        Page<UserInfo> byUserStatue = userService.findByUserStatue(2, pageRequest);

        Integer adminId = (Integer) session.getAttribute("adminId");

        Admin byId = adminService.findById(adminId);

        map.put("admin",byId);

        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");

        Date date = new Date();

        String format = simpleDateFormat.format(date);

        map.put("date",format);

        map.put("alldoctorList",byUserStatue);

        map.put("currentPage",page);

        return new ModelAndView("/handlemessage",map);


    }

   @RequestMapping("makesuremessage")
    public  ModelAndView makesuremessage(Map<String,Object> map,HttpSession session,
                                         @RequestParam(value = "page",defaultValue = "1") Integer page,
                                         @RequestParam(value = "size",defaultValue = "10") Integer size){

        PageRequest pageRequest = new PageRequest(page-1,size);

       Page<OrderMaster> byOrderStatus = orderMasterService.findByOrderStatusToupOrOrderStatusToupOOrOrderStatusToupOrderByUpdateTime(1,3, 2,pageRequest);

//       Page<OrderMaster> allOrOrderByUpdateTime = orderMasterService.findAllOrOrderByUpdateTime(pageRequest);

       List<DoctorInfo> all = doctorService.findAll();

       List<UserInfo> all1 = userService.findAll();

       map.put("userList",all1);

       map.put("doctorList",all);

       map.put("orderMasterList",byOrderStatus);

       Integer adminId = (Integer) session.getAttribute("adminId");

       Admin byId = adminService.findById(adminId);

       map.put("admin",byId);

       SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");

       Date date = new Date();

       String format = simpleDateFormat.format(date);

       map.put("date",format);

       return new ModelAndView("adminmakemessage",map);


   }


   @GetMapping("/agree")
    public ModelAndView agree(Map<String,Object> map,String orderMasterId){

        try {


       OrderMaster byId = orderMasterService.findById(orderMasterId);

       byId.setOrderStatusToup(3);

       OrderMaster orderMaster = orderMasterService.createOrderMaster(byId);

       if (orderMaster==null){

           map.put("msg","医保报销失败");

           return new ModelAndView("error",map);

       }

        }catch (Exception e ){


            map.put("msg","医保报销失败");

            return new ModelAndView("error",map);

        }


       map.put("msg","报销成功");

       map.put("url","/admin/makesuremessage");

       return new ModelAndView("adminsuccessstatue",map);


   }


    @GetMapping("/dissagree")
    public ModelAndView dissagree(Map<String,Object> map,String orderMasterId){

        try {


            OrderMaster byId = orderMasterService.findById(orderMasterId);

            byId.setOrderStatusToup(2);

            OrderMaster orderMaster = orderMasterService.createOrderMaster(byId);

            if (orderMaster==null){

                map.put("msg","医保报销取消失败");

                return new ModelAndView("error",map);

            }

        }catch (Exception e ){


            map.put("msg","医保报销取消成功");

            return new ModelAndView("error",map);

        }


        map.put("msg","取消成功");

        map.put("url","/admin/makesuremessage");

        return new ModelAndView("adminsuccessstatue",map);


    }


    @GetMapping("adddoctorByname")
    @ResponseBody
    public ResultVo adddoctorByname(String username){

        DoctorInfo byDoctorUsername = doctorService.findByDoctorUsername(username);

        return ResultVo.success(byDoctorUsername);

    }

    @GetMapping("adduserByname")
    @ResponseBody
    public ResultVo adduserByname(String username){

        UserInfo byUserUsername = userService.findByUserUsername(username);

        return ResultVo.success(byUserUsername);

    }


    @GetMapping("/requiredrugon")
    public ModelAndView requiredrugon(String drugId,Map<String,Object> map,HttpSession session){

        DrugInfo byId = drugInfoService.findById(drugId);

        Integer adminId = (Integer) session.getAttribute("adminId");

        List<DrugCategory> all = drugCategoryService.findAll();

        Admin byId1 = adminService.findById(adminId);

        map.put("admin",byId1);

        map.put("drugInfo",byId);

        map.put("drugcategorylist",all);

        return new ModelAndView("drugrequire",map);


    }




    @PostMapping("/savedrug")
    public ModelAndView savedrug(DrugInfo info,Map<String,Object> map,HttpSession session){


        DrugInfo byId = drugInfoService.findById(info.getDrugInfoId());

        info.setCreateTime(byId.getCreateTime());

        Date date = new Date();

        info.setUpdateTime(date);

        DrugInfo orSave = drugInfoService.createOrSave(info);

        map.put("msg","药品信息修改成功");

        map.put("url","/admin/drugmanage");

        return new ModelAndView("adminsuccessstatue",map);


    }


    @RequestMapping("/adddruginfo")
    public ModelAndView adddruginfo(Map<String,Object> map){

        List<DrugCategory> all = drugCategoryService.findAll();

        map.put("drugcategorylist",all);

        return new ModelAndView("drugadd",map);


    }


    @PostMapping("/adddrug")
    public ModelAndView adddrug(DrugInfo info,Map<String,Object> map,HttpSession session){

        Date date = new Date();

        info.setUpdateTime(date);
        info.setCreateTime(date);
        info.setDrugInfoId(Key.uuid());
        info.setDrugInfoStatue(1);

        DrugInfo orSave = drugInfoService.createOrSave(info);

        map.put("msg","药品添加成功");

        map.put("url","/admin/drugmanage");

        return new ModelAndView("adminsuccessstatue",map);



    }



}
