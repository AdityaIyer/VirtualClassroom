package edu.depaul.se491.josqlCmds;

import java.util.LinkedList;

import edu.depaul.se491.model.Category;
import edu.depaul.se491.model.Classes;
import edu.depaul.se491.model.Person;

public class DaoCmds {
	/**
	 * Identifies if a person with 'openId' is a teacher of the class with the openTokId.
	 * @param openId
	 * @param openTokId
	 * @return boolean
	 */
	public static boolean isTeacher(String openId, long openTokId) {
		CmdController run = new CmdController();
		IDaoCommands cmd = new IsTeacherCmd(openId, openTokId);
		run.setCommand(cmd);
		return run.isExecute();
	}
	
	/**
	 * Identifies if a person with a 'openId' is a student of the class with the openTokId.
	 * @param openId
	 * @param openTokId
	 * @return
	 */
	public static boolean isStudent(String openId, long openTokId) {
		CmdController run = new CmdController();
		IDaoCommands cmd = new IsStudentCmd(openId, openTokId);
		run.setCommand(cmd);
		return run.isExecute();
	}
	
	/**
	 * Provides a linked list of the classes. This is nice because it does not provide a raw Entity.
	 * @return LinkedList<Classes>
	 */
	@SuppressWarnings("unchecked")
	public static LinkedList<Classes> getClasses() {
		CmdController run = new CmdController();
		IDaoCommands cmd = new GetAllClassesCmd();
		run.setCommand(cmd);
		return (LinkedList<Classes>) run.getExecute();
	}
	
	/**
	 * Provides a linked list of the persons. This is nice because it does not provide a raw Entity.
	 * @return LinkedList<Person>
	 */
	@SuppressWarnings("unchecked")
	public static LinkedList<Person> getPersons() {
		CmdController run = new CmdController();
		IDaoCommands cmd = new GetAllPersonsCmd();
		run.setCommand(cmd);
		return (LinkedList<Person>) run.getExecute();
	}
	
	/**
	 * Provides a Person given an 'openId'.
	 * @param openId
	 * @return Person
	 */
	public static Person getPersonByOpenId(String openId) {
		CmdController run = new CmdController();
		IDaoCommands cmd = new GetPersonByOpenId(openId);
		run.setCommand(cmd);
		return (Person) run.getExecute();	
	}
	
	/**
	 * Provides a linked list of categories. This is nice because it does not provide a raw Entity.
	 * @return LinkedList<Category>
	 */
	@SuppressWarnings("unchecked")
	public static LinkedList<Category> getCategories() {
		CmdController run = new CmdController();
		IDaoCommands cmd = new GetAllCategories();
		run.setCommand(cmd);
		return (LinkedList<Category>) run.getExecute();
	}
	
	/**
	 * Provides a Category of a class by a OpenTokId.
	 * @param openTokId
	 * @return Category
	 */
	public static Category getCategoryByOpenTokId(long openTokId) {
		CmdController run = new CmdController();
		IDaoCommands cmd = new GetCategoryByOpenTokId(openTokId);
		run.setCommand(cmd);
		return (Category) run.getExecute();
	}
}