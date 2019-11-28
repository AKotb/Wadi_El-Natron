/**
 * 
 */
package org.wadielnatron.beans;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
/**
 * @author ahmed.kotb
 *
 */
@Entity 
@Table(name = "beheiraschema.beheirauser")
public class User implements Serializable{
	private static final long serialVersionUID = -4746333924452133573L;
    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    private int id;
    
    @Column(name = "name")
    private String name;
    @Column
    private String password;
    @Column
    private String email;
    @Column
    private String identifynumber;
    /**
	 * @return the identifynumber
	 */
	public String getIdentifynumber() {
		return identifynumber;
	}

	/**
	 * @param identifynumber the identifynumber to set
	 */
	public void setIdentifynumber(String identifynumber) {
		this.identifynumber = identifynumber;
	}

	@Column
    private String phoneNumber;
    @Column
    private int roleid;
    @Column
    private String salt;

    /**
     * @return the id
     */
    public int getId() {
        return id;
    }

    /**
     * @param id the id to set
     */
    public void setId(int id) {
        this.id = id;
    }

    /**
     * @return the name
     */
    public String getName() {
        return name;
    }

    /**
     * @param name the name to set
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * @return the password
     */
    public String getPassword() {
        return password;
    }

    /**
     * @param password the password to set
     */
    public void setPassword(String password) {
        this.password = password;
    }

    /**
     * @return the email
     */
    public String getEmail() {
        return email;
    }

    /**
     * @param email the email to set
     */
    public void setEmail(String email) {
        this.email = email;
    }

    /**
     * @return the phoneNumber
     */
    public String getPhoneNumber() {
        return phoneNumber;
    }

    /**
     * @param phoneNumber the phoneNumber to set
     */
    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    /**
     * @return the roleid
     */
    public int getRoleid() {
        return roleid;
    }

    /**
     * @param roleid the roleid to set
     */
    public void setRoleid(int roleid) {
        this.roleid = roleid;
    }

    /**
     * @return the salt
     */
    public String getSalt() {
        return salt;
    }

    /**
     * @param salt the salt to set
     */
    public void setSalt(String salt) {
        this.salt = salt;
    }
}
