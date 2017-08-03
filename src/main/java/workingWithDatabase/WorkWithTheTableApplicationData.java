package workingWithDatabase;

import model.TAplicationData;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by IT-1 on 13.02.14.
 */
public class WorkWithTheTableApplicationData {
    private final WorkingWithDatabase db = new WorkingWithDatabase();

    public List<TAplicationData> returnListOfDataOnApplications(Integer idApplication) {
        ResultSet rs;
        rs = db.selectProcedures("SELECT application_data.idApplications,  application_data.pipeType, application_data.PE ,  application_data.SDR,  application_data.pipeWall,  application_data.pipeDiameter,  application_data.unit,  application_data.amount,  application_data.segments FROM application_data WHERE application_data.idApplications = '"+ idApplication +"'");
        List<TAplicationData> dataSheetApplications = new ArrayList<TAplicationData>();
        TAplicationData applicationData = new TAplicationData();
        try {
            while (rs.next()) {
                applicationData.setIdAplications(rs.getInt(1));
                applicationData.setPipeType(rs.getString(2));
                applicationData.setPe(rs.getInt(3));
                applicationData.setSdr(rs.getString(4));
                applicationData.setPipeWall(rs.getDouble(5));
                applicationData.setPipeDiametr(rs.getDouble(6));
                applicationData.setUnit(rs.getString(7));
                applicationData.setAmount(rs.getDouble(8));
                applicationData.setSegment(rs.getString(9));
                dataSheetApplications.add(applicationData);
                applicationData = new TAplicationData();

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return dataSheetApplications;

    }

    public void addingDataAboutTheApplication(Integer idAplications, String pipeType, Integer pe, String sdr, Double pipeWall, Double pipeDiametr, String unit, Double amount, String segment) {
        try {
            db.executionProcedures("{call addingDataAboutTheApplication('" + idAplications + "','" + pipeType + "','" + pe + "','" + sdr + "','" + pipeWall + "','" + pipeDiametr + "','" + unit + "','" + amount + "','" + segment + "')}");
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }
    public void removeApplicationData(Integer idAplications, String pipeType, Integer pe, String sdr, Double pipeWall, Double pipeDiametr, String unit, Double amount, String segment) {
        try {
            db.executionProcedures("{call removalDataApplications('" + idAplications + "','" + pipeType + "','" + pe + "','" + sdr + "','" + pipeWall + "','" + pipeDiametr + "','" + unit + "','" + amount + "','" + segment + "')}");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
