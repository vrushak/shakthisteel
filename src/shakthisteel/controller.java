package shakthisteel;
import java.io.IOException;

import java.security.Principal;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.naming.ldap.Control;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;  
import org.springframework.stereotype.Controller;  
import org.springframework.web.bind.annotation.ModelAttribute;  
import org.springframework.web.bind.annotation.PathVariable;    
import org.springframework.web.bind.annotation.RequestMapping;  
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import shakthisteel.Billgen;
import shakthisteel.controllerDao;

@Controller
public class controller {

	@Autowired  
	controllerDao dao;
	@RequestMapping(value="/billgen", method = RequestMethod.GET)
	public ModelAndView billgen(@ModelAttribute("s") Billgen s) {
		s.setBill("billgen");
		List<Billgen> list2= dao.getBill(s);
		List<Billgen> list3= dao.getBill3();
		  List<Billgen> list4= dao.getBill2(s);
	  Map<String,Object> model = new HashMap<String, Object>();
	//  model.put("list1", list1);
	  model.put("list2", list2);
	  model.put("list3", list3);
	  model.put("list4", list4);
		return new ModelAndView("billgen","model",model); 
		}
	
	@RequestMapping(value="/billgen2", method = RequestMethod.GET)
	public ModelAndView billgen2(@ModelAttribute("s") Billgen s) {
		s.setBill("billgen2");
		List<Billgen> list2= dao.getBill(s);
		List<Billgen> list3= dao.getBill3();
		  List<Billgen> list4= dao.getBill2(s);
	  Map<String,Object> model = new HashMap<String, Object>();
	//  model.put("list1", list1);
	  model.put("list2", list2);
	  model.put("list3", list3);
	  model.put("list4", list4);
		return new ModelAndView("billgen2","model",model); 
		}
	@RequestMapping(value="/billsave", method = RequestMethod.POST)
	public ModelAndView  savebill(@ModelAttribute("s") Billgen s) {
	 
		s.setBill("billgen");
		dao.savebill(s);
		String len = s.getGoods();
		String str[] = len.split(",");
		for(int i=0;i<str.length;i++){
			
			 dao.saveNew(str[i]);	
		}
	   	
		 RedirectView redirectView = new RedirectView();
	     redirectView.setUrl("http://localhost:8085/shakthisteel/billgen.html");
     return new ModelAndView(redirectView); 
		}
  
	@RequestMapping(value="/billsave2", method = RequestMethod.POST)
	public ModelAndView  savebill2(@ModelAttribute("s") Billgen s) {
	 
		s.setBill("billgen2");
		dao.savebill(s);
		String len = s.getGoods();
		String str[] = len.split(",");
		for(int i=0;i<str.length;i++){
			
			 dao.saveNew(str[i]);	
		}
	   	
		 RedirectView redirectView = new RedirectView();
	     redirectView.setUrl("http://localhost:8085/shakthisteel/billgen2.html");
     return new ModelAndView(redirectView); 
		}
  
// proforma section
	
	
	@RequestMapping(value="/proforma", method = RequestMethod.GET)
	public ModelAndView proforma(@ModelAttribute("s") Billgen s) {
		s.setBill("proforma");
		List<Billgen> list2= dao.getBill(s);
		List<Billgen> list3= dao.getBill3();
		  List<Billgen> list4= dao.getBill2(s);
	  Map<String,Object> model = new HashMap<String, Object>();
	//  model.put("list1", list1);
	  model.put("list2", list2);
	  model.put("list3", list3);
	  model.put("list4", list4);
		return new ModelAndView("proforma","model",model); 
		}
	
	@RequestMapping(value="/proforma2", method = RequestMethod.GET)
	public ModelAndView proforma2(@ModelAttribute("s") Billgen s) {
		s.setBill("proforma2");
		List<Billgen> list2= dao.getBill(s);
		List<Billgen> list3= dao.getBill3();
		  List<Billgen> list4= dao.getBill2(s);
	  Map<String,Object> model = new HashMap<String, Object>();
	//  model.put("list1", list1);
	  model.put("list2", list2);
	  model.put("list3", list3);
	  model.put("list4", list4);
		return new ModelAndView("proforma2","model",model); 
		}
	@RequestMapping(value="/proformasave", method = RequestMethod.POST)
	public ModelAndView  saveproforma(@ModelAttribute("s") Billgen s) {
	 
		s.setBill("proforma");
		dao.savebill(s);
		String len = s.getGoods();
		String str[] = len.split(",");
		for(int i=0;i<str.length;i++){
			
			 dao.saveNew(str[i]);	
		}
	   	
		 RedirectView redirectView = new RedirectView();
	     redirectView.setUrl("http://localhost:8085/shakthisteel/proforma.html");
     return new ModelAndView(redirectView); 
		}
  
	@RequestMapping(value="/proformasave2", method = RequestMethod.POST)
	public ModelAndView  saveproforma2(@ModelAttribute("s") Billgen s) {
	 
		s.setBill("proforma2");
		dao.savebill(s);
		String len = s.getGoods();
		String str[] = len.split(",");
		for(int i=0;i<str.length;i++){
			
			 dao.saveNew(str[i]);	
		}
	   	
		 RedirectView redirectView = new RedirectView();
	     redirectView.setUrl("http://localhost:8085/shakthisteel/proforma2.html");
     return new ModelAndView(redirectView); 
		}
 
	@RequestMapping(value="/report", method = RequestMethod.GET)
	public ModelAndView report(@ModelAttribute("s") Billgen s) {
		
		
		return new ModelAndView("report"); 
	}
	@RequestMapping(value="/report2", method = RequestMethod.GET)
	public ModelAndView report2(@ModelAttribute("s") Billgen s) {
		
		
		return new ModelAndView("report2"); 
	}
	
	}

