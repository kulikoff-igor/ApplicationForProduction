package controller;

import model.TAplicationData;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import workingWithDatabase.WorkWithTheTableApplicationData;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by IT-1 on 17.02.14.
 */
public class ViewingApplicationData extends HttpServlet {
    private final WorkWithTheTableApplicationData db = new WorkWithTheTableApplicationData();
    private List<TAplicationData> dataListApplication = new ArrayList<TAplicationData>();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException,
            IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String idApplication = request.getParameter("idApplication");
        dataListApplication = db.returnListOfDataOnApplications(Integer.parseInt(idApplication));
        JSONArray array = new JSONArray();
        JSONObject object = new JSONObject();
        for (TAplicationData records : dataListApplication) {
            try {
                object.put("pipeType", records.getPipeType());
                object.put("pe", records.getPe());
                object.put("sdr", records.getSdr());
                object.put("pipeWall", records.getPipeWall());
                object.put("pipeDiameter", records.getPipeDiametr());
                object.put("unit", records.getUnit());
                object.put("amount", records.getAmount());
                object.put("segments", records.getSegment());
                array.put(object);
                object = new JSONObject();
            } catch (JSONException e) {
                e.printStackTrace();
            }
        }
        response.getWriter().print(array.toString());
        array = null;
        dataListApplication = null;
    }
}
