package com.deepak.webapp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/employee")
public class EmployeeService {

    @RequestMapping(value = "/getEmployeeDetails", method = RequestMethod.GET)
    @ResponseBody
    String getEmployeeDetails(HttpServletRequest request, HttpServletResponse response, HttpSession httpSession)
            throws JSONException {

        JSONObject js = new JSONObject();
        js.put("Name", "Deepak Devops Poll SCM");
        js.put("Calling Name", "Devops Engineer");
        js.put("DOB", "01-Jan-2099");
        js.put("Hobbies", "Playing Cricket, Helping Society");
        js.put("Places he likes", "Gorakhpur");

        return js.toString();
    }
}
