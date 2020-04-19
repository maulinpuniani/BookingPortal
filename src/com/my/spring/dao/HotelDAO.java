package com.my.spring.dao;

import java.time.LocalDate;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;

import com.my.spring.pojo.Hotel;

public class HotelDAO extends DAO{
	public List<Hotel> searchHotel(String city, LocalDate localcheckIndate, LocalDate localcheckOutdate)
	 {
	try {
		begin();
			
		Query q = getSession().createQuery("from Hotel where city= :city and checkOutDate = :checkOutDate and checkInDate = :checkInDate");
		q.setString("city",city);	
		java.util.Date checkInDate = java.sql.Date.valueOf(localcheckIndate);
		java.util.Date checkOutDate = java.sql.Date.valueOf(localcheckOutdate);
		q.setDate("checkOutDate",checkOutDate);
		q.setDate("checkInDate",checkInDate);
		List<Hotel> list = q.list();
		commit();
		return list;
	
	} catch (HibernateException e) {
		rollback();
		throw e;
	}
	}
}
