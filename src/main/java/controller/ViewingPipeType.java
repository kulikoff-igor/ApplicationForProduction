package controller;

import model.TpipeType;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import workingWithDatabase.WorkingWithPipeType;

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
public class ViewingPipeType extends HttpServlet {
    private final WorkingWithPipeType db = new WorkingWithPipeType();
    private List<TpipeType> typeList = new ArrayList<TpipeType>();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException,
            IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        typeList = db.returnListPipeType();
        JSONArray array = new JSONArray();
        JSONObject object = new JSONObject();
        for (TpipeType records : typeList) {
            try {
                object.put("pipeType", records.getPipeType());
                array.put(object);
                object = new JSONObject();
            } catch (JSONException e) {
                e.printStackTrace();
            }
        }
        response.getWriter().print(array.toString());
        array = null;
        typeList = null;
    }
}
