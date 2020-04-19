package com.my.spring.dao;

import org.hibernate.HibernateException;

import com.my.spring.pojo.Flight;
import com.my.spring.pojo.User;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;

public class FlightDAO extends DAO{

	public List<Flight> get()
	 {
	try {
		begin();
		System.out.println("inside DAO");	
		Query q = getSession().createQuery("from Flight");
		List<Flight> list = q.list();
		commit();
		return list;
		
	
	} catch (HibernateException e) {
		rollback();
		throw e;
	}
	}
	
	public List<Flight> searchOneWayFlight(String source, String destination, LocalDate departureDate )
	 {
	try {
		begin();
			
		Query q = getSession().createQuery("from Flight where source= :source and destination = :destination and date = :date");
		q.setString("source",source);
		q.setString("destination",destination);
		java.util.Date date = java.sql.Date.valueOf(departureDate);
		q.setDate("date", date);
		
		List<Flight> list = q.list();
		commit();
		return list;
	
	} catch (HibernateException e) {
		rollback();
		throw e;
	}
	}
	

	
	public List<Flight> searchTwoWayFlightReturn(String source, String destination, LocalDate returnDate )
	 {
	try {
		begin();
			
		Query q = getSession().createQuery("from Flight where source= :source and destination = :destination and date = :date");
		q.setString("source",destination);
		q.setString("destination",source);
		java.util.Date date = java.sql.Date.valueOf(returnDate);
		q.setDate("date", date);
		
		List<Flight> list = q.list();
		commit();
		return list;
	
	} catch (HibernateException e) {
		rollback();
		throw e;
	}
	}

}
