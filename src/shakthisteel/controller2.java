package shakthisteel;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
 
import javax.naming.NamingException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import net.sf.jasperreports.engine.JRDataSource;
//import shakthisteel.spring.jasper.form.JasperInputForm;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.JasperRunManager;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;
import net.sf.jasperreports.engine.export.HtmlExporter;
import net.sf.jasperreports.engine.util.JRLoader;
import net.sf.jasperreports.export.SimpleExporterInput;
import net.sf.jasperreports.export.SimpleHtmlExporterOutput;
import net.sf.jasperreports.export.SimpleHtmlReportConfiguration;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import shakthisteel.controllerDao;

@Controller

public class controller2 {

	@Autowired  
	controllerDao dao;
	@RequestMapping(value="/pdf", method = RequestMethod.GET)
	
	public ModelAndView billgen(@ModelAttribute("s") Billgen s,ModelAndView modelAndView) {
	
		
		  List<Billgen> list4= dao.getBill4(s);
		   Map<String,Object> parameterMap = new HashMap<String,Object>();
		   JRDataSource JRdataSource = new JRBeanCollectionDataSource(list4);
		   
	        parameterMap.put("datasource", JRdataSource);
	 
	        //xlsReport bean has ben declared in the jasper-views.xml file
	        modelAndView = new ModelAndView("pdfReport", parameterMap);
	 
	        return modelAndView;
	 
		}
	
	@RequestMapping( value = "/xls", method = RequestMethod.GET)
    public ModelAndView generateXlsReport(@ModelAttribute("s") Billgen s,ModelAndView modelAndView){
 
		s.setBill("billgen");
		
		  List<Billgen> list4= dao.getBill2(s);
		   Map<String,Object> parameterMap = new HashMap<String,Object>();
		   JRDataSource JRdataSource = new JRBeanCollectionDataSource(list4);
		   
	        parameterMap.put("datasource", JRdataSource);
	 
	        //xlsReport bean has ben declared in the jasper-views.xml file
	        modelAndView = new ModelAndView("xlsReport", parameterMap);
	 
	        return modelAndView;
		
		     
		 
			}
		
        

    
	

	
}


