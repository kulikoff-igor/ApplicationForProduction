package controller;

import workingWithDatabase.WorkWithTheTableApplicationData;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by IT-1 on 17.02.14.
 */
public class AddingDataForOrder extends HttpServlet {
    private final WorkWithTheTableApplicationData db = new WorkWithTheTableApplicationData();


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException,
            IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        Integer idApplication = Integer.parseInt(request.getParameter("idApplication"));
        String pipeType = request.getParameter("pipeType");
        Integer pe = Integer.parseInt(request.getParameter("pe"));
        String sdr = request.getParameter("sdr");
        Double pipeWall = Double.parseDouble(request.getParameter("pipeWall"));
        Double pipeDiametr = Double.parseDouble(request.getParameter("pipeDiameter"));
        String unit = request.getParameter("unit");
        Double amount = Double.parseDouble(request.getParameter("amount"));
        String segments = request.getParameter("segments");
            db.addingDataAboutTheApplication(idApplication, pipeType, pe, sdr, pipeWall, pipeDiametr, unit, amount, segments);
    }
}
