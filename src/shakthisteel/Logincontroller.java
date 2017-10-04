package shakthisteel;

import java.security.Principal;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import shakthisteel.Register;
@Controller
public class Logincontroller {
	@Autowired  
	controllerDao dao;
	@RequestMapping(value = "/admin", method = RequestMethod.GET)
    public String adminPage(Model model) {
        return "Home";
    }
	
	@RequestMapping(value = "/home", method = RequestMethod.GET)
    public String homePage(Model model) {
        return "Home";
    }
 
    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public ModelAndView loginPage(Model model,@ModelAttribute("p") Billgen p ,HttpServletRequest request,Principal principal,Authentication authentication ) {

        return new ModelAndView("loginpage");
    }
   
    @RequestMapping(value = "/userInfo", method = RequestMethod.GET)
    public String userInfo(Model model, Principal principal) {
 
        // After user login successfully.
        String userName = principal.getName();
 
       
        return "userinfo";
    }
    
    @RequestMapping(value = "/saveuser", method = RequestMethod.POST)
    public String saveuser(@ModelAttribute("p") Register p,HttpServletRequest request) {
 
    	dao.saveuser(p);
    	dao.saveuserrole(p);
       
       String message = "Registered Successfully !";
       request.setAttribute("message",message);
       String var ="loginpage";
        return var;
    }
    
    
    
    
    
    @RequestMapping(value = "/welcome", method = RequestMethod.GET)
	    public ModelAndView welcome(@ModelAttribute("p") Billgen p ,HttpServletRequest request,Principal principal,Authentication authentication) {
	    	
	    	authentication.getAuthorities();
	    	
	    	System.out.println("Authentication" +authentication.getAuthorities());
	    	Collection<? extends GrantedAuthority> var = authentication.getAuthorities();
	    	String b = var.toString();
	    	
	   System.out.println(b);
	    	if(b.contains("[ROLE_DOCTOR]")){
	    		 RedirectView redirectView = new RedirectView();
			     redirectView.setUrl("http://localhost:8085/HMS/doctor1.html");
		        return new ModelAndView(redirectView); 
	    		
	    	}
	    	else if(b.contains("[ROLE_NURSE]")){
	    		 RedirectView redirectView = new RedirectView();
			     redirectView.setUrl("http://localhost:8085/HMS/nursedesk.html");
		        return new ModelAndView(redirectView); 
	    		
	    	}
	        else if(b.contains("[ROLE_FDESK]")){
	        	 RedirectView redirectView = new RedirectView();
			     redirectView.setUrl("http://localhost:8085/HMS/frontdesk.html");
		        return new ModelAndView(redirectView); 
	    		
	    	}
	        else if(b.contains("[ROLE_ASSISTANT]")){
	        	 RedirectView redirectView = new RedirectView();
			     redirectView.setUrl("http://localhost:8085/HMS/frontdesk.html");
		        return new ModelAndView(redirectView); 
	    		
	        }
	
	    	else{
	    		 RedirectView redirectView = new RedirectView();
			     redirectView.setUrl("http://localhost:8085/HMS/admin");
		        return new ModelAndView(redirectView); 
	    	}
	       
	    }


    @RequestMapping(value = "/logoutSuccessful", method = RequestMethod.GET)
    public ModelAndView logoutSuccessfulPage(Model model) {
        model.addAttribute("title", "Logged out Successfully!");
        return new ModelAndView("logoutSuccessfulPage"); 
    }
    
    @RequestMapping(value = "/403", method = RequestMethod.GET)
    public String accessDenied(Model model, Principal principal) {
        
        if (principal != null) {
            model.addAttribute("message", "Hi " + principal.getName()
                    + "<br> You do not have permission to access this page!");
        } else {
            model.addAttribute("msg",
                    "You do not have permission to access this page!");
        }
        return "403Page";
    }
}
