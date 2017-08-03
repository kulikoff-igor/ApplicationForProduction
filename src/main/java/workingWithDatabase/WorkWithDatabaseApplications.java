package workingWithDatabase;

import model.TDatabase;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by IT-1 on 13.02.14.
 */
public class WorkWithDatabaseApplications {
    private final WorkingWithDatabase db = new WorkingWithDatabase();

    public List<TDatabase> returnListOfDatabaseOnApplications() {
        ResultSet rs;
        rs = db.selectProcedures("SELECT  `database`.* FROM `database`");
        List<TDatabase> listApplication = appealDatabase(rs);
        return listApplication;
    }
    public List<TDatabase> searchById(String idApplication) {
        ResultSet rs;
        rs = db.selectProcedures("SELECT  `database`.* FROM `database` WHERE `database`.idApplications = "+idApplication+"");
        List<TDatabase> listApplication = appealDatabase(rs);
        return listApplication;
    }

    private List<TDatabase> appealDatabase(ResultSet rs) {
        List<TDatabase> listApplication = new ArrayList<TDatabase>();
        TDatabase application = new TDatabase();
        try {
            while (rs.next()) {
                application.setIdApplication(rs.getInt(1));
                application.setDate(rs.getDate(2));
                application.setOrganization(rs.getString(3));
                application.setTerms(rs.getString(4));
                application.setPerformer(rs.getString(5));
                listApplication.add(application);
                application = new TDatabase();

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return listApplication;
    }

    public void addingApplication(Integer idAplications, String date, String organization, String terms, String performer) {
        try {
            db.executionProcedures("{call addingANewApplication('" + idAplications + "','" + date + "','" + organization + "','" + terms + "','" + performer + "')}");
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }
    public void removeApplication(Integer idAplications) {
        try {
            db.executionProcedures("{call removalByApplicationNumber('" + idAplications + "')}");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
