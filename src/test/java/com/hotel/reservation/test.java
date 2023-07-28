package com.hotel.reservation;

import java.text.ParseException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import static java.time.temporal.ChronoUnit.DAYS;

public class test {

	public static void main(String[] args) throws ParseException {

		// TODO Auto-generated method stub
		 DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");

	      LocalDate date1 = LocalDate.parse("2022-02-28", formatter);
	      LocalDate date2 = LocalDate.parse("2022-03-01", formatter);

	      long days = DAYS.between(date1, date2);

	      System.out.println(days + " days");
	}

	

}
