package controller;

import model.TSdr;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import workingWithDatabase.WorkingWithSdr;

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
public class ViewingSdr extends HttpServlet {
    private final WorkingWithSdr db = new WorkingWithSdr();
    private List<TSdr> sdrList = new ArrayList<TSdr>();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException,
            IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        sdrList = db.returnListSdr();
        JSONArray array = new JSONArray();
        JSONObject object = new JSONObject();
        for (TSdr records : sdrList) {
            try {
                object.put("sdr", records.getSdr());
                array.put(object);
                object = new JSONObject();
            } catch (JSONException e) {
                e.printStackTrace();
            }
        }
        response.getWriter().print(array.toString());
        array = null;
        sdrList = null;
    }
}