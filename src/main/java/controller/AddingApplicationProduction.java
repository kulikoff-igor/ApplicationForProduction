package controller;

import workingWithDatabase.WorkingWithApplicationProduction;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by IT-1 on 24.02.14.
 */
public class AddingApplicationProduction extends HttpServlet {
    private final WorkingWithApplicationProduction db = new WorkingWithApplicationProduction();


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException,
            IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        Integer idApplication = Integer.parseInt(request.getParameter("idApplication"));
        String date = request.getParameter("date");
        String accord = request.getParameter("accord");
        String deliveryTime = request.getParameter("deliveryTime");
        db.addingApplicationsManufacturing(idApplication, date, accord,deliveryTime);
    }
}