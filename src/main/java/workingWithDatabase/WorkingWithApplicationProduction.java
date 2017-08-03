package workingWithDatabase;

import model.TAplicationData;
import model.TApplicationProduction;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by IT-1 on 24.02.14.
 */
public class WorkingWithApplicationProduction {
    private final WorkingWithDatabase db = new WorkingWithDatabase();

    public List<TApplicationProduction> returnListOfApplicationsManufacturing () {
        ResultSet rs;
        rs = db.selectProcedures("SELECT  orders_for_manufacturing.* FROM orders_for_manufacturing");
        List<TApplicationProduction> applicationProductionList = new ArrayList<TApplicationProduction>();
        TApplicationProduction applicationProduction = new TApplicationProduction();
        try {
            while (rs.next()) {
                applicationProduction.setIdApplicationProduction(rs.getInt(1));
                applicationProduction.setDate(rs.getString(2));
                applicationProduction.setIdApplication(rs.getInt(3));
                applicationProduction.setAcord(rs.getString(4));
                applicationProduction.setDeliveryTime(rs.getString(5));
                applicationProductionList.add(applicationProduction);
                applicationProduction = new TApplicationProduction();

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return applicationProductionList;

    }

    public void addingApplicationsManufacturing(Integer idAplications, String date,  String accord,String deliveryTime) {
        try {
            db.executionProcedures("{call addingApplicationsManufacturing('" + date + "','" + idAplications + "','" + accord + "','" + deliveryTime + "')}");
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }
}
