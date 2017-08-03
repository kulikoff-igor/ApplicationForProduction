package controller;

import model.TAplicationData;
import model.TApplicationProduction;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import workingWithDatabase.WorkWithTheTableApplicationData;
import workingWithDatabase.WorkingWithApplicationProduction;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by IT-1 on 24.02.14.
 */
public class ViewingApplicationProduction extends HttpServlet {
    private final WorkingWithApplicationProduction db = new WorkingWithApplicationProduction();
    private List<TApplicationProduction> listOfApplicationsManufacturing = new ArrayList<TApplicationProduction>();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException,
            IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        listOfApplicationsManufacturing = db.returnListOfApplicationsManufacturing();
        JSONArray array = new JSONArray();
        JSONObject object = new JSONObject();
        for (TApplicationProduction records : listOfApplicationsManufacturing) {
            try {
                object.put("idApplicationProduction", records.getIdApplicationProduction());
                object.put("idApplication", records.getIdApplication());
                object.put("date", records.getDate());
                object.put("acord", records.getAcord());
                object.put("deliveryTime", records.getDeliveryTime());
                array.put(object);
                object = new JSONObject();
            } catch (JSONException e) {
                e.printStackTrace();
            }
        }
        response.getWriter().print(array.toString());
        array = null;
        listOfApplicationsManufacturing = null;
    }
}
