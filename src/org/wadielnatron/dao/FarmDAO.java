/**
 * 
 */
package org.wadielnatron.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.wadielnatron.dbconnection.PostgreSQLConnUtils;
import org.wadielnatron.beans.Farm;

/**
 * @author ahmed.kotb
 *
 */
public class FarmDAO {
	private static Connection con;

	/**
	 * 
	 */
	public FarmDAO() {
		super();
		con = PostgreSQLConnUtils.establishDBConn();
	}

	public void closeDBConn() {
		try {
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public Farm getByFarmID(int farmID) {
		Farm farm = new Farm();
		PreparedStatement preparedStatement = null;
		try {
			String queryString = "select * from beheiraschema.farms where \"farm_id\"=?";
			preparedStatement = con.prepareStatement(queryString);
			preparedStatement.setInt(1, farmID);
			ResultSet rset = preparedStatement.executeQuery();
			while (rset.next()) {
				farm.setId(rset.getInt(1));
				farm.setFarmID(rset.getInt(2));
				farm.setFarmName(rset.getString(3));
				farm.setOwnerID(rset.getString(4));
				farm.setOwnerName(rset.getString(5));
				farm.setTelephone(rset.getString(6));
				farm.setOwnership(rset.getString(7));
				farm.setReclamedArea(rset.getString(8));
				farm.setUrbanArea(rset.getString(9));
				farm.setUnusedArea(rset.getString(10));
				farm.setFieldCropsArea(rset.getString(11));
				farm.setCropsArea(rset.getString(12));
				farm.setManagBuildings(rset.getString(13));
				farm.setPoulBuildings(rset.getString(14));
				farm.setAnimBuildings(rset.getString(15));
				farm.setAgriBuildings(rset.getString(16));
				farm.setFileNo(rset.getString(17));
				farm.setReclamedLandNotUsedBefore(rset.getString(18));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return farm;
	}

	public boolean updateFarm(Farm farm) {
		PreparedStatement preparedStatement = null;
		boolean updateResult = false;
		try {
			String queryString = "UPDATE beheiraschema.farms SET \"farm_name\"=?, \"owner_id\"=?, \"owner_name\"=?, \"telephone\"=?, \"ownership\"=?, \"file_no\"=?  WHERE \"farm_id\"=?";
			preparedStatement = con.prepareStatement(queryString);
			preparedStatement.setString(1, farm.getFarmName());
			preparedStatement.setString(2, farm.getOwnerID());
			preparedStatement.setString(3, farm.getOwnerName());
			preparedStatement.setString(4, farm.getTelephone());
			preparedStatement.setString(5, farm.getOwnership());
			preparedStatement.setString(6, farm.getFileNo());
			preparedStatement.setInt(7, farm.getFarmID());
			int i = preparedStatement.executeUpdate();
			if (i == 1) {
				updateResult = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return updateResult;
	}

	public List<Farm> getAllFarms(String farmName, String ownerId, String ownerName, String telephone,
			String ownership, String fileNo) {
		PreparedStatement preparedStatement = null;
		List<Farm> farmsList = new ArrayList<Farm>();
		String queryString = null;
		String farmNameChecker = null;
		String ownerIdChecker = null;
		String ownerNameChecker = null;
		String telephoneChecker = null;
		String ownershipChecker = null;
		String fileNoChecker = null;
		String whereClause = null;
		try {
			if((farmName == null || farmName.length() == 0) 
					&& (ownerId == null || ownerId.length() == 0) 
					&& (ownerName == null || ownerName.length() == 0)
					&& (telephone == null || telephone.length() == 0)
					&& (ownership == null || ownership.length() == 0)
					&& (fileNo == null || fileNo.length() == 0)){
				queryString = "select * from beheiraschema.farms";
				preparedStatement = con.prepareStatement(queryString);
			} else {
				if((farmName != null) ||
					(ownerId != null) || 
					(ownerName != null) ||
					(telephone != null) || 
					(ownership != null )||
					(fileNo != null )){
					whereClause = " where id > 0";
				}else{
					whereClause = "";
				}
				
				if(farmName == null || farmName.length() == 0){
					farmNameChecker = "";
				} else {
					farmNameChecker = " and farm_name like '%"+farmName+"%'";
				}
				
				if(ownerId == null || ownerId.length() == 0){
					ownerIdChecker = "";
				} else {
					ownerIdChecker = " and owner_id like '%"+ownerId+"%'";
				}
				
				if(ownerName == null || ownerName.length() == 0){
					ownerNameChecker = "";
				} else {
					ownerNameChecker = " and owner_name like '%"+ownerName+"%'";
				}
				
				if(telephone == null || telephone.length() == 0){
					telephoneChecker = "";
				} else {
					telephoneChecker = " and telephone like '%"+telephone+"%'";
				}
				
				if(ownership == null || ownership.length() == 0){
					ownershipChecker = "";
				} else {
					ownershipChecker = " and ownership like '%"+ownership+"%'";
				}
				
				if(fileNo == null || fileNo.length() == 0){
					fileNoChecker = "";
				} else {
					fileNoChecker = " and file_no like '%"+fileNo+"%'";
				}
				
				queryString = "select * from beheiraschema.farms"
								+whereClause
								+farmNameChecker
								+ownerIdChecker
								+ownerNameChecker
								+telephoneChecker
								+ownershipChecker
								+fileNoChecker;
						
				preparedStatement = con.prepareStatement(queryString);
				
			}
			System.out.println("Query: "+queryString);
			ResultSet rset = preparedStatement.executeQuery();
			while (rset.next()) {
				Farm farm = new Farm();
				farm.setId(rset.getInt(1));
				farm.setFarmID(rset.getInt(2));
				farm.setFarmName(rset.getString(3));
				farm.setOwnerID(rset.getString(4));
				farm.setOwnerName(rset.getString(5));
				farm.setTelephone(rset.getString(6));
				farm.setOwnership(rset.getString(7));
				farm.setReclamedArea(rset.getString(8));
				farm.setUrbanArea(rset.getString(9));
				farm.setUnusedArea(rset.getString(10));
				farm.setFieldCropsArea(rset.getString(11));
				farm.setCropsArea(rset.getString(12));
				farm.setManagBuildings(rset.getString(13));
				farm.setPoulBuildings(rset.getString(14));
				farm.setAnimBuildings(rset.getString(15));
				farm.setAgriBuildings(rset.getString(16));
				farm.setFileNo(rset.getString(17));
				farm.setReclamedLandNotUsedBefore(rset.getString(18));
				farmsList.add(farm);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return farmsList;
	}

	public List<Farm> getAllAvailableFarms() {
		PreparedStatement preparedStatement = null;
		List<Farm> farmsList = new ArrayList<Farm>();
		try {
			String queryString = "select * from beheiraschema.farms";
			preparedStatement = con.prepareStatement(queryString);
			ResultSet rset = preparedStatement.executeQuery();
			while (rset.next()) {
				Farm farm = new Farm();
				farm.setId(rset.getInt(1));
				farm.setFarmID(rset.getInt(2));
				farm.setFarmName(rset.getString(3));
				farm.setOwnerID(rset.getString(4));
				farm.setOwnerName(rset.getString(5));
				farm.setTelephone(rset.getString(6));
				farm.setOwnership(rset.getString(7));
				farm.setReclamedArea(rset.getString(8));
				farm.setUrbanArea(rset.getString(9));
				farm.setUnusedArea(rset.getString(10));
				farm.setFieldCropsArea(rset.getString(11));
				farm.setCropsArea(rset.getString(12));
				farm.setManagBuildings(rset.getString(13));
				farm.setPoulBuildings(rset.getString(14));
				farm.setAnimBuildings(rset.getString(15));
				farm.setAgriBuildings(rset.getString(16));
				farm.setFileNo(rset.getString(17));
				farm.setReclamedLandNotUsedBefore(rset.getString(18));
				farmsList.add(farm);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return farmsList;
	}
}
