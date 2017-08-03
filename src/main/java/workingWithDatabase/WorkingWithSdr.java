package workingWithDatabase;

import model.TSdr;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by IT-1 on 13.02.14.
 */
public class WorkingWithSdr {
    private final WorkingWithDatabase db = new WorkingWithDatabase();

    public List<TSdr> returnListSdr() {
        ResultSet rs;
        rs = db.selectProcedures("SELECT  sdr.SDR FROM sdr");
        List<TSdr> listSdr = new ArrayList<TSdr>();
        TSdr sdr = new TSdr();
        try {
            while (rs.next()) {
                sdr.setSdr(rs.getString(1));
                listSdr.add(sdr);
                sdr = new TSdr();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return listSdr;
    }

    public void addingSdr(Integer sdr) {
        try {
            db.executionProcedures("{call addingSdr('" + sdr + "')}");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
