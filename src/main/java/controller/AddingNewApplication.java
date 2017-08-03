package controller;

import workingWithDatabase.WorkWithDatabaseApplications;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;

/**
 * Created by IT-1 on 17.02.14.
 */
public class AddingNewApplication extends HttpServlet {
    private final WorkWithDatabaseApplications db = new WorkWithDatabaseApplications();


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException,
            IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        Integer idApplication = Integer.parseInt(request.getParameter("idApplication"));
        String date = request.getParameter("date");
        String organization = request.getParameter("organization");
        String terms = request.getParameter("terms");
        String perfomer = request.getParameter("perfomer");
        db.addingApplication(idApplication,date,organization,terms,perfomer);
    }
}
