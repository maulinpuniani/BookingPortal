package com.my.spring.controller;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.my.spring.dao.HotelDAO;
import com.my.spring.pojo.Flight;
import com.my.spring.pojo.Hotel;
import org.apache.commons.mail.DefaultAuthenticator;
import org.apache.commons.mail.EmailException;
import org.apache.commons.mail.SimpleEmail;
@Controller
@RequestMapping("/hotel/*")
public class HotelController {
	

	@RequestMapping(value = "/hotel/search", method = RequestMethod.GET)
	protected String goToSearchHotel(HttpServletRequest request) throws Exception {
		// go to index page inside views
		return "searchHotel";
	}
	
	@RequestMapping(value = "/hotel/search", method = RequestMethod.POST)
	protected ModelAndView goToSearchedHotel(HttpServletRequest request) throws Exception {
		String city = request.getParameter("city");
		String roomType = request.getParameter("roomType");
		
		String checkIndate = request.getParameter("checkIndate");
		DateTimeFormatter dateTimeFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		LocalDate localcheckIndate = LocalDate.parse(checkIndate, dateTimeFormatter);
		String checkOutdate = request.getParameter("checkOutdate");
		LocalDate localcheckOutdate = LocalDate.parse(checkOutdate, dateTimeFormatter);
		HotelDAO hotelDAO = new HotelDAO();
		List<Hotel> list = hotelDAO.searchHotel(city,localcheckIndate, localcheckOutdate);
		
		
		return new ModelAndView("searchedHotel", "hotelList", list);
	}
	@RequestMapping(value = "/hotel/book", method = RequestMethod.POST)
	protected ModelAndView goToBookingPage(HttpServletRequest request) throws Exception {
		String numberOfRooms = request.getParameter("numberOfRooms");
		int numberOfRooms1 = Integer.parseInt(numberOfRooms);
		String price = request.getParameter("price");
		int cost = (int) Float.parseFloat(price);
		int totalcost = numberOfRooms1* cost;
		String hotel = request.getParameter("hotelName");
		String date  = request.getParameter("checkInDate");
		HashMap <String, Object> map = new HashMap<>();
		map.put("cost", totalcost);
		map.put("hotel", hotel);
		map.put("date", date);
		return new ModelAndView("CustomerDetails", "map", map);
	}
	@RequestMapping(value = "/hotel/booking", method = RequestMethod.POST)
	protected ModelAndView goToBookingFinalPage(HttpServletRequest request) throws Exception {
		String email = request.getParameter("email");
		String hotel = request.getParameter("hotelName");
		String date  = request.getParameter("checkInDate");
		String message = "Congratulations!! Your booking for hotel "+ hotel +"is confirmed for this date " + date +
				". Please show this email at the time of check in.";
		sendEmail(email, message);
		
		return new ModelAndView("hotelBookingConfirmation");
	}
	public void sendEmail(String useremail, String message) {
		try {
			SimpleEmail email = new SimpleEmail();
			email.setHostName("smtp.googlemail.com");
			email.setSmtpPort(465);
			email.setAuthenticator(new DefaultAuthenticator("projectiites@gmail.com", "Mp@Deadshoot"));
			email.setSSLOnConnect(true);
			email.setFrom("no-reply@bookingportal.com"); // This user email does not
													// // exist
			email.setSubject("Booking Confirmation");
			email.setMsg(message); // Retrieve email from the DAO and send this
			email.addTo(useremail);
			email.send();
		} catch (EmailException e) {
			System.out.println("Email cannot be sent");
		}
	}
}
