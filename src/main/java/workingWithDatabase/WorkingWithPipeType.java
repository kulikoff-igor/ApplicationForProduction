package workingWithDatabase;

import model.TpipeType;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by IT-1 on 13.02.14.
 */
public class WorkingWithPipeType {
    private final WorkingWithDatabase db = new WorkingWithDatabase();

    public List<TpipeType> returnListPipeType() {
        ResultSet rs;
        rs = db.selectProcedures("SELECT  pipetype.pipeType FROM pipetype");
        List<TpipeType> listPipeType = new ArrayList<TpipeType>();
        TpipeType pipeType = new TpipeType();
        try {
            while (rs.next()) {
                pipeType.setPipeType(rs.getString(1));
                listPipeType.add(pipeType);
                pipeType = new TpipeType();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return listPipeType;
    }

    public void addingPipeType(String pipeType) {
        try {
            db.executionProcedures("{call addingPipeType('" + pipeType + "')}");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
