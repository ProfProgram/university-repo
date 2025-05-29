package uk.ac.aston.oop.calendar;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertSame;
import static org.junit.jupiter.api.Assertions.assertTrue;
import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertNull;


import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

/**
 * The test class DayTest.
 *
 * @author (your name)
 * @version (a version number or a date)
 */
public class DayTest {

	// TODO - add your tests here!
	
	@Test
	public void appointmentBeofreStartOfDay() {
		//Arrange
		Day day = new Day(1);
		Appointment app = new Appointment("meeting", 1);
		//Act
		boolean success = day.makeAppointment(Day.START_OF_DAY - 1, app);
		Appointment fetch = day.getAppointment(1);
		//Assert
		assertFalse(success, "You should not be able to make an appointment before day starts");
		assertNull(fetch, "This should be null if no appointment was made");
	}
	
	@Test
	public void appointmentStartOfDay() {
		// Arrange
		Day today = new Day(1);
		Appointment app = new Appointment("meeting", 1);
		// Act
		boolean success = today.makeAppointment(9, app);
		Appointment fetch = today.getAppointment(9);
		// Assert
		// ln 28 checks if appointment meeting was created
		// can use assertTrue
		assertEquals(true, success, "Making an appointment at the start of a new day should work");
		// ln 30 checks if START_OF_DAY is equal to meeting
		assertSame(app, fetch, "It should be possible to fetch the appointment we just made");
	}
	
	@Test
	public void twoAppsOnSameTime() {
		//Arrange
		Day day = new Day(1);
		Appointment appA = new Appointment("meeting-A", 1);
		Appointment appB = new Appointment("meeting-B", 1);
		//Act
		boolean successA = day.makeAppointment(9, appA);
		Appointment fetchedA = day.getAppointment(9);
		boolean successB = day.makeAppointment(9, appB);
		Appointment fetchedB = day.getAppointment(9);
		//Assert
		assertTrue(successA, "appA failed to be made");
		assertSame(appA, fetchedA, "appA should be in index [0]");
		assertFalse(successB, "making an appt in an occupied slot should not be possible");
		assertSame(appA, fetchedB, "appA should not be overwritten");
	}
	
	@Test
	public void twoHourAppointmentAtStart() {
		Day today = new Day(1);
		Appointment app = new Appointment("meeting", 2);
		// Act
		boolean success = today.makeAppointment(9, app);
		Appointment fetchA = today.getAppointment(9);
		Appointment fetchB = today.getAppointment(9);
		// Assert
		assertTrue(success, "Making an appointment at the start of a new day should work");
		assertSame(app, fetchA, "It should be possible to fetch the appointment we just made");
		assertSame(app, fetchB, "appt should be two time slots long");
	}
	
	@Test
	public void twoHourAppointmentBeyondEnd() {
		Day day = new Day(1);
		Appointment app = new Appointment("meeting", 2);
		
		boolean success = day.makeAppointment(17, app);
		Appointment fetchA = day.getAppointment(17);
		Appointment fetchB = day.getAppointment(18);
		
		assertFalse(success, "Cannot make appoints that excced hrs of day");
		assertNull(fetchA, "Should not be appt at 17:00");
		assertNull(fetchB, "Shoyld not be appt at 18:00");
	}
	
	@Test
	public void overlappingTwoHourAppointments() {
		Day day = new Day(1);
		Appointment appA = new Appointment("meeting", 2);
		Appointment appB = new Appointment("meeting", 2);
		Appointment appC = new Appointment("meeting", 2);
		
		boolean successA = day.makeAppointment(11, appA);
		boolean successB = day.makeAppointment(10, appB);
		boolean successB_2 = day.makeAppointment(12, appC);
		Appointment fetchA = day.getAppointment(11);
		Appointment fetchA_2 = day.getAppointment(12);
		Appointment fetchB = day.getAppointment(10);
		Appointment fetchB_2 = day.getAppointment(11);
		Appointment fetchC = day.getAppointment(12);
		Appointment fetchC_2 = day.getAppointment(13);
		
		assertTrue(successA, "Making an appointment in empty slot should be possible");
		assertFalse(successB, "Cannot make appointments that are in another appt's slot");
		assertFalse(successB_2, "Cannot make appointments that are in another appt's slot");
		assertSame(appA, fetchA, "This should be appA's 1st time slot");
		assertSame(appA, fetchA_2, "This should be appA's 2nd time slot");
		assertNull(fetchB, "appB should not have been made, 1st");
		assertSame(appA, fetchB_2, "appA should be in fetchB_2");
		assertSame(appA, fetchC, "appA should be in fetchC");
		assertNull(fetchC_2, "appC should not have been made, 2nd");
	}
	}
