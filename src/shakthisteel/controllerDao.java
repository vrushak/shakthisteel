package shakthisteel;

import org.springframework.orm.hibernate3.HibernateTemplate;

import shakthisteel.Billgen;

import java.sql.ResultSet;  
import java.sql.SQLException;  
import java.util.List;

import org.apache.taglibs.standard.tag.common.core.NullAttributeException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;  
import org.springframework.jdbc.core.JdbcTemplate;  
import org.springframework.jdbc.core.RowMapper;  
import java.util.*;  


public class controllerDao {

	    
		JdbcTemplate template;  
		  
		public void setTemplate(JdbcTemplate template) {  
		    this.template = template;  
		}
		
		
		public List<Billgen> getBill(Billgen s) {
			
			return template.query("select max(CAST(invoice as decimal)) from "+s.getBill()+" ",new RowMapper<Billgen>(){  
		        public Billgen mapRow(ResultSet rs, int row) throws SQLException {   
		        	System.out.println(rs.getString(1));
			       Billgen p = new Billgen();
			       p.setInvoice(rs.getString(1));
				return p;
		        }
			});
		}
		
		public List<Billgen> getBill2(Billgen s) {
			
			return template.query("select invoice,invoicedate,name,address,mobile,goods,quantity,rate,amount,subtotal,gtotal,cgst,sgst,gst from "+s.getBill()+" ",new RowMapper<Billgen>(){  
		        public Billgen mapRow(ResultSet rs, int row) throws SQLException {   
		       
			       Billgen p = new Billgen();
			       p.setInvoice(rs.getString(1));
			       p.setInvoicedate(rs.getString(2));
			       p.setPname(rs.getString(3));
			       p.setAddress(rs.getString(4));
			       System.out.println(rs.getString(5));
			       p.setMobile(rs.getString(5));
			       p.setGoods(rs.getString(6));
			       p.setQuantity(rs.getString(7));
			       p.setRate(rs.getString(8));
			       p.setAmount(rs.getString(9));
			       p.setSubtotal(rs.getString(10));
			      p.setTotal(rs.getString(11));
			      p.setCgst(rs.getString(12));
			      p.setSgst(rs.getString(13));
			      p.setGst(rs.getString(14));
				return p;
		        }
			});
		}
		
public List<Billgen> getBill4(Billgen s) {
			
    System.out.println("here" + s.getFromdate() + s.getEndate());
    
			return template.query("select invoice,invoicedate,subtotal,cgst,sgst,gtotal from "+s.getGetdb()+" where (invoicedate BETWEEN '"+s.getFromdate()+"' AND '"+s.getEndate()+"')",new RowMapper<Billgen>(){  
		        public Billgen mapRow(ResultSet rs, int row) throws SQLException {   
		       
			       Billgen p = new Billgen();
			       p.setInvoice(rs.getString(1));
			       p.setInvoicedate(rs.getString(2));
			     
			       p.setSubtotal(rs.getString(3));
			     
			      p.setCgst(rs.getString(4));
			      p.setSgst(rs.getString(5));
			      p.setTotal(rs.getString(6));
			      
			      System.out.println(rs.getString(1));
				return p;
		        }
			});
		}
public List<Billgen> getBill3() {
			
			return template.query("select product,quantity,rate,amount from billconfig where product not like 'null' ",new RowMapper<Billgen>(){  
		        public Billgen mapRow(ResultSet rs, int row) throws SQLException {   
		       
			       Billgen p = new Billgen();
			      p.setDiscount(rs.getString(1));
			      p.setQuantity(rs.getString(2));
			      p.setRate(rs.getString(3));
			      p.setAmount(rs.getString(4));
			       
			   	return p;
		        }
			});
		}
			       

