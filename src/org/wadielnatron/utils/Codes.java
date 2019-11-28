/**
 * 
 */
package org.wadielnatron.utils;

/**
 * @author ahmed.kotb
 *
 */
public final class Codes {
	
	// login messages
	public static final String USER_NAME_AND_PASSWORD_NULL= "1l";
	public static final String USER_NAME_OR_PASSWORD_INCORRECT= "2l";
	
	
	// register messages
	public static final String USER_ALREADY_EXIST = "1r";
	public static final String USER_ADDED_SUCCESSFULLY = "2r";
	public static final String USER_ADD_FAILED = "3r";
	public static final String INCOMPLETE_DATA = "4r";
	
	
	// manage users messages
	public static final String USER_REMOVE_SUCCESSFULL = "1um";
	public static final String USER_REMOVE_FAILED = "2um";
	public static final String USER_UPDATE_SUCCESSFULL = "3um";
	public static final String USER_UPDATE_FAILED = "4um";
	public static final String USER_LIST_NOTALLOWED = "5um";
	
	// forget password messages
	public static final String ENTERED_EMAIL_NOT_FOUND = "1fp";
	public static final String PASSWORD_RESET_SUCCESSFUL = "2fp";
	public static final String PASSWORD_RESET_FAILED = "3fp";
	
	private Codes() {
		throw new AssertionError();
	}
}
