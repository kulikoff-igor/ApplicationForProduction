package controller;

import model.TDatabase;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import workingWithDatabase.WorkWithDatabaseApplications;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by IT-1 on 13.02.14.
 */
public class ViewingApplications extends HttpServlet {
    private final WorkWithDatabaseApplications db = new WorkWithDatabaseApplications();
    private List<TDatabase> databaseList = new ArrayList<TDatabase>();
    private TDatabase application;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException,
            IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        databaseList = db.returnListOfDatabaseOnApplications();
        JSONArray array = new JSONArray();
        JSONObject object = new JSONObject();
        for (TDatabase records : databaseList) {
            try {
                object.put("idApplication", records.getIdApplication());
                object.put("date", records.getDate());
                object.put("organization", records.getOrganization());
                object.put("terms", records.getTerms());
                object.put("performer", records.getPerformer());
                array.put(object);
                object = new JSONObject();
            } catch (JSONException e) {
                e.printStackTrace();
            }
        }
        response.getWriter().print(array.toString());
        array = null;
        databaseList = null;
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException,
            IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String idApplication = request.getParameter("idApplication");
        databaseList = db.searchById(idApplication);
        JSONArray array = new JSONArray();
        JSONObject object = new JSONObject();
        for (TDatabase application : databaseList) {
            try {
                object.put("idApplication", application.getIdApplication());
                object.put("date", application.getDate());
                object.put("organization", application.getOrganization());
                object.put("terms", application.getTerms());
                object.put("performer", application.getPerformer());
                array.put(object);
                object = new JSONObject();
            } catch (JSONException e) {
                e.printStackTrace();
            }
        }
        response.getWriter().print(array.toString());
        array = null;
        databaseList = null;
    }
}