		public int savebill(Billgen s) {
			// TODO Auto-generated method stub
			String sql = "insert into "+s.getBill()+"(invoice,invoicedate,name,address,mobile,goods,quantity,rate,amount,subtotal,gtotal,cgst,sgst,gst) values('"+s.getInvoice()+"','"+s.getInvoicedate()+"','"+s.getPname()+"','"+s.getAddress()+"','"+s.getMobile()+"','"+s.getGoods()+"','"+s.getQuantity()+"','"+s.getRate()+"','"+s.getAmount()+"','"+s.getSubtotal()+"','"+s.getTotal()+"','"+s.getCgst()+"','"+s.getSgst()+"','"+s.getGst()+"')";
			return template.update(sql);
		}

		public int saveNew( String s) {
			// TODO Auto-generated method stub
	String sql = "insert ignore into billconfig(product) values('"+s+"')";
	return template.update(sql);
		}
		
		public int saveuser(Register p) {
			// TODO Auto-generated method stub
			String sql = "insert into users(username,password,enabled) values('"+p.getUsername()+"','"+p.getPassword()+"',1) on duplicate key update password = '"+p.getPassword()+"'";
			return template.update(sql);
		}

		public int saveuserrole(Register p) {
			// TODO Auto-generated method stub
			String sql = "insert into userrole(roleid,username,userrole) values(1,'"+p.getUsername()+"','ADMIN')";
			return template.update(sql);
		}


		
		
		//second branch
/*		
public List<Billgen> getBills() {
			
			return template.query("select right(max(invoice),1) from billgens where invoicedate =DATE_FORMAT(curdate(), '%d-%m-%Y')",new RowMapper<Billgen>(){  
		        public Billgen mapRow(ResultSet rs, int row) throws SQLException {   
		        	
			       Billgen p = new Billgen();
			       p.setInvoice(rs.getString(1));
				return p;
		        }
			});
		}
		
		public List<Billgen> getBill2s() {
			
			return template.query("select invoice,invoicedate,name,address,mobile,goods,quantity,rate,amount,subtotal,gtotal from billgen",new RowMapper<Billgen>(){  
		        public Billgen mapRow(ResultSet rs, int row) throws SQLException {   
		       
			       Billgen p = new Billgen();
			       p.setInvoice(rs.getString(1));
			       p.setInvoicedate(rs.getString(2));
			       p.setPname(rs.getString(3));
			       p.setAddress(rs.getString(4));
			       System.out.println(rs.getString(5));
			       p.setMobile(rs.getString(5));
			       p.setGoods(rs.getString(6));
			       p.setQuantity(rs.getString(7));
			       p.setRate(rs.getString(8));
			       p.setAmount(rs.getString(9));
			       p.setSubtotal(rs.getString(10));
			      p.setTotal(rs.getString(11));
				return p;
		        }
			});
		}
		
public List<Billgen> getBill3s() {
			
			return template.query("select product,quantity,rate,amount from billconfig where product not like 'null' ",new RowMapper<Billgen>(){  
		        public Billgen mapRow(ResultSet rs, int row) throws SQLException {   
		       
			       Billgen p = new Billgen();
			      p.setDiscount(rs.getString(1));
			      p.setQuantity(rs.getString(2));
			      p.setRate(rs.getString(3));
			      p.setAmount(rs.getString(4));
			       
			   	return p;
		        }
			});
		}
			       

		public int savebills(Billgen s) {
			// TODO Auto-generated method stub
			String sql = "insert into billgen(invoice,invoicedate,name,address,mobile,goods,quantity,rate,amount,subtotal,gtotal,bill) values('"+s.getInvoice()+"','"+s.getInvoicedate()+"','"+s.getPname()+"','"+s.getAddress()+"','"+s.getMobile()+"','"+s.getGoods()+"','"+s.getQuantity()+"','"+s.getRate()+"','"+s.getAmount()+"','"+s.getSubtotal()+"','"+s.getTotal()+"','"+s.getBill()+"')";
			return template.update(sql);
		}

		
	*/	
}
