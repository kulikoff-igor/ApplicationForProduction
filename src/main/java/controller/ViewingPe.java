package controller;

import model.TPe;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import workingWithDatabase.WorkingWithPe;

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
public class ViewingPe extends HttpServlet {
    private final WorkingWithPe db = new WorkingWithPe();
    private List<TPe> peList = new ArrayList<TPe>();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException,
            IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        peList = db.returnListPe();
        JSONArray array = new JSONArray();
        JSONObject object = new JSONObject();
        for (TPe records : peList) {
            try {
                object.put("pe", records.getPe());
                array.put(object);
                object = new JSONObject();
            } catch (JSONException e) {
                e.printStackTrace();
            }
        }
        response.getWriter().print(array.toString());
        array = null;
        peList = null;
    }
}