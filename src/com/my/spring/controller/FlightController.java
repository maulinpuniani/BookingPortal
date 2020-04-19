package com.my.spring.controller;

import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.my.spring.dao.FlightDAO;
import com.my.spring.pojo.Flight;

@Controller
@RequestMapping("/flight/*")
public class FlightController {

	
	@RequestMapping(value = "/flight/search", method = RequestMethod.GET)
	protected String goToSearchFlight(HttpServletRequest request) throws Exception {
		// go to index page inside views
		return "searchFlight";
	}
	
	@RequestMapping(value = "/flight/search", method = RequestMethod.POST)
	protected ModelAndView searchedFlight(HttpServletRequest request) throws Exception {
		FlightDAO flightDAO = new FlightDAO();
		String trip = request.getParameter("trip");
		String source = request.getParameter("source");
		String dest = request.getParameter("destination");
		String departdate = request.getParameter("departdate");
		DateTimeFormatter dateTimeFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		LocalDate localDateDepart = LocalDate.parse(departdate, dateTimeFormatter);
		String returndate = request.getParameter("returndate");
		if(returndate == "" || returndate == null) {
			List<Flight> list = flightDAO.searchOneWayFlight(source, dest, localDateDepart);
		
			return new ModelAndView("searchedFlights", "flightList", list);
		}else {
			LocalDate localDateReturn = LocalDate.parse(returndate, dateTimeFormatter);
			List<Flight> departureList = flightDAO.searchOneWayFlight(source, dest, localDateDepart);
			List<Flight> returnList = flightDAO.searchTwoWayFlightReturn(source, dest, localDateReturn);
			HashMap<String, List<Flight>> map= new HashMap<>();
			map.put("depart", departureList);
			map.put("returnFlight", returnList);
			return new ModelAndView("searchedTwoWayFlights", "map", map);
			
		}
		
	}
	
	@RequestMapping(value = "/flight/getAll", method = RequestMethod.GET)
	protected ModelAndView getAllFlights(HttpServletRequest request) throws Exception {
		
		FlightDAO flightDAO = new FlightDAO();
		List<Flight> list= flightDAO.get();
		
		return new ModelAndView("viewAllFlights", "flightList", list);
		
	}
	@RequestMapping(value = "/flight/book", method = RequestMethod.POST)
	protected ModelAndView goToBookFlight(HttpServletRequest request) throws Exception {
		// go to index page inside views
		String depflightNo = request.getParameter("depflightNo");
		String depsource = request.getParameter("depsource");
		String depdest = request.getParameter("depdest");
		String deparival = request.getParameter("deparival");
		String depdep = request.getParameter("depdep");
		String depprice = request.getParameter("depprice");
		String retflightNo = request.getParameter("retflightNo");
		String retarival ="", retdep="", retsrc="", retdest="";
		if(retflightNo != "") {
			 retarival = request.getParameter("retarival");
			 retdep = request.getParameter("retdep");
			 retsrc=depdest;
			 retdest=depsource;
		}
		String retprice = request.getParameter("retprice");
		int cost2 =0;
		if(retprice != "" && retprice != null) {
			 cost2 = (int) Float.parseFloat(retprice);
		}
		int cost1 = (int) Float.parseFloat(depprice);
		
		int totalcost = cost1+cost2;
		HashMap <String, Object> map = new HashMap<>();
		map.put("depflightNo", depflightNo);
		map.put("depsource", depsource);
		map.put("depdest", depdest);
		map.put("depdep", depdep);
		map.put("deparival", deparival);
		map.put("retflightNo", retflightNo);
		map.put("retarival", retarival);
		map.put("retdep", retdep);
		map.put("retsrc", retsrc);
		map.put("retdest", retdest);
		map.put("cost", totalcost);
		
 return new ModelAndView("CustomerDetailsForFlight", "map", map);
	}
	
	@RequestMapping(value = "/flight/confirmbooking", method = RequestMethod.POST)
	protected ModelAndView goToConfirmBooking(HttpServletRequest request) throws Exception {
	
		String depflightNo = request.getParameter("depflightNo");
		String depsource = request.getParameter("depsource");
		String depdest = request.getParameter("depdest");
		String deparival = request.getParameter("deparival");
		String depdep = request.getParameter("depdep");
		
		String retflightNo = request.getParameter("retflightNo");
		String retsrc = request.getParameter("retsrc");
		String retdest = request.getParameter("retdest");
		String retarival = request.getParameter("retarival");
		String retdep = request.getParameter("retdep");
		
		String name  =  request.getParameter("name");
		HashMap <String, Object> map = new HashMap<>();
		map.put("depflightNo", depflightNo);
		map.put("depsource", depsource);
		map.put("depdest", depdest);
		map.put("depdep", depdep);
		map.put("deparival", deparival);
		map.put("retflightNo", retflightNo);
		map.put("retarival", retarival);
		map.put("retdep", retdep);
		map.put("retsrc", retsrc);
		map.put("retdest", retdest);
		map.put("name", name);
		return new ModelAndView(new PdfReportView(),map);
	}
	
	protected List<Flight> create (HttpServletRequest request) throws Exception {
		List<Flight> list = new ArrayList<>();
		Flight f1 = new Flight();
		f1.setFlightNo("A1-101");
		f1.setFlightName("Air-India");
		f1.setSource("NewDelhi");
		f1.setDestination("Mumbai");
		f1.setDate(LocalDate.now());
		f1.setDepartureTime(LocalTime.now());
		f1.setArrivalTime(LocalTime.now());
		f1.setPrice(2000);
		FlightDAO flightDAO = new FlightDAO();
		//flightDAO.create(f1);
		list.add(f1);
		Flight f2 = new Flight();
		f2.setFlightNo("GO-102");
		f2.setFlightName("Go-Air");
		f2.setSource("Mumbai");
		f2.setDestination("NewDelhi");
		f2.setDate(LocalDate.now());
		f2.setPrice(2050);
		f2.setDepartureTime(LocalTime.now());
		f2.setArrivalTime(LocalTime.now());
		//flightDAO.create(f2);
		list.add(f2);
		return list;
	}
}
