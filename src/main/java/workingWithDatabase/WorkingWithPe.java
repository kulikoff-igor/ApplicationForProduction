package workingWithDatabase;

import model.TPe;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by IT-1 on 13.02.14.
 */
public class WorkingWithPe {
    private final WorkingWithDatabase db = new WorkingWithDatabase();

    public List<TPe> returnListPe() {
        ResultSet rs;
        rs = db.selectProcedures("SELECT  pe.PE FROM pe");
        List<TPe> listPe = new ArrayList<TPe>();
        TPe pe = new TPe();
        try {
            while (rs.next()) {
                pe.setPe(rs.getInt(1));
                listPe.add(pe);
                pe = new TPe();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return listPe;
    }

    public void addingPe(Integer pe) {
        try {
            db.executionProcedures("{call addingPe('" + pe + "')}");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
